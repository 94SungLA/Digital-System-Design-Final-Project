-- an alarm, takes current from clock and sets off an alarm when the time matches

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY alarm IS
    PORT (
        now_digit0 : IN INTEGER RANGE 0 TO 9;
        now_digit1 : IN INTEGER RANGE 0 TO 9;
        now_digit2 : IN INTEGER RANGE 0 TO 5;
        now_digit3 : IN INTEGER RANGE 0 TO 9;
        alarm_digit0 : IN INTEGER RANGE 0 TO 9;
        alarm_digit1 : IN INTEGER RANGE 0 TO 9;
        alarm_digit2 : IN INTEGER RANGE 0 TO 5;
        alarm_digit3 : IN INTEGER RANGE 0 TO 9;
        alarmo : OUT STD_LOGIC
    );

END alarm;

ARCHITECTURE Behavioral OF alarm IS
BEGIN
    alarmo <= '1' WHEN now_digit0 = alarm_digit0 AND now_digit1 = alarm_digit1 AND now_digit2 = alarm_digit2 AND now_digit3 = alarm_digit3 ELSE
        '0';
END Behavioral;