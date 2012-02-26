library verilog;
use verilog.vl_types.all;
entity ukp is
    generic(
        S_OPCODE        : integer := 0;
        S_LDI0          : integer := 1;
        S_LDI1          : integer := 2;
        S_B0            : integer := 3;
        S_B1            : integer := 4
    );
    port(
        clk             : in     vl_logic;
        vcoclk          : in     vl_logic;
        usbclk          : in     vl_logic;
        vtune           : out    vl_logic;
        clk_out         : out    vl_logic;
        usb_dm          : inout  vl_logic;
        usb_dp          : inout  vl_logic;
        record_n        : out    vl_logic;
        kbd_adr         : in     vl_logic_vector(3 downto 0);
        kbd_data        : out    vl_logic_vector(7 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of S_OPCODE : constant is 1;
    attribute mti_svvh_generic_type of S_LDI0 : constant is 1;
    attribute mti_svvh_generic_type of S_LDI1 : constant is 1;
    attribute mti_svvh_generic_type of S_B0 : constant is 1;
    attribute mti_svvh_generic_type of S_B1 : constant is 1;
end ukp;
