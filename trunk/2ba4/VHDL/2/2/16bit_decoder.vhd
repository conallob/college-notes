-- $Id: 16bit_decoder.vhd,v 1.1 2004/05/11 13:20:17 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity 16bit_decoder is
    Port (
    	   RESET, CLK : in std_logic;
    	   D_IN: in std_logic_vector(3 downto 0); 
    	   D_OUT : out std_logic_vector(8 downto 0)
	 		);
end 16bit_decoder;

architecture Behavioral of 16bit_decoder is

begin
 
process(CLK, RESET, D_IN)
begin
 
if ( RESET = '1') then
   D_OUT <= "000000000";
elsif ( CLK'event and CLK ='1') then 
   case D_IN is
      when "0000" => D_OUT <= "000000001";
      when "0001" => D_OUT <= "000000010";
      when "0010" => D_OUT <= "000000100";
      when "0011" => D_OUT <= "000001000";
      when "0100" => D_OUT <= "000010000";
      when "0101" => D_OUT <= "000100000";
		when "0110" => D_OUT <= "001000000";
		when "0111" => D_OUT <= "010000000";
		when "1000" => D_OUT <= "100000000";
      when others => NULL;
   end case;
end if;
end process;

end Behavioral;
