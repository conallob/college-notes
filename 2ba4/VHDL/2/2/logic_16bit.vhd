-- $Id: logic_16bit.vhd,v 1.1 2004/05/11 21:16:00 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity logic_16bit is
    Port (
	 		 SEL : in std_logic_vector(1 downto 0);
	       A, B : in std_logic_vector(15 downto 0);
	       MUX_OUT : out std_logic_vector(15 downto 0)
			 );
end logic_16bit;

architecture Behavioral of logic_16bit is

begin

process (SEL, A, B)
begin
   case SEL is
      when "00" => MUX_OUT <= (A and B);
      when "01" => MUX_OUT <= (A or B);
      when "10" => MUX_OUT <= (A xor B);
      when "11" => MUX_OUT <= (not A);
	   when others => NULL;
   end case;
end process;

end Behavioral;
