--a functional clock can set between 12/24 hour mode and can be set to any time
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY clock IS
    PORT (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        SW : IN STD_LOGIC; -- 0 = 12 hour mode, 1 = 24 hour mode
        SW1 : IN STD_LOGIC; -- 0 = set time, 1 = normal operation
        SW2 : IN STD_LOGIC; -- 0 = set hour, 1 = set minute
        btn : IN STD_LOGIC; -- increment time
        --btn1 : IN STD_LOGIC; -- decrement time
        digit0 : OUT INTEGER RANGE 0 TO 9;
        digit1 : OUT INTEGER RANGE 0 TO 9;
        digit2 : OUT INTEGER RANGE 0 TO 9;
        digit3 : OUT INTEGER RANGE 0 TO 9;
        dot : OUT STD_LOGIC -- if 12 hour mode, dot = 0, else dot = 1

    );
END clock;

ARCHITECTURE Behavioral OF clock IS
    SIGNAL h : INTEGER RANGE 0 TO 23 := 0; -- hours
    SIGNAL m : INTEGER RANGE 0 TO 59 := 0; -- minutes

    COMPONENT hms_to_digits
        PORT (
            h : IN INTEGER RANGE 0 TO 23;
            m : IN INTEGER RANGE 0 TO 59;
            digit0 : OUT INTEGER RANGE 0 TO 9;
            digit1 : OUT INTEGER RANGE 0 TO 9;
            digit2 : OUT INTEGER RANGE 0 TO 5;
            digit3 : OUT INTEGER RANGE 0 TO 9
        );
    END COMPONENT;

    COMPONENT clock_12_24
        PORT (
            h : IN INTEGER RANGE 0 TO 23;
            m : IN INTEGER RANGE 0 TO 59;
            --dot : OUT STD_LOGIC;
            h12 : OUT INTEGER RANGE 0 TO 12
        );
    END COMPONENT;

    SIGNAL h12 : INTEGER RANGE 0 TO 12;
    SIGNAL sec : INTEGER RANGE 0 TO 59 := 0;
    --original clk:50MHz, clock : 1Hz
    --SIGNAL clk_div : STD_LOGIC_VECTOR(24 DOWNTO 0) := "1111010000100100000000000"; -- 50_000_000
    --SIGNAL clk_cnt : STD_LOGIC_VECTOR(24 DOWNTO 0); --generate 1Hz clock
    --SIGNAL clk_1Hz : STD_LOGIC := '0';
    SIGNAL digit0_24 : INTEGER RANGE 0 TO 9;
    SIGNAL digit1_24 : INTEGER RANGE 0 TO 9;
    SIGNAL digit2_24 : INTEGER RANGE 0 TO 9;
    SIGNAL digit3_24 : INTEGER RANGE 0 TO 9;

    SIGNAL digit0_12 : INTEGER RANGE 0 TO 9;
    SIGNAL digit1_12 : INTEGER RANGE 0 TO 9;
    SIGNAL digit2_12 : INTEGER RANGE 0 TO 5;
    SIGNAL digit3_12 : INTEGER RANGE 0 TO 9;
BEGIN

    -- PROCESS (clk, reset)
    -- BEGIN
    --     IF reset = '0' THEN
    --         clk_cnt <= (OTHERS => '0');
    --     ELSIF clk'EVENT AND clk = '1' THEN
    --         IF clk_cnt = clk_div THEN
    --             clk_cnt <= (OTHERS => '0');
    --         ELSE
    --             clk_cnt <= clk_cnt + 1;
    --         END IF;
    --     END IF;
    -- END PROCESS;
    -- clk_1Hz <= clk_cnt(24); -- 1Hz clock

    PROCESS (clk, reset)
    BEGIN
        IF reset = '0' THEN
            h <= 0;
            m <= 0;
            sec <= 0;
        ELSIF clk'EVENT AND clk = '1' THEN
            IF SW1 = '0' THEN -- set time
                IF SW2 = '0' THEN -- set hour
                    IF btn = '0' THEN -- increment hour
                        IF h = 23 THEN
                            h <= 0;
                        ELSE
                            h <= h + 1;
                        END IF;
                    END IF;
                END IF;
                IF SW2 = '1' THEN -- set minute
                    IF btn = '0' THEN -- increment minute
                        IF m = 59 THEN
                            m <= 0;
                        ELSE
                            m <= m + 1;
                        END IF;
                    END IF;
                END IF;
            ELSE -- normal operation
                IF sec = 59 THEN
                    sec <= 0;
                    IF m = 59 THEN
                        m <= 0;
                        IF h = 23 THEN
                            h <= 0;
                        ELSE
                            h <= h + 1;
                        END IF;
                    ELSE
                        m <= m + 1;
                    END IF;
                ELSE
                    sec <= sec + 1;
                END IF;

            END IF;

        END IF;
    END PROCESS;

    dot <= '0' WHEN SW = '0' ELSE
        '1';

    hms_to_digits_inst : hms_to_digits
    PORT MAP(
        h => h,
        m => m,
        digit0 => digit0_24,
        digit1 => digit1_24,
        digit2 => digit2_24,
        digit3 => digit3_24
    );

    clock_12_24_inst : clock_12_24
    PORT MAP(
        h => h,
        m => m,
        h12 => h12
    );

    hms_to_digits_inst_12 : hms_to_digits
    PORT MAP(
        h => h12,
        m => m,
        digit0 => digit0_12,
        digit1 => digit1_12,
        digit2 => digit2_12,
        digit3 => digit3_12
    );

    digit0 <= digit0_24 WHEN SW = '1' ELSE
        digit0_12;
    digit1 <= digit1_24 WHEN SW = '1' ELSE
        digit1_12;
    digit2 <= digit2_24 WHEN SW = '1' ELSE
        digit2_12;
    digit3 <= digit3_24 WHEN SW = '1' ELSE
        digit3_12;

END Behavioral;