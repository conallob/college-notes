-- $Id: XOR.VHD,v 1.1 2004/05/13 11:35:31 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity xor_gate is
    Port (
	 		 a, b : in std_logic;
			 output : out std_logic
			);
end xor_gate;

architecture Behavioral of xor_gate is

begin
 
process(a, b)

begin

	output <= a xor b;

end process;

end Behavioral;
