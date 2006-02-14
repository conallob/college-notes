-- $Id: reg.vhd,v 1.1 2004/04/14 14:22:39 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity reg is
    Port ( 
	 	 CLK, DIN, LOAD : in STD_LOGIC;
       LOAD_DATA : in STD_LOGIC_VECTOR(3 downto 0);
       DOUT : out STD_LOGIC_VECTOR(3 downto 0)
		);
end reg;

architecture Behavioral of reg is
begin
process (CLK)
variable r : STD_LOGIC_VECTOR(3 downto 0);
begin
   if CLK'event and CLK='1' then
   	if (LOAD='1') then
     		r := LOAD_DATA;
   	else
     		r := DIN & r(3 downto 1);
   	end if;
   end if;
 DOUT <= r;
end process;

end Behavioral;
