// megafunction wizard: %ALTSYNCRAM%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: altsyncram 

// ============================================================
// File Name: ARAMB4_S8_S8.v
// Megafunction Name(s):
// 			altsyncram
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
// ************************************************************


//Copyright (C) 1991-2003 Altera Corporation
//Any  megafunction  design,  and related netlist (encrypted  or  decrypted),
//support information,  device programming or simulation file,  and any other
//associated  documentation or information  provided by  Altera  or a partner
//under  Altera's   Megafunction   Partnership   Program  may  be  used  only
//to program  PLD  devices (but not masked  PLD  devices) from  Altera.   Any
//other  use  of such  megafunction  design,  netlist,  support  information,
//device programming or simulation file,  or any other  related documentation
//or information  is prohibited  for  any  other purpose,  including, but not
//limited to  modification,  reverse engineering,  de-compiling, or use  with
//any other  silicon devices,  unless such use is  explicitly  licensed under
//a separate agreement with  Altera  or a megafunction partner.  Title to the
//intellectual property,  including patents,  copyrights,  trademarks,  trade
//secrets,  or maskworks,  embodied in any such megafunction design, netlist,
//support  information,  device programming or simulation file,  or any other
//related documentation or information provided by  Altera  or a megafunction
//partner, remains with Altera, the megafunction partner, or their respective
//licensors. No other licenses, including any licenses needed under any third
//party's intellectual property, are provided herein.


module ARAMB4_S8_S8 (
	data_a,
	wren_a,
	address_a,
	data_b,
	address_b,
	wren_b,
	clock_a,
	enable_a,
	clock_b,
	enable_b,
	aclr_a,
	aclr_b,
	q_a,
	q_b);

	input	[7:0]  data_a;
	input	  wren_a;
	input	[8:0]  address_a;
	input	[7:0]  data_b;
	input	[8:0]  address_b;
	input	  wren_b;
	input	  clock_a;
	input	  enable_a;
	input	  clock_b;
	input	  enable_b;
	input	  aclr_a;
	input	  aclr_b;
	output	[7:0]  q_a;
	output	[7:0]  q_b;

	wire [7:0] sub_wire0;
	wire [7:0] sub_wire1;
	wire [7:0] q_a = sub_wire0[7:0];
	wire [7:0] q_b = sub_wire1[7:0];

	altsyncram	altsyncram_component (
				.clocken0 (enable_a),
				.clocken1 (enable_b),
				.wren_a (wren_a),
				.aclr0 (aclr_a),
				.clock0 (clock_a),
				.wren_b (wren_b),
				.aclr1 (aclr_b),
				.clock1 (clock_b),
				.address_a (address_a),
				.address_b (address_b),
				.data_a (data_a),
				.data_b (data_b),
				.q_a (sub_wire0),
				.q_b (sub_wire1));
	defparam
		altsyncram_component.operation_mode = "BIDIR_DUAL_PORT",
		altsyncram_component.width_a = 8,
		altsyncram_component.widthad_a = 9,
		altsyncram_component.numwords_a = 512,
		altsyncram_component.width_b = 8,
		altsyncram_component.widthad_b = 9,
		altsyncram_component.numwords_b = 512,
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.width_byteena_a = 1,
		altsyncram_component.width_byteena_b = 1,
		altsyncram_component.outdata_reg_a = "UNREGISTERED",
		altsyncram_component.outdata_aclr_a = "NONE",
		altsyncram_component.outdata_reg_b = "UNREGISTERED",
		altsyncram_component.indata_aclr_a = "CLEAR0",
		altsyncram_component.wrcontrol_aclr_a = "CLEAR0",
		altsyncram_component.address_aclr_a = "CLEAR0",
		altsyncram_component.indata_reg_b = "CLOCK1",
		altsyncram_component.address_reg_b = "CLOCK1",
		altsyncram_component.wrcontrol_wraddress_reg_b = "CLOCK1",
		altsyncram_component.indata_aclr_b = "CLEAR1",
		altsyncram_component.wrcontrol_aclr_b = "CLEAR1",
		altsyncram_component.address_aclr_b = "CLEAR1",
		altsyncram_component.outdata_aclr_b = "NONE",
		altsyncram_component.ram_block_type = "M4K",
		altsyncram_component.intended_device_family = "Stratix";


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: VarWidth NUMERIC "1"
// Retrieval info: PRIVATE: WIDTH_WRITE_A NUMERIC "8"
// Retrieval info: PRIVATE: WIDTH_WRITE_B NUMERIC "8"
// Retrieval info: PRIVATE: WIDTH_READ_A NUMERIC "8"
// Retrieval info: PRIVATE: WIDTH_READ_B NUMERIC "8"
// Retrieval info: PRIVATE: MEMSIZE NUMERIC "4096"
// Retrieval info: PRIVATE: Clock NUMERIC "5"
// Retrieval info: PRIVATE: rden NUMERIC "0"
// Retrieval info: PRIVATE: BYTE_ENABLE_A NUMERIC "0"
// Retrieval info: PRIVATE: BYTE_ENABLE_B NUMERIC "0"
// Retrieval info: PRIVATE: BYTE_SIZE NUMERIC "8"
// Retrieval info: PRIVATE: Clock_A NUMERIC "0"
// Retrieval info: PRIVATE: Clock_B NUMERIC "0"
// Retrieval info: PRIVATE: REGdata NUMERIC "1"
// Retrieval info: PRIVATE: REGwraddress NUMERIC "1"
// Retrieval info: PRIVATE: REGwren NUMERIC "1"
// Retrieval info: PRIVATE: REGrdaddress NUMERIC "0"
// Retrieval info: PRIVATE: REGrren NUMERIC "0"
// Retrieval info: PRIVATE: REGq NUMERIC "0"
// Retrieval info: PRIVATE: INDATA_REG_B NUMERIC "1"
// Retrieval info: PRIVATE: WRADDR_REG_B NUMERIC "1"
// Retrieval info: PRIVATE: OUTDATA_REG_B NUMERIC "0"
// Retrieval info: PRIVATE: CLRdata NUMERIC "1"
// Retrieval info: PRIVATE: CLRwren NUMERIC "1"
// Retrieval info: PRIVATE: CLRwraddress NUMERIC "1"
// Retrieval info: PRIVATE: CLRrdaddress NUMERIC "0"
// Retrieval info: PRIVATE: CLRrren NUMERIC "0"
// Retrieval info: PRIVATE: CLRq NUMERIC "0"
// Retrieval info: PRIVATE: BYTEENA_ACLR_A NUMERIC "0"
// Retrieval info: PRIVATE: INDATA_ACLR_B NUMERIC "1"
// Retrieval info: PRIVATE: WRCTRL_ACLR_B NUMERIC "1"
// Retrieval info: PRIVATE: WRADDR_ACLR_B NUMERIC "1"
// Retrieval info: PRIVATE: OUTDATA_ACLR_B NUMERIC "0"
// Retrieval info: PRIVATE: BYTEENA_ACLR_B NUMERIC "0"
// Retrieval info: PRIVATE: enable NUMERIC "1"
// Retrieval info: PRIVATE: READ_DURING_WRITE_MODE_MIXED_PORTS NUMERIC "2"
// Retrieval info: PRIVATE: BlankMemory NUMERIC "1"
// Retrieval info: PRIVATE: MIFfilename STRING ""
// Retrieval info: PRIVATE: UseLCs NUMERIC "0"
// Retrieval info: PRIVATE: RAM_BLOCK_TYPE NUMERIC "2"
// Retrieval info: PRIVATE: MAXIMUM_DEPTH NUMERIC "256"
// Retrieval info: PRIVATE: MEM_IN_BITS NUMERIC "1"
// Retrieval info: PRIVATE: OPERATION_MODE NUMERIC "3"
// Retrieval info: PRIVATE: UseDPRAM NUMERIC "1"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Stratix"
// Retrieval info: CONSTANT: OPERATION_MODE STRING "BIDIR_DUAL_PORT"
// Retrieval info: CONSTANT: WIDTH_A NUMERIC "8"
// Retrieval info: CONSTANT: WIDTHAD_A NUMERIC "9"
// Retrieval info: CONSTANT: NUMWORDS_A NUMERIC "512"
// Retrieval info: CONSTANT: WIDTH_B NUMERIC "8"
// Retrieval info: CONSTANT: WIDTHAD_B NUMERIC "9"
// Retrieval info: CONSTANT: NUMWORDS_B NUMERIC "512"
// Retrieval info: CONSTANT: LPM_TYPE STRING "altsyncram"
// Retrieval info: CONSTANT: WIDTH_BYTEENA_A NUMERIC "1"
// Retrieval info: CONSTANT: WIDTH_BYTEENA_B NUMERIC "1"
// Retrieval info: CONSTANT: OUTDATA_REG_A STRING "UNREGISTERED"
// Retrieval info: CONSTANT: OUTDATA_ACLR_A STRING "NONE"
// Retrieval info: CONSTANT: OUTDATA_REG_B STRING "UNREGISTERED"
// Retrieval info: CONSTANT: INDATA_ACLR_A STRING "CLEAR0"
// Retrieval info: CONSTANT: WRCONTROL_ACLR_A STRING "CLEAR0"
// Retrieval info: CONSTANT: ADDRESS_ACLR_A STRING "CLEAR0"
// Retrieval info: CONSTANT: INDATA_REG_B STRING "CLOCK1"
// Retrieval info: CONSTANT: ADDRESS_REG_B STRING "CLOCK1"
// Retrieval info: CONSTANT: WRCONTROL_WRADDRESS_REG_B STRING "CLOCK1"
// Retrieval info: CONSTANT: INDATA_ACLR_B STRING "CLEAR1"
// Retrieval info: CONSTANT: WRCONTROL_ACLR_B STRING "CLEAR1"
// Retrieval info: CONSTANT: ADDRESS_ACLR_B STRING "CLEAR1"
// Retrieval info: CONSTANT: OUTDATA_ACLR_B STRING "NONE"
// Retrieval info: CONSTANT: RAM_BLOCK_TYPE STRING "M4K"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Stratix"
// Retrieval info: USED_PORT: data_a 0 0 8 0 INPUT NODEFVAL data_a[7..0]
// Retrieval info: USED_PORT: wren_a 0 0 0 0 INPUT VCC wren_a
// Retrieval info: USED_PORT: q_a 0 0 8 0 OUTPUT NODEFVAL q_a[7..0]
// Retrieval info: USED_PORT: q_b 0 0 8 0 OUTPUT NODEFVAL q_b[7..0]
// Retrieval info: USED_PORT: address_a 0 0 9 0 INPUT NODEFVAL address_a[8..0]
// Retrieval info: USED_PORT: data_b 0 0 8 0 INPUT NODEFVAL data_b[7..0]
// Retrieval info: USED_PORT: address_b 0 0 9 0 INPUT NODEFVAL address_b[8..0]
// Retrieval info: USED_PORT: wren_b 0 0 0 0 INPUT VCC wren_b
// Retrieval info: USED_PORT: clock_a 0 0 0 0 INPUT NODEFVAL clock_a
// Retrieval info: USED_PORT: enable_a 0 0 0 0 INPUT VCC enable_a
// Retrieval info: USED_PORT: clock_b 0 0 0 0 INPUT NODEFVAL clock_b
// Retrieval info: USED_PORT: enable_b 0 0 0 0 INPUT VCC enable_b
// Retrieval info: USED_PORT: aclr_a 0 0 0 0 INPUT GND aclr_a
// Retrieval info: USED_PORT: aclr_b 0 0 0 0 INPUT GND aclr_b
// Retrieval info: CONNECT: @data_a 0 0 8 0 data_a 0 0 8 0
// Retrieval info: CONNECT: @wren_a 0 0 0 0 wren_a 0 0 0 0
// Retrieval info: CONNECT: q_a 0 0 8 0 @q_a 0 0 8 0
// Retrieval info: CONNECT: q_b 0 0 8 0 @q_b 0 0 8 0
// Retrieval info: CONNECT: @address_a 0 0 9 0 address_a 0 0 9 0
// Retrieval info: CONNECT: @data_b 0 0 8 0 data_b 0 0 8 0
// Retrieval info: CONNECT: @address_b 0 0 9 0 address_b 0 0 9 0
// Retrieval info: CONNECT: @wren_b 0 0 0 0 wren_b 0 0 0 0
// Retrieval info: CONNECT: @clock0 0 0 0 0 clock_a 0 0 0 0
// Retrieval info: CONNECT: @clocken0 0 0 0 0 enable_a 0 0 0 0
// Retrieval info: CONNECT: @clock1 0 0 0 0 clock_b 0 0 0 0
// Retrieval info: CONNECT: @clocken1 0 0 0 0 enable_b 0 0 0 0
// Retrieval info: CONNECT: @aclr0 0 0 0 0 aclr_a 0 0 0 0
// Retrieval info: CONNECT: @aclr1 0 0 0 0 aclr_b 0 0 0 0
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all