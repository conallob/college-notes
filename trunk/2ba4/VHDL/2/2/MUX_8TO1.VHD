-- $Id: MUX_8TO1.VHD,v 1.1 2004/05/13 11:35:31 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_8to1 is
    Port (
	 		 SEL : in std_logic_vector(2 downto 0);
	       A, B, C, D, E, F, G, H : in std_logic;
	       MUX_OUT : out std_logic
			 );
end mux_8to1;

architecture Behavioral of mux_8to1 is

begin

process (SEL, A, B, C, D, E, Fm, G, H)

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
