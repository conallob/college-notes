-- $Id: 16bit_logic.vhd,v 1.1 2004/05/11 13:20:17 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity 16bit_logic is
    Port (
	 		 SEL : in STD_LOGIC_VECTOR(1 downto 0);
	       A, B : in STD_LOGIC_VECTOR(15 downto 0);
	       MUX_OUT : out STD_LOGIC_VECTOR(15 downto 0)
			 );
end 16bit_logic;

architecture Behavioral of 16bit_logic is

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
