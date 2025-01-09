library verilog;
use verilog.vl_types.all;
entity clock is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        SW              : in     vl_logic;
        SW1             : in     vl_logic;
        SW2             : in     vl_logic;
        btn             : in     vl_logic;
        btn1            : in     vl_logic;
        digit0          : out    vl_logic_vector(3 downto 0);
        digit1          : out    vl_logic_vector(3 downto 0);
        digit2          : out    vl_logic_vector(3 downto 0);
        digit3          : out    vl_logic_vector(3 downto 0);
        dot             : out    vl_logic
    );
end clock;
