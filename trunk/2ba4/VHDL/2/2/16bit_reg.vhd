-- $Id: 16bit_reg.vhd,v 1.1 2004/05/11 13:20:17 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity 16bit_reg is
    Port ( 
	 	 CLK, DIN, LOAD : in STD_LOGIC;
       LOAD_DATA : in STD_LOGIC_VECTOR(15 downto 0);
       DOUT : out STD_LOGIC_VECTOR(15 downto 0)
		);
end 16bit_reg;

architecture Behavioral of 16bit_reg is
begin
process (CLK)
variable r : STD_LOGIC_VECTOR(15 downto 0);
begin
   if CLK'event and CLK='1' then
   	if (LOAD='1') then
     		r := LOAD_DATA;
   	else
     		r := DIN & r(15 downto 1);
   	end if;
   end if;
 DOUT <= r;
end process;

end Behavioral;
