library verilog;
use verilog.vl_types.all;
entity fz80 is
    port(
        data_in         : in     vl_logic_vector(7 downto 0);
        reset_in        : in     vl_logic;
        clk             : in     vl_logic;
        adr             : out    vl_logic_vector(15 downto 0);
        intreq          : in     vl_logic;
        nmireq          : in     vl_logic;
        busreq          : in     vl_logic;
        start           : out    vl_logic;
        mreq            : out    vl_logic;
        iorq            : out    vl_logic;
        rd              : out    vl_logic;
        wr              : out    vl_logic;
        data_out        : out    vl_logic_vector(7 downto 0);
        busack_out      : out    vl_logic;
        intack_out      : out    vl_logic;
        mr              : out    vl_logic;
        m1              : out    vl_logic;
        radr            : out    vl_logic_vector(15 downto 0);
        nmiack_out      : out    vl_logic;
        waitreq         : in     vl_logic
    );
end fz80;
