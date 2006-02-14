-- $Id: alu_splitter.vhd,v 1.1 2004/05/13 11:35:31 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity alu_splitter is
    Port (input : in std_logic_vector(3 downto 0);
	 		 sel : out std_logic_vector(1 downto 0);
          s2, c_in : out std_logic
			);
end alu_splitter;

architecture Behavioral of alu_splitter is

begin
 
process(input)
begin

s2 <= input(3);
sel <= input(2 downto 1);
c_in <= input(0);
 
end process;

end Behavioral;

