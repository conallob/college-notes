-- $Id: mux_2to1_16bit.vhd,v 1.1 2004/05/11 21:16:00 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_2to1_16bit is
    Port (
    		SEL : in std_logic;
			A, B : in std_logic_vector(15 downto 0);
       	MUX_OUT : out std_logic_vector(15 downto 0)
		);

end mux_2to1_16bit;

architecture Behavioral of mux_2to1_16bit is

begin

process (SEL, A, B)
begin
   case SEL is
      when "0" => MUX_OUT <= A;
      when "1" => MUX_OUT <= B;
	   when others => NULL;
   end case;
end process;

end Behavioral;
