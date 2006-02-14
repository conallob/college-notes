-- $Id: 2to1mux.vhd,v 1.1 2004/02/25 15:51:04 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity 2to1mux is
    Port (
    		SEL, A, B : in STD_LOGIC;
       	MUX_OUT : out STD_LOGIC;
			);
end 2to1mux;

architecture Behavioral of 2to1mux is

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
