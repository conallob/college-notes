-- $Id: 16bit_zero_detect.vhd,v 1.1 2004/05/11 13:20:17 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity 16bit_zero_detect is
    Port (input : in std_logic_vector(15 downto 0);
			  z : out std_logic
			);
end 16bit_zero_detect;

architecture Behavioral of 16bit_zero_detect is

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
