library verilog;
use verilog.vl_types.all;
entity clockgen is
    port(
        refclk          : in     vl_logic;
        vcoclk          : in     vl_logic;
        vtune           : out    vl_logic;
        clk_out         : out    vl_logic
    );
end clockgen;
