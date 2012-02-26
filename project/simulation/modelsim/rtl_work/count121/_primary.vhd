library verilog;
use verilog.vl_types.all;
entity count121 is
    port(
        clk             : in     vl_logic;
        ci              : in     vl_logic;
        load            : in     vl_logic;
        d               : in     vl_logic_vector(3 downto 0);
        q               : out    vl_logic_vector(3 downto 0)
    );
end count121;
