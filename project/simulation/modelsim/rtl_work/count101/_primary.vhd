library verilog;
use verilog.vl_types.all;
entity count101 is
    port(
        clk             : in     vl_logic;
        set1            : in     vl_logic;
        ci              : in     vl_logic;
        co              : out    vl_logic;
        load            : in     vl_logic;
        d               : in     vl_logic_vector(3 downto 0);
        q               : out    vl_logic_vector(3 downto 0)
    );
end count101;
