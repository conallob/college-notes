-- $Id: 16bit_zero_fill.vhd,v 1.1 2004/05/11 13:20:17 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity 16bit_zero_fill is
    Port (input : in std_logic_vector(2 downto 0);
			  z : out std_logic_vector(15 downto 0)
			);
end 16bit_zero_fill;

architecture Behavioral of 16bit_zero_fill is

begin
 
process(input)

begin

	z <= ( input & "0000000000000");

end process;

end Behavioral;
