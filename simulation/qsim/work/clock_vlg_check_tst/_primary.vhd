library verilog;
use verilog.vl_types.all;
entity clock_vlg_check_tst is
    port(
        digit0          : in     vl_logic_vector(3 downto 0);
        digit1          : in     vl_logic_vector(3 downto 0);
        digit2          : in     vl_logic_vector(3 downto 0);
        digit3          : in     vl_logic_vector(3 downto 0);
        dot             : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end clock_vlg_check_tst;
