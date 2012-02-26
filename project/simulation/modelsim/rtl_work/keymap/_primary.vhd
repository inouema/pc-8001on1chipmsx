library verilog;
use verilog.vl_types.all;
entity keymap is
    port(
        clk             : in     vl_logic;
        adr             : in     vl_logic_vector(7 downto 0);
        data            : out    vl_logic_vector(7 downto 0)
    );
end keymap;
