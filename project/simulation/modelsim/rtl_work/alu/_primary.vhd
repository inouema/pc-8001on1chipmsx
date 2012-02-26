library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        c_in            : in     vl_logic;
        im              : in     vl_logic_vector(7 downto 0);
        a               : in     vl_logic_vector(7 downto 0);
        b               : in     vl_logic_vector(7 downto 0);
        inva            : in     vl_logic;
        invb            : in     vl_logic;
        reg_q_c         : in     vl_logic;
        reg_q_h         : in     vl_logic;
        s_and           : in     vl_logic;
        s_or            : in     vl_logic;
        s_xor           : in     vl_logic;
        ec              : in     vl_logic;
        i_daa           : in     vl_logic;
        set             : in     vl_logic;
        res             : in     vl_logic;
        l               : in     vl_logic;
        r               : in     vl_logic;
        z               : out    vl_logic_vector(7 downto 0);
        co              : out    vl_logic_vector(7 downto 0)
    );
end alu;
