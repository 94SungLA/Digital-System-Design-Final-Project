-- h m to 4 digits
-- 4 digits are 0-2, 0-3, 0-5, 0-9

LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY hms_to_digits IS
    PORT (
        h : IN INTEGER RANGE 0 TO 23;
        m : IN INTEGER RANGE 0 TO 59;
        digit0 : OUT INTEGER RANGE 0 TO 9;
        digit1 : OUT INTEGER RANGE 0 TO 9;
        digit2 : OUT INTEGER RANGE 0 TO 5;
        digit3 : OUT INTEGER RANGE 0 TO 9
    );
END hms_to_digits;

-- consume h = 23, m = 59 -> 2 3 5 9
ARCHITECTURE Behavioral OF hms_to_digits IS
BEGIN
    digit0 <= h / 10; -- 2
    digit1 <= h MOD 10; -- 3
    digit2 <= m / 10; -- 5
    digit3 <= m MOD 10; -- 9
END Behavioral;