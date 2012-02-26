library verilog;
use verilog.vl_types.all;
entity count10c is
    port(
        clk             : in     vl_logic;
        clr             : in     vl_logic;
        ci              : in     vl_logic;
        co              : out    vl_logic;
        load            : in     vl_logic;
        d               : in     vl_logic_vector(3 downto 0);
        q               : out    vl_logic_vector(3 downto 0)
    );
end count10c;
