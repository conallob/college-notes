-- $Id: zero_fill_16bit.vhd,v 1.1 2004/05/11 21:16:01 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity zero_fill_16bit is
    Port (input : in std_logic_vector(2 downto 0);
			  z : out std_logic_vector(15 downto 0)
			);
end zero_fill_16bit;

architecture Behavioral of zero_fill_16bit is

begin
 
process(input)

begin

	z <= ( input & "0000000000000");

end process;

end Behavioral;
