library verilog;
use verilog.vl_types.all;
entity pc8001 is
    port(
        I_CLK_21M       : in     vl_logic;
        I_nRESET        : in     vl_logic;
        vcoclk          : in     vl_logic;
        vtune           : out    vl_logic;
        usbclk          : in     vl_logic;
        clk_out         : out    vl_logic;
        usb_dp          : inout  vl_logic;
        usb_dm          : inout  vl_logic;
        ind             : out    vl_logic;
        O_A             : out    vl_logic_vector(14 downto 0);
        IO_D            : inout  vl_logic_vector(7 downto 0);
        O_nRD           : out    vl_logic;
        O_nWR           : out    vl_logic;
        O_nCS1          : out    vl_logic;
        O_nCS2          : out    vl_logic;
        y_out           : out    vl_logic_vector(3 downto 0);
        c_out           : out    vl_logic_vector(3 downto 0);
        beep_out        : out    vl_logic;
        motor           : out    vl_logic;
        debug           : out    vl_logic_vector(7 downto 0);
        O_nIORQ         : out    vl_logic;
        I_SW_0          : in     vl_logic;
        I_SW_1          : in     vl_logic
    );
end pc8001;
