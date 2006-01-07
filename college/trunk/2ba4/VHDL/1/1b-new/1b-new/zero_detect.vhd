-- $Id: zero_detect.vhd,v 1.1 2004/04/14 21:52:36 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity zero_detect is
    Port (input : in std_logic_vector(3 downto 0);
			  z : out std_logic
			);
end zero_detect;

architecture Behavioral of zero_detect is

begin
 
process(input)

begin

	if input = "0000" then
		z <= '1';
	else
		z <= '0';
	end if;

end process;

end Behavioral;
