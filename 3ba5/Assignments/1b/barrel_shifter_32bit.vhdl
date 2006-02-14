-- $Id$

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity barrel_shifter_32bit is
	Port (
		s: in std_logic_vector(4 downto 0);
		input: in std_logic_vector(31 downto 0);
		output: out std_logic_vector(31 downto 0)
		);
end barrel_shifter_32bit;

architecture Behavioral of barrel_shifter_32bit is

signal sel_a: std_logic_vector(1 downto 0);
signal sel_b: std_logic_vector(2 downto 0);
signal c: std_logic_vector(31 downto 0);

begin

sel_a <= s(1 downto 0);
sel_b <= s(4 downto 2);
 
process(sel_a,input)
  begin
   case sel_a is 
      when "00" =>   --shift by 0
         c <= input;
      when "01" =>   --shift by 1
         c(31) <= input(0);
         c(30 downto 0) <= input(31 downto 1);
      when "10" =>   --shift by 2
         c(31 downto 30) <= input(1 downto 0);
         c(29 downto 0) <= input(31 downto 2);
      when "11" =>   --shift by 3
         c(31 downto 29) <= input(2 downto 0);
         c(28 downto 0) <= input(31 downto 3);
      when others =>  
         c <= input;
   end case;
end process;
 
process(sel_b,c)
   begin
   case sel_b is 
      when "000" =>   --shift by 0 more
         output <= c;
      when "001" =>   --shift by 4 more
         output(31 downto 28) <= c(3 downto 0);
         output(27 downto 0) <= c(31 downto 4);
      when "010" =>   --shift by 8 more
         output(31 downto 24) <= c(7 downto 0);
         output(23 downto 0) <= c(31 downto 8);
      when "011" =>   --shift by 12 more
         output(31 downto 20) <= c(11 downto 0);
         output(19 downto 0) <= c(31 downto 12);
      when "100" =>   --shift by 16 more
         output(31 downto 16) <= c(15 downto 0);
         output(15 downto 0) <= c(31 downto 16);
     when "101" =>   --shift by 20 more
         output(31 downto 12) <= c(19 downto 0);
         output(11 downto 0) <= c(31 downto 20);
     when "110" =>   --shift by 24 more
         output(31 downto 8) <= c(23 downto 0);
         output(7 downto 0) <= c(31 downto 24);
     when "111" =>   --shift by 30 more
         output(31 downto 4) <= c(27 downto 0);
         output(3 downto 0) <= c(31 downto 28);
      when others =>  
         output <= c;
   end case;

end process;

end Behavioral;