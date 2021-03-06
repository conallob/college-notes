-- $Id: zero_detect_16bit.vhd,v 1.1 2004/05/11 21:16:01 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity zero_detect_16bit is
    Port (input : in std_logic_vector(15 downto 0);
			  z : out std_logic
			);
end zero_detect_16bit;

architecture Behavioral of zero_detect_16bit is

begin
 
process(input)

begin

	if input = "0000000000000000" then
		z <= '1';
	else
		z <= '0';
	end if;

end process;

end Behavioral;
