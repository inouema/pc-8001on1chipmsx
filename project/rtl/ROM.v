//-----------------------------------------------------
// Design Name : rom_using_case
// File Name   : rom_using_case.v
// Function    : ROM using case
// Coder       : Deepak Kumar Tala
//-----------------------------------------------------
module rom_using_case (
address , // Address input
clock,
q      // Data output
//read_en , // Read Enable 
//ce        // Chip Enable
);

input        clock;
input [14:0] address;
output [7:0] q;
//input read_en;
//input ce;

reg [7:0] q;
       
always @ (posedge clock)
begin
  case (address)
    15'h0000 : q = 8'hFF;
	 15'h0001 : q = 8'hFF;
	 15'h0002 : q = 8'hFF;
	 15'h0003 : q = 8'hFF;
	 15'h0004 : q = 8'hFF;
	 15'h0005 : q = 8'hFF;
	 15'h0006 : q = 8'hFF;
	 15'h0007 : q = 8'hFF;
	 15'h0008 : q = 8'hFF;
	 15'h0009 : q = 8'hFF;
	 15'h000A : q = 8'hFF;
	 15'h000B : q = 8'hFF;
	 15'h000C : q = 8'hFF;
	 15'h000D : q = 8'hFF;
	 15'h000E : q = 8'hFF;
	 15'h000F : q = 8'hFF;
	 15'h0010 : q = 8'hFF;
	 15'h0011 : q = 8'hFF;
	 15'h0012 : q = 8'hFF;
	 15'h0013 : q = 8'hFF;
	 15'h0014 : q = 8'hFF;
	 15'h0015 : q = 8'hFF;
	 15'h0016 : q = 8'hFF;
	 15'h0017 : q = 8'hFF;
	 15'h0018 : q = 8'hFF;
	 15'h0019 : q = 8'hFF;
	 15'h001A : q = 8'hFF;
	 15'h001B : q = 8'hFF;
	 15'h001C : q = 8'hFF;
	 15'h001D : q = 8'hFF;
	 15'h001E : q = 8'hFF;
	 15'h001F : q = 8'hFF;
  endcase
end

endmodule