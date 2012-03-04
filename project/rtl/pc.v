//***************************************************************************************
// PC-8001 on the DE0 Altera CycloneIII version.
//
// Copyright (c) 2012 Masato INOUE
//***************************************************************************************
//
// Permission is hereby granted, free of charge, to any person obtaining a 
// copy of this software and associated documentation files (the "Software"), 
// to deal in the Software without restriction, including without limitation 
// the rights to use, copy, modify, merge, publish, distribute, sublicense, 
// and/or sell copies of the Software, and to permit persons to whom the 
// Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included 
// in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
// CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
// TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
// SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


/////////////////////////////////////////////////////////////////////////////
// INCLUDE FILES
/////////////////////////////////////////////////////////////////////////////
//`include src/switch.v


/////////////////////////////////////////////////////////////////////////////
// MACRO
/////////////////////////////////////////////////////////////////////////////

////// DEBUG
//`define ICE
//`define TESTROM
`define PROTECT

////// USE CPU SELECTION
`define MCPU_FZ80


//`define USE_BOOT
//`define USE_BEEP_ON_OFF_ROM

/////////////////////////////////////////////////////////////////////////////
// PC-8001 I/O Interface
/////////////////////////////////////////////////////////////////////////////
module pc8001(
	      I_CLK_21M, // Board Clock 21MHz.
          I_nRESET,  // Board Reset. Low Active.
          I_CLK_EXT, // External Clock.

`ifdef ICE
	      sclk,
	      sdata,
`endif
          vtune,
          clk_out,
          IO_USB_DP,
          IO_USB_DM,
          ind,

          O_A,    // ROM/RAM Address Bus.
          IO_D,   // ROM/RAM Data Bus.
          O_nRD,  // ROM/RAM OE.
          O_nWR,  // RAM Write
          O_nCS1, // ROM Chip Select.
          O_nCS2, // RAM Chip Select.

	      y_out,
          c_out,

	      beep_out,
          motor,

          debug,
			 
		  I_SW_0,
		  I_SW_1
          );

   output [7:0] debug;
   
   input I_CLK_21M;
   input I_nRESET;
   input I_CLK_EXT;
   
   input I_SW_0;
   input I_SW_1;

   output [14:0]  O_A;
   inout  [ 7:0]  IO_D;
   output        O_nRD;
   output        O_nWR;
   output        O_nCS1;
   output        O_nCS2;


`ifdef ICE
   input sclk;
   output sdata;
`endif
   
   output vtune;
   output clk_out;
   output ind;
   output [3:0] y_out;
   output [3:0] c_out;
   
   inout        IO_USB_DP;
   inout        IO_USB_DM;

   output       beep_out;
   output       motor;


/////////////////////////////////////////////////////////////////////////////
// wire & register decralation
/////////////////////////////////////////////////////////////////////////////

   wire [16:0]  w_o_address;
   assign       O_A  = w_o_address[14:0];
 //  wire [ 7:0]  w_io_data;

   wire         w_rom_n_ce;
   assign       O_nCS1 = w_rom_n_ce;
   wire         w_ram_n_ce;
   assign       O_nCS2 = w_ram_n_ce;
   
   wire         w_romram_n_oe;
   assign       O_nRD = w_romram_n_oe;
   wire         w_ram_n_we;
   assign       O_nWR = w_ram_n_we;


   wire [15:0]  cpu_adr;
//   wire         boot_ram_ce_n;
//   wire         boot_ram_oe_n;
//   wire         boot_ram_we_n;
//   wire [16:0]  boot_adr;
   wire [16:0]  dma_adr;
//   wire [7:0]   boot_data;

   wire [ 7:0]   cpu_data_in;
   wire [ 7:0]   cpu_data_out;
   wire [ 7:0]   kbd_data;
   wire [ 7:0]   w_iplrom_do;
 
   wire         cpu_reset_n;
   wire         mreq;
   
   wire         iorq;
   wire         rd;
   wire         wr;
   wire         busreq;
   wire         busack;
//   wire [7:0] boot_data_out;

`ifdef ICE
	reg ice_enable = 0;
`endif

//	reg [ 4:0] waitcount = 0;
   reg [ 5:0]  waitcount = 0;
   
	wire start, waitreq;

	wire cdata;


`ifdef TESTROM
   wire  testrom_g;
   wire [ 7:0] testrom_data;
`endif

   reg [ 5:0]  vrtc = 0;
   reg        iorq0 = 0;
   reg        rd0 = 0;
   reg        port40h0 = 0;
   reg        reset1 = 0;
   reg        reset2 = 0;
	
	wire   w_i_sw_0;
	assign w_i_sw_0 = I_SW_0;
	
	wire   w_i_sw_1;
	assign w_i_sw_1 = I_SW_1;
	
	reg [ 7:0] r_sw_0_filter;
	reg [ 7:0] r_sw_1_filter;


// DEBUG : AAAAA  for Use Inside ROM/RAM
   wire [ 7:0] w_inside_ram_data;


/////////////////////////////////////////////////////////////////////////////
// Clock generate with ALT PLL
/////////////////////////////////////////////////////////////////////////////

   wire        w_clk_28m; // dotclk 14.3MHz x 2
   wire        w_clk_48m; //
   wire        w_clk_12m; // ukp clock
   wire        clk;
   reg         r_clk;
   reg [1:0]   r_clk_12m;  // usb clock
   
   pll0	system_clk (
	.inclk0 ( I_CLK_21M ),
	.c0 (w_clk_28m),
    .c1 (w_clk_48m),
	.locked ()
	);

   // 14.3MHz Video Clock
   always @(posedge w_clk_28m) begin
   	  r_clk <= ~r_clk;
   end
   assign clk = r_clk;

   // 12MHz ukp clk (48MHz/4)
   always @(posedge w_clk_48m) begin
      r_clk_12m <= r_clk_12m + 2'b01;
   end
   assign w_clk_12m = r_clk_12m[1];



	assign waitreq = start | waitcount < 21;

	always @(posedge clk) begin
		if (start) waitcount <= 0;
		else waitcount <= waitcount + 1;
	end



//
// Reset fillter
//
   wire w_n_reset;
   assign w_n_reset = I_nRESET;

   always @(posedge clk) begin
	  reset1 <= ~w_n_reset;
	  reset2 <= reset1;
   end

// wire reset = ~cpu_reset_n | ~reset1 & reset2;
   wire reset = ~reset1 & reset2;


// I/O Device's
   wire port30h = cpu_adr[7:4] == 4'h3;
   wire port40h = cpu_adr[7:4] == 4'h4;
   wire port80h = cpu_adr[7:4] == 4'h8;
   wire porte0h = cpu_adr[7:3] == 5'b11100;
   wire portefh = cpu_adr[7:0] == 8'hef;

   // MEMO
   // CPU ADDRESS
   // 0b xxxx-xxxx-****-xxxx (16bit)
   // **** = 0000(0x0) : keyboard
   // **** = 0100(0x4) : RTC(?)
   // **** = 1000(0x8) : keyboard
   // **** = 1110(0xE) : 

   wire [7:0] port00data;
   wire [7:0] port40data;
   wire [7:0] porte0data;

   assign      port00data = ~kbd_data;
   assign      port40data = { 2'b00, vrtc[5], cdata, 4'b1010 };
 //  assign    porte0data = boot_data_out;
   assign      porte0data = 8'hFF;

   reg [7:0]   input_data;

	function [7:0] selin;
		input [3:0] sel;
		input [23:0] a;
			case (sel)
				4'h0: selin = a[23:16]; // keyboard
				4'h4: selin = a[15:8];  // rtc
				4'h8: selin = a[23:16]; // keyboard
				4'he: selin = a[7:0];   // boot
				default: selin = 8'hff;
			endcase
	endfunction // selin

   always @(posedge clk) 
	 input_data <= selin(cpu_adr[7:4], { port00data, port40data, porte0data });


//	assign cpu_data_in = iorq ? input_data :
//`ifdef TESTROM
//	testrom_g ? testrom_data : 
//`endif
//	ram_data;

//
// --- Z80 Data Input Data Selector
//
   wire [ 7:0]       w_memmory_data;
   assign            w_memmory_data = (w_ram_n_ce == 1'b0) ? w_inside_ram_data : w_iplrom_do;

   function [7:0] f_selector_indata;
      input iorq;
      input rd;
      input [7:0] port_data;
      input [7:0] memmory_data;

      if     (iorq)       f_selector_indata = port_data;
      else if(rd)         f_selector_indata = memmory_data;
      else                f_selector_indata = 8'hFF;
   endfunction // f_selector_indata

`ifdef USE_BEEP_ON_OFF_ROM
   assign   cpu_data_in = f_selector_indata(iorq, rd, input_data, w_memmory_data);
`else
   assign   cpu_data_in = f_selector_indata(iorq, rd, input_data, IO_D);
`endif


	always @(posedge clk) begin
		if (~iorq & iorq0 & rd0 & port40h0) vrtc <= vrtc + 1;
		iorq0 <= iorq;
		rd0 <= rd;
		port40h0 <= port40h;
`ifdef ICE
		if (iorq & wr & portefh) ice_enable <= cpu_data_out[0];
`endif
	end



/////////////////////////////////////////////////////////////////////////////
// Z80 core
/////////////////////////////////////////////////////////////////////////////
`ifdef MCPU_KX_Z80
	kx_z80 kx_z80(
		.data_in(cpu_data_in),
		.data_out(cpu_data_out),
		.reset_in(reset),
		.clk(clk),
		.intreq(1'b0),
		.nmireq(1'b0),
		.busreq(busreq), 
		.mreq(mreq),
		.iorq(iorq),
		.rd(rd),
		.wr(wr),
		.busack_out(busack),
		.adr(cpu_adr),
		.waitreq(waitreq),
`ifdef ICE
		.ice_enable(ice_enable),
		.sclk(sclk),
		.sdata(sdata),
`endif // `ifdef ICE
		.start(start)
	);
`endif //  `ifdef MCPU_KX_Z80


//----------- FZ80 -----------
`ifdef MCPU_FZ80
   fz80 Z80(
             .data_in(cpu_data_in),
             //.data_in(w_iplrom_do),
             .reset_in(reset),
             .clk(clk),
             .adr(cpu_adr),
             .intreq(1'b0),
             .nmireq(1'b0),
             .busreq(busreq),
             .start(start),
             .mreq(mreq),
             .iorq(iorq),
             .rd(rd),
             .wr(wr),
             .data_out(cpu_data_out),
             .busack_out(busack),
             .intack_out(),
             .mr(),
             .m1(m1),
             //  .halt(halt),
             .radr(),
             .nmiack_out(),
             .waitreq(waitreq)
             );
`endif



//----------- TV80 -----------
`ifdef MCPU_TV80

wire [15:0] ZA;
wire [7:0] ZDO,ZDI;
wire ZMREQ_n,ZIORQ_n,ZM1_n,ZRD_n,ZWR_n, ZRFSH_n;
wire ZCLK, ZINT_n, ZRESET_n, ZWAIT_n;
tv80c Z80(
  .reset_n(ZRESET_n),
  .clk(ZCLK),
  .A(ZA), .do(ZDO), .di(ZDI),
  .m1_n(ZM1_n), .mreq_n(ZMREQ_n), .iorq_n(ZIORQ_n), 
  .rd_n(ZRD_n), .wr_n(ZWR_n),
  .wait_n(ZWAIT_n), .rfsh_n(ZRFSH_n),
  .int_n(ZINT_n), .nmi_n(1'b1),.busrq_n(1'b1),
  .halt_n(), .busak_n()
);
`endif


/////////////////////////////////////////////////////////////////////////////
// IPL ROM (BEEP ON/OFF program)
/////////////////////////////////////////////////////////////////////////////
`ifdef USE_BEEP_ON_OFF_ROM

altip_inside_rom beeprom (
	.address ( cpu_adr[14:0] ),
    .clken   ( ~w_rom_n_ce ),
	.clock   ( clk ),
	.q       ( w_iplrom_do )
	);

`endif


/////////////////////////////////////////////////////////////////////////////
// INSIDE RAM 32KByte
/////////////////////////////////////////////////////////////////////////////
`ifdef USE_BEEP_ON_OFF_ROM
altip_inside_ram_32KB  inside_ram(
	.address ( cpu_adr [14:0]),
	.clken   ( ~w_ram_n_ce),
	.clock   ( clk ),
	.data    ( w_io_data ),
	.wren    ( ~w_ram_n_we ),
	.q       ( w_inside_ram_data )
);
`endif

   
   
/////////////////////////////////////////////////////////////////////////////
// BOOT
/////////////////////////////////////////////////////////////////////////////
`ifdef USE_BOOT   
   boot boot(
			 .clk(clk), 
			 .ata_reset_n(ata_reset_n),
			 .ata_cs_n(ata_cs_n),
			 .ata_iord_n(ata_iord_n),
			 .ata_iowr_n(ata_iowr_n),
			 .ata_adr(ata_adr),
			 .ata_data(ata_data),
			 .ram_ce_n(boot_ram_ce_n), 
			 .ram_oe_n(boot_ram_oe_n),
			 .ram_we_n(boot_ram_we_n), 
			 .ram_adr(boot_adr),
			 .ram_data(boot_data),
			 .cpu_cs(porte0h),
			 .cpu_adr(cpu_adr[2:0]), 
			 .cpu_iord(iorq & rd),
			 .cpu_iowr(iorq & wr),
			 .data_in(cpu_data_out),
			 .data_out(boot_data_out),
			 .cpu_reset_n(cpu_reset_n)
			 );
`endif //  `ifdef USE_BOOT



/////////////////////////////////////////////////////////////////////////////
// CRTC
/////////////////////////////////////////////////////////////////////////////
   crtc crtc(
             .clk        (clk),
             .y_out      (y_out),
             .c_out      (c_out),
             .port30h_we (iorq & wr & start & cpu_adr[7:4] == 4'h3),
		     .crtc_we    (iorq & wr & start & cpu_adr[7:4] == 4'h5),
		     .adr        (cpu_adr[0]),
		     .data       (cpu_data_out),
		     .busreq     (busreq),
             .busack     (busack),
		     .ram_adr    (dma_adr),
             .ram_data   (IO_D)
             );

`ifdef TESTROM
	assign testrom_g = cpu_adr[15:11] == 5'b01100; // 6000h-67ffh
	testrom testrom(clk, cpu_adr[10:0], testrom_data);
`endif

`ifdef PROTECT
	wire narrow_wr = wr & ~start & (cpu_adr[15] | cpu_adr[14] & cpu_adr[13]);
`else
//	wire narrow_wr = wr & ~start;
//   	wire narrow_wr = wr & ;
`endif


/////////////////////////////////////////////////////////////////////////////
// RAM
/////////////////////////////////////////////////////////////////////////////
//   function [16:0] f_selector_address_17bit;
//      input busack;
//      input [16:0] dma_adr;
//      input [16:0] cpu_adr;
//	  if (busack)  f_selector_address_17bit = dma_adr;
//	  else         f_selector_address_17bit = cpu_adr;
//   endfunction // f_selector_address_17bit
//   assign w_o_address  = sel17(busack, dma_adr, { 1'b0, cpu_adr });
   assign        w_o_address   = busack ? dma_adr[14:0] : cpu_adr[14:0];
  // assign        w_o_address   = busack ? dma_adr : cpu_adr[14:0];
   assign        w_ram_n_ce    = busack ? 1'b0    : cpu_adr[15] ? ~mreq : 1'b1;
   assign        w_romram_n_oe = busack ? 1'b0    : (~mreq | ~rd);
   assign        w_ram_n_we    = busack ? 1'b1    : (~mreq | ~wr);



/////////////////////////////////////////////////////////////////////////////
// ROM
/////////////////////////////////////////////////////////////////////////////
   assign        w_rom_n_ce = busack ? 1'b1 : cpu_adr[15];
// assign        w_io_data =  (wr & ~busack) ? cpu_data_out : 8'hzz;
   assign        IO_D =       (wr & ~busack) ? cpu_data_out : 8'hzz;


//   function [7:0] f_selector_data_8bit;
//      input write;
//      input [7:0] data;
//	  if  (write) sel8 = data;
//	  else        sel8 = 8'hZZ;
//   endfunction // f_selector_data_8bit
//   assign        w_io_data = sel8(wr & ~busack, cpu_data_out);


/////////////////////////////////////////////////////////////////////////////
// UKP
/////////////////////////////////////////////////////////////////////////////

	wire [3:0] kbd_adr;
	assign kbd_adr[0] = cpu_adr[0] | port80h;
	assign kbd_adr[1] = cpu_adr[1] | port80h;
	assign kbd_adr[2] = cpu_adr[2] | port80h;
	assign kbd_adr[3] = cpu_adr[3] | port80h;
	ukp ukp(.clk(clk), .vcoclk(w_clk_48m), .vtune(vtune), .usbclk(w_clk_12m),
	.clk_out(clk_out), .usb_dm(IO_USB_DM), .usb_dp(IO_USB_DP), .record_n(ind),
	.kbd_adr(kbd_adr[3:0]), .kbd_data(kbd_data));
	//
	// RTC
	//
	reg [3:0] cin;
	reg cstb, cclk;
	always @(posedge clk) begin
		if (iorq & wr) begin
			if (cpu_adr[7:4] == 4'h1) cin <= cpu_data_out[3:0];
			if (cpu_adr[7:4] == 4'h4) begin
				cstb <= cpu_data_out[1];
				cclk <= cpu_data_out[2];
			end
		end
	end
	rtc rtc(.clk(clk), .cstb(cstb), .cclk(cclk), .cin(cin), .cdata(cdata), .ind());


/////////////////////////////////////////////////////////////////////////////
// BEEP
/////////////////////////////////////////////////////////////////////////////
   reg [11:0] beep_cnt;
   reg        beep_osc;
   reg        beep_gate;
   wire       beep_cy = beep_cnt == 2499;

	always @(posedge clk) begin
		beep_cnt <= beep_cy ? 0 : beep_cnt + 1;
		if (beep_cy) beep_osc <= ~beep_osc;
	end

	always @(posedge clk) begin
//		if (iorq & wr & port40h) beep_gate <= cpu_data_out[5];
		if (iorq & wr & port40h) beep_gate <= cpu_data_out[0];
	end

// AAAAA: debug
//	assign beep_out = beep_gate & beep_osc;
   assign beep_out = beep_gate;


/////////////////////////////////////////////////////////////////////////////
// MOTOR
/////////////////////////////////////////////////////////////////////////////
	reg motor = 0;

	always @(posedge clk) begin
		if (iorq & wr & port30h) motor <= cpu_data_out[3];
	end

endmodule // module pc



/////////////////////////////////////////////////////////////////////////////
// E.O.F
/////////////////////////////////////////////////////////////////////////////
