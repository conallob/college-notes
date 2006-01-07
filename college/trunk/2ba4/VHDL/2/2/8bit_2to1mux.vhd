-- $Id: 8bit_2to1mux.vhd,v 1.1 2004/05/11 13:20:17 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity 8bit_2to1mux is
    Port (
    		SEL : in STD_LOGIC;
		   A, B : in STD_LOGIC_VECTOR(7 downto 0);
       	MUX_OUT : out STD_LOGIC_VECTOR(7 downto 0);
			);
end 8bit_2to1mux;

architecture Behavioral of 8bit_2to1mux is

begin

process (SEL, A, B)
begin
   case SEL is
      when "0" => MUX_OUT <= A;
      when "1" => MUX_OUT <= B;
	   when others => NULL;
   end case;
end process;

end Behavioral;
