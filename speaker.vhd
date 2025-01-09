library ieee;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY speaker IS
    PORT (
        alarmo : IN STD_LOGIC;
		  led : OUT STD_LOGIC_VECTOR(9 downto 0)
	 );
END speaker;

ARCHITECTURE Behavioral OF speaker IS
BEGIN
    led <= "1111111111" when alarmo = '1' else
	     "0000000000";
END Behavioral;