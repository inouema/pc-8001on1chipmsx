library verilog;
use verilog.vl_types.all;
entity asu is
    port(
        a               : in     vl_logic_vector(15 downto 0);
        b               : in     vl_logic_vector(7 downto 0);
        ci              : in     vl_logic;
        i               : in     vl_logic_vector(2 downto 0);
        z               : out    vl_logic_vector(15 downto 0);
        co              : out    vl_logic
    );
end asu;
