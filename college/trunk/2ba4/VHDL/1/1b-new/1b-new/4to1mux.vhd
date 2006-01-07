-- $Id: 4to1mux.vhd,v 1.1 2004/04/14 21:52:36 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity 4to1mux is
    Port (
	 		 SEL : in STD_LOGIC_VECTOR(1 downto 0);
	       A, B, C, D : in STD_LOGIC;
	       MUX_OUT : out STD_LOGIC;
			 );
end 4to1mux;

architecture Behavioral of 4to1mux is

begin

process (SEL, A, B, C, D)
begin
   case SEL is
      when "00" => MUX_OUT <= A;
      when "01" => MUX_OUT <= B;
      when "10" => MUX_OUT <= C;
      when "11" => MUX_OUT <= D;
	   when others => NULL;
   end case;
end process;

end Behavioral;
