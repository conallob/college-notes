-- $Id: 6to1mux.vhd,v 1.1 2004/02/25 15:51:04 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity 6to1mux is
    Port (
	 		 SEL : in STD_LOGIC_VECTOR(2 downto 0);
	       A, B, C, D, E, F : in STD_LOGIC;
	       MUX_OUT : out STD_LOGIC;
			 );
end 6to1mux;

architecture Behavioral of 6to1mux is

begin

process (SEL, A, B, C, D, E, F)
begin
   case SEL is
      when "000" => MUX_OUT <= A;
      when "001" => MUX_OUT <= B;
      when "010" => MUX_OUT <= C;
      when "011" => MUX_OUT <= D;
		when "100" => MUX_OUT <= E;
		when "101" => MUX_OUT <= F;
	   when others => NULL;
   end case;
end process;

end Behavioral;
