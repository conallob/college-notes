-- $Id: mux_9to1.vhd,v 1.1 2004/05/11 21:16:00 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_9to1 is
    Port (
	 		 SEL : in std_logic_vector(3 downto 0);
	       A, B, C, D, E, F, G, H, I : in std_logic;
	       MUX_OUT : out std_logic
			 );
end mux_9to1;

architecture Behavioral of mux_9to1 is

begin

process (SEL, A, B, C, D, E, F, G, H, I)

begin
   case SEL is
      when "0000" => MUX_OUT <= A;
      when "0001" => MUX_OUT <= B;
      when "0010" => MUX_OUT <= C;
      when "0011" => MUX_OUT <= D;
		when "0100" => MUX_OUT <= E;
		when "0101" => MUX_OUT <= F;
		when "0110" => MUX_OUT <= G;
		when "0111" => MUX_OUT <= H;
		when "1000" => MUX_OUT <= I;
	   when others => NULL;
   end case;
end process;

end Behavioral;
