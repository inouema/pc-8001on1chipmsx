library verilog;
use verilog.vl_types.all;
entity reg_pcl is
    port(
        a               : in     vl_logic_vector(7 downto 0);
        a2              : in     vl_logic_vector(7 downto 0);
        a3              : in     vl_logic_vector(2 downto 0);
        load            : in     vl_logic;
        load2           : in     vl_logic;
        load3           : in     vl_logic;
        count           : in     vl_logic;
        dec             : in     vl_logic;
        clr             : in     vl_logic;
        load66          : in     vl_logic;
        clk             : in     vl_logic;
        q               : out    vl_logic_vector(7 downto 0);
        co              : out    vl_logic
    );
end reg_pcl;
