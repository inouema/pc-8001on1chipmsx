`timescale 1ns/1ns

module pc8001tv; // test vench

   reg vclk ; // vertual clock
   reg nrst ;
   wire [ 7:0]  w_z80data;
  
   wire [14:0] addr;
   wire        nrd;
   wire        nwr;
   wire        ncs1;
   wire        ncs2;
   wire        beep;
   wire [ 7:0] w_debug;
   wire        w_niorq;

   parameter   step = 1000;


   // vclk
   always begin
      vclk = 0; #(step/2);
      vclk = 1; #(step/2);
   end

//   always @(posedge vclk) begin
//       r_z80data <= w_rom_data;
//   end
   
   
   pc8001 pc8001 (
	              .I_CLK_21M(vclk),
                  .I_nRESET(nrst),
                  .O_A(addr),
                  .IO_D(w_z80data),
                  .O_nRD(nrd),
                  .O_nWR(nwr),
                  .O_nCS1(ncs1),
                  .O_nCS2(ncs2),
                  .debug(w_debug),
                  .O_nIORQ(w_niorq),
	              .beep_out(beep)
                  );


   initial begin
      #0
        vclk = 0;
        nrst = 1'b0;

      #(step*20)
        nrst = 1'b1;

      #(step * 10000)
        $finish;
   end
endmodule // pc8001


