-- $Id: decoder.vhd,v 1.1 2004/04/14 21:52:36 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity decoder is
    Port (
    	   RESET, CLK : in STD_LOGIC;
    	   D_IN: in STD_LOGIC_VECTOR(2 downto 0); 
    	   D_OUT : out STD_LOGIC_VECTOR(7 downto 0)
	 		);
end decoder;

architecture Behavioral of decoder is

begin
 
process(CLK,RESET,D_IN)
begin
 
if ( RESET = '1') then
   D_OUT <= "00000000";
elsif ( CLK'event and CLK ='1') then 
   case D_IN is
      when "000" => D_OUT <= "00000001";
      when "001" => D_OUT <= "00000010";
      when "010" => D_OUT <= "00000100";
      when "011" => D_OUT <= "00001000";
      when "100" => D_OUT <= "00010000";
      when "101" => D_OUT <= "00100000";
		when "110" => D_OUT <= "01000000";
		when "111" => D_OUT <= "10000000";
      when others => NULL;
   end case;
end if;
end process;

end Behavioral;
