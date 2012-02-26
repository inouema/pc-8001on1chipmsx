library verilog;
use verilog.vl_types.all;
entity rtc is
    port(
        clk             : in     vl_logic;
        cstb            : in     vl_logic;
        cclk            : in     vl_logic;
        cin             : in     vl_logic_vector(3 downto 0);
        cdata           : out    vl_logic;
        ind             : out    vl_logic
    );
end rtc;
