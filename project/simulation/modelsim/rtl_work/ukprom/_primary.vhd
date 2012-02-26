library verilog;
use verilog.vl_types.all;
entity ukprom is
    port(
        clk             : in     vl_logic;
        adr             : in     vl_logic_vector(9 downto 0);
        data            : out    vl_logic_vector(3 downto 0)
    );
end ukprom;
