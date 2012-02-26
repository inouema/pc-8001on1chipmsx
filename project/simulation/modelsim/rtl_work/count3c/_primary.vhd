library verilog;
use verilog.vl_types.all;
entity count3c is
    port(
        clk             : in     vl_logic;
        ci              : in     vl_logic;
        clr             : in     vl_logic;
        load            : in     vl_logic;
        d               : in     vl_logic_vector(1 downto 0);
        q               : out    vl_logic_vector(1 downto 0)
    );
end count3c;
