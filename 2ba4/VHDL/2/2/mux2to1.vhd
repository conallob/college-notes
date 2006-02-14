-- $Id: mux2to1.vhd,v 1.1 2004/05/11 13:20:17 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux2to1 is
    Port (
    		SEL : in STD_LOGIC;
		   A, B : in STD_LOGIC_VECTOR(3 downto 0);
       	MUX_OUT : out STD_LOGIC_VECTOR(3 downto 0)
			);
end mux2to1;

architecture Behavioral of mux2to1 is

begin

process (SEL, A, B)
begin
   case SEL is
      when '0' => MUX_OUT <= A;
      when '1' => MUX_OUT <= B;
	   when others => NULL;
   end case;
end process;

end Behavioral;
