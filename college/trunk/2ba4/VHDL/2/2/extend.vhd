-- $Id: extend.vhd,v 1.3 2004/05/13 11:35:31 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


entity extend is
	Port(
     	dr, sb: in std_logic_vector(2 downto 0);
     	extend_out : out std_logic_vector(15 downto 0)
		);
end extend;
 
architecture Behavioral of extend is 

begin

process(dr, sb)
begin

	extend_out(2 downto 0) <= sb;
	extend_out(5 downto 3) <= dr;

	if dr(2) = '1' then
         extend_out(15 downto 6) <= "1111111111";
	else
         extend_out(15 downto 6) <= "0000000000";
	end if;

end process;

end Behavioral;
