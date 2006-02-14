-- $Id$

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity d-latch is
	Port ( 
	 	 CLK, RESET : in STD_LOGIC;
       	 DIN : in STD_LOGIC_VECTOR(31 downto 0);
       	 OUTPUT : out STD_LOGIC_VECTOR(31 downto 0)
		);
end d-latch;

architecture Behavioral of d-latch is

begin
 
process (CLK, DIN, RESET)

begin
	if CLK'event and CLK='1' then
   		if RESET='1' then 
     		OUTPUT <= '00000000000000000000000000000000';
   		else
     		OUTPUT <= DIN;
   		end if;
	end if;
end process;
 
end Behavioral;