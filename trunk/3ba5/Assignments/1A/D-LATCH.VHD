-- $Id$

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity d-latch is
	Port ( 
	 	 CLK, INPUT, LOAD : in STD_LOGIC;
       	 OUTPUT : out STD_LOGIC_VECTOR(31 downto 0)
		);
end d-latch;

architecture Behavioral of d-latch is

begin
 
process (CLK, INPUT, RESET)

begin
	if CLK'event and CLK='1' then
   		if RESET='1' then   --RESET active High
     		OUTPUT <= '0';
   		else
     		OUTPUT <= INPUT;
   		end if;
	end if;
end process;
 
end Behavioral;