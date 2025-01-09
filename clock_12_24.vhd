-- component use to convert 24 hour time to 12 hour time

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY clock_12_24 IS
    PORT (
        h : IN INTEGER RANGE 0 TO 23;
        m : IN INTEGER RANGE 0 TO 59;
        h12 : OUT INTEGER RANGE 0 TO 12
    );
END clock_12_24;

ARCHITECTURE Behavioral OF clock_12_24 IS
BEGIN
    h12 <= h - 12 WHEN h > 12 ELSE
        h;
END Behavioral;