library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity addr_counter is

	Port ( 
		 CLK, RESET: in STD_LOGIC;
		 COUNT: inout STD_LOGIC_VECTOR(5 downto 0);
		 );
	
end addr_counter;

architecture Behavioral of addr_counter is

begin

process (CLK, RESET) 
begin
	if RESET='1' then 
		COUNT <= "000000";
		elsif CLK='1' and CLK'event then
               	COUNT <= COUNT + 1;
		end if;
	end if;
end process;

end Behavioral;