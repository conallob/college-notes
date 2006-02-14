-- $Id: v_n_check_16bit.vhd,v 1.1 2004/05/13 11:35:32 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity n_check_16bit is
    Port (input : in std_logic_vector(15 downto 0);
			 n : out std_logic
			);
end n_check_16bit;

architecture Behavioral of n_check_16bit is

begin
 
process(input)

begin

	if input(15) = '1' then
		n <= '1';
	else
		n <= '0';
	end if;


end process;

end Behavioral;
