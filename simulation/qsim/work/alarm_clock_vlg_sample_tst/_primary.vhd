library verilog;
use verilog.vl_types.all;
entity alarm_clock_vlg_sample_tst is
    port(
        btn             : in     vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        SW              : in     vl_logic;
        SW1             : in     vl_logic;
        SW2             : in     vl_logic;
        SW3             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end alarm_clock_vlg_sample_tst;
