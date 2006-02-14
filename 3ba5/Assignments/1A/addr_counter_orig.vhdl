library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity addr_counter is

	Port ( 
		 CLK, RESET: in STD_LOGIC;
		 OUTPUT: out STD_LOGIC_VECTOR(5 downto 0)
		 );
	
end addr_counter;



process (CLK)

begin
	OUTPUT <= "000000";
	if CLK='1' and CLK'event then
		if RESET='1' then
			OUTPUT <= "000000";
		else
          	OUTPUT <= OUTPUT + 1;
		end if;
	end if;
end process;

end Behavioral;