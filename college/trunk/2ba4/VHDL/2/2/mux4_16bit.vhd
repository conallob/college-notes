-- $Id: mux4_16bit.vhd,v 1.1 2004/05/13 11:35:32 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_4to1_16bit is
    Port (
	 		 SEL : in std_logic_vector(1 downto 0);
	       A, B, C, D : in std_logic_vector(15 downto 0);
	       MUX_OUT : out std_logic_vector(15 downto 0)
			 );
end mux_4to1_16bit;

architecture Behavioral of mux_4to1_16bit is

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
