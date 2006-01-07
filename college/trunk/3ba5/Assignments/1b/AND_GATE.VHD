-- $Id: XOR.VHD 240 2004-05-13 11:35:32Z conall $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity and_gate is
		Port (
	 		 a, b : in std_logic;
			 output : out std_logic
			);
end and_gate;

architecture Behavioral of and_gate is

begin
 
process(a, b)

begin

	output <= (a and b);

end process;

end Behavioral;
