library verilog;
use verilog.vl_types.all;
entity crtc is
    generic(
        START_H         : integer := 192;
        END_H           : vl_notype;
        START_V         : integer := 40;
        END_V           : vl_notype;
        CHCNT_RESET_V   : vl_notype
    );
    port(
        clk             : in     vl_logic;
        y_out           : out    vl_logic_vector(3 downto 0);
        c_out           : out    vl_logic_vector(3 downto 0);
        port30h_we      : in     vl_logic;
        crtc_we         : in     vl_logic;
        adr             : in     vl_logic;
        data            : in     vl_logic_vector(7 downto 0);
        busreq          : out    vl_logic;
        busack          : in     vl_logic;
        ram_ce_n        : out    vl_logic;
        ram_oe_n        : out    vl_logic;
        ram_we_n        : out    vl_logic;
        ram_adr         : out    vl_logic_vector(16 downto 0);
        ram_data        : in     vl_logic_vector(7 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of START_H : constant is 1;
    attribute mti_svvh_generic_type of END_H : constant is 3;
    attribute mti_svvh_generic_type of START_V : constant is 1;
    attribute mti_svvh_generic_type of END_V : constant is 3;
    attribute mti_svvh_generic_type of CHCNT_RESET_V : constant is 3;
end crtc;
