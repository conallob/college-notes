-- $Id: splitter_16bit.vhd,v 1.2 2004/05/13 11:35:32 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity splitter_16bit is
    Port (input : in std_logic_vector(15 downto 0);
          output0, output1, output2, output3, output4, output5, output6, output7,
			 output8, output9, output10, output11, output12, output13, output14, output15 : out std_logic
			);
end splitter_16bit;

architecture Behavioral of splitter_16bit is

begin
 
process(input)
begin

output15 <= input(15);
output14 <= input(14);
output13 <= input(13);
output12 <= input(12);
output11 <= input(11);
output10 <= input(10);
output9 <= input(9);
output8 <= input(8);
output7 <= input(7);
output6 <= input(6);
output5 <= input(5);
output4 <= input(4);
output3 <= input(3);
output2 <= input(2);
output1 <= input(1);
output0 <= input(0);
 
end process;

end Behavioral;

