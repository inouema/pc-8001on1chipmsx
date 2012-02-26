library verilog;
use verilog.vl_types.all;
entity reg_quad3 is
    port(
        a               : in     vl_logic_vector(7 downto 0);
        a2              : in     vl_logic_vector(7 downto 0);
        a3              : in     vl_logic_vector(7 downto 0);
        load            : in     vl_logic;
        load2           : in     vl_logic;
        load3           : in     vl_logic;
        regsel          : in     vl_logic;
        i_dd            : in     vl_logic;
        i_fd            : in     vl_logic;
        clk             : in     vl_logic;
        q               : out    vl_logic_vector(7 downto 0)
    );
end reg_quad3;
