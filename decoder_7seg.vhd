-- decoder for 7-segment display
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY decoder_7seg IS
    PORT (
        --BCD : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        BCD : IN INTEGER RANGE 0 TO 9;
        HEX : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
END decoder_7seg;

ARCHITECTURE decoder_7seg OF decoder_7seg IS
BEGIN

    HEX <= "1000000" WHEN BCD = 0 ELSE
        "1111001" WHEN BCD = 1 ELSE
        "0100100" WHEN BCD = 2 ELSE
        "0110000" WHEN BCD = 3 ELSE
        "0011001" WHEN BCD = 4 ELSE
        "0010010" WHEN BCD = 5 ELSE
        "0000010" WHEN BCD = 6 ELSE
        "1111000" WHEN BCD = 7 ELSE
        "0000000" WHEN BCD = 8 ELSE
        "0010000" WHEN BCD = 9 ELSE
        "1111111";
END decoder_7seg;