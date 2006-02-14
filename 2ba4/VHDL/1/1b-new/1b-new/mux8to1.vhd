-- $Id: mux8to1.vhd,v 1.1 2004/04/14 21:52:36 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux8to1 is
    Port (
    		SEL : in STD_LOGIC_VECTOR(2 downto 0);
		   A, B, C, D, E, F, G, H : in STD_LOGIC;
       	MUX_OUT : out STD_LOGIC
			);
end mux8to1;

architecture Behavioral of mux8to1 is

begin

process (SEL, A, B, C, D, E, F, G, H)
begin
   case SEL is
      when "000" => MUX_OUT <= A;
      when "001" => MUX_OUT <= B;
		when "010" => MUX_OUT <= C;
		when "011" => MUX_OUT <= D;
		when "100" => MUX_OUT <= E;
		when "101" => MUX_OUT <= F;
		when "110" => MUX_OUT <= G;
		when "111" => MUX_OUT <= H;
	   when others => NULL;
   end case;
end process;

end Behavioral;
