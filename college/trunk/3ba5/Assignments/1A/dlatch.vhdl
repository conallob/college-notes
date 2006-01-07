-- $Id$

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity dlatch is
	Port ( 
	 	 CLK, RESET : in STD_LOGIC;
       	 DIN : in STD_LOGIC_VECTOR(31 downto 0);
       	 OUTPUT : out STD_LOGIC_VECTOR(31 downto 0)
		);
end dlatch;

architecture Behavioral of dlatch is

begin
 
process (CLK)

begin
	if CLK'event and CLK='1' then
   		if RESET='1' then 
     		OUTPUT <= "00000000000000000000000000000000";
   		else
     		OUTPUT <= DIN;
   		end if;
	end if;
end process;
 
end Behavioral;