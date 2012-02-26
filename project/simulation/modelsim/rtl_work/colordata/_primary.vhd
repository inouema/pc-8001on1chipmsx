library verilog;
use verilog.vl_types.all;
entity colordata is
    port(
        clk             : in     vl_logic;
        adr             : in     vl_logic_vector(4 downto 0);
        data            : out    vl_logic_vector(3 downto 0)
    );
end colordata;
