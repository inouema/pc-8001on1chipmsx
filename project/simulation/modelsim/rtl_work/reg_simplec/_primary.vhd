library verilog;
use verilog.vl_types.all;
entity reg_simplec is
    port(
        a               : in     vl_logic_vector(7 downto 0);
        load            : in     vl_logic;
        clr             : in     vl_logic;
        clk             : in     vl_logic;
        q               : out    vl_logic_vector(7 downto 0)
    );
end reg_simplec;
