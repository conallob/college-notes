-- $Id: splitter.vhd,v 1.1 2004/04/14 21:52:36 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity splitter is
    Port ( input : in std_logic_vector(7 downto 0);
           output0, output2, output1, output3, output4, output5, output6, output7 : out std_logic
			);
end splitter;

architecture Behavioral of splitter is

begin
 
process(input)
begin

output0 <= input(0);
output1 <= input(1);
output2 <= input(2);
output3 <= input(3);
output4 <= input(4);
output5 <= input(5);
output6 <= input(6);
output7 <= input(7);
 
end process;

end Behavioral;

