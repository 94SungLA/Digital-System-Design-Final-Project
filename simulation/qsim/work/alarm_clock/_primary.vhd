library verilog;
use verilog.vl_types.all;
entity alarm_clock is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        SW              : in     vl_logic;
        SW1             : in     vl_logic;
        SW2             : in     vl_logic;
        SW3             : in     vl_logic;
        btn             : in     vl_logic;
        seg0            : out    vl_logic_vector(6 downto 0);
        seg1            : out    vl_logic_vector(6 downto 0);
        seg2            : out    vl_logic_vector(6 downto 0);
        seg3            : out    vl_logic_vector(6 downto 0);
        alarmo          : out    vl_logic;
        dot             : out    vl_logic;
        hour            : out    vl_logic_vector(4 downto 0);
        minute          : out    vl_logic_vector(5 downto 0)
    );
end alarm_clock;
