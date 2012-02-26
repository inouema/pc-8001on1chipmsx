library verilog;
use verilog.vl_types.all;
entity altip_inside_ram_32KB is
    port(
        address         : in     vl_logic_vector(14 downto 0);
        clken           : in     vl_logic;
        clock           : in     vl_logic;
        data            : in     vl_logic_vector(7 downto 0);
        wren            : in     vl_logic;
        q               : out    vl_logic_vector(7 downto 0)
    );
end altip_inside_ram_32KB;
