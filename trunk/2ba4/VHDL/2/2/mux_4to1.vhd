-- $Id: mux_4to1.vhd,v 1.1 2004/05/11 21:16:00 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_4to1 is
    Port (
	 		 SEL : in std_logic_vector(1 downto 0);
	       A, B, C, D : in std_logic;
	       MUX_OUT : out std_logic
			 );
end mux_4to1;

architecture Behavioral of mux_4to1 is

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
