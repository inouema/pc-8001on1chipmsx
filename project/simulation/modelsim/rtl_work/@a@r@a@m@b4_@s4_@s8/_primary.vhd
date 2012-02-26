library verilog;
use verilog.vl_types.all;
entity ARAMB4_S4_S8 is
    port(
        data_a          : in     vl_logic_vector(3 downto 0);
        wren_a          : in     vl_logic;
        address_a       : in     vl_logic_vector(9 downto 0);
        data_b          : in     vl_logic_vector(7 downto 0);
        address_b       : in     vl_logic_vector(8 downto 0);
        wren_b          : in     vl_logic;
        clock_a         : in     vl_logic;
        enable_a        : in     vl_logic;
        clock_b         : in     vl_logic;
        enable_b        : in     vl_logic;
        aclr_a          : in     vl_logic;
        aclr_b          : in     vl_logic;
        q_a             : out    vl_logic_vector(3 downto 0);
        q_b             : out    vl_logic_vector(7 downto 0)
    );
end ARAMB4_S4_S8;
