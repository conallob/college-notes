-- $Id: WHATSIT.VHD,v 1.1 2004/05/13 11:35:31 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity whatsit is
    Port (input1 : in std_logic_vector(2 downto 0);
          input2 : in std_logic;
			 output : out std_logic_vector(3 downto 0)
			);
end whatsit;

architecture Behavioral of whatsit is

begin
 
process(input1, input2)
begin

output <= input2 & input1;
 
end process;

end Behavioral;

