-- $Id: decoder.vhd,v 1.3 2004/03/03 13:54:54 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity decoder is
    Port (
    	   RESET, CLK : in STD_LOGIC;
    	   D_IN: in STD_LOGIC_VECTOR(2 downto 0); 
    	   D_OUT : out STD_LOGIC_VECTOR(5 downto 0)
	 		);
end decoder;

architecture Behavioral of decoder is

begin
 
process(CLK,RESET,D_IN)
begin
 
if ( RESET = '1') then
   D_OUT <= "000000";
elsif ( CLK'event and CLK ='1') then 
   case D_IN is
      when "000" => D_OUT <= "000001";
      when "001" => D_OUT <= "000010";
      when "010" => D_OUT <= "000100";
      when "011" => D_OUT <= "001000";
      when "100" => D_OUT <= "010000";
      when "101" => D_OUT <= "100000";
      when others => NULL;
   end case;
end if;
end process;

end Behavioral;
