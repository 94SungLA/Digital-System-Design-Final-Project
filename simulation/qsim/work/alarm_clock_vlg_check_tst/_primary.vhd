library verilog;
use verilog.vl_types.all;
entity alarm_clock_vlg_check_tst is
    port(
        alarmo          : in     vl_logic;
        dot             : in     vl_logic;
        hour            : in     vl_logic_vector(4 downto 0);
        minute          : in     vl_logic_vector(5 downto 0);
        seg0            : in     vl_logic_vector(6 downto 0);
        seg1            : in     vl_logic_vector(6 downto 0);
        seg2            : in     vl_logic_vector(6 downto 0);
        seg3            : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end alarm_clock_vlg_check_tst;
