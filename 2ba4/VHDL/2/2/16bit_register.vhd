-- $Id: 16bit_register.vhd,v 1.1 2004/05/11 13:20:17 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity 16bit_register is
    Port ( 
	 	 CLK, DIN, LOAD : in STD_LOGIC;
       LOAD_DATA : in STD_LOGIC_VECTOR(15 downto 0);
       DOUT : out STD_LOGIC; 
		);

end 16bit_register;

architecture Behavioral of 16bit_register is

signal REG : STD_LOGIC_VECTOR(15 downto 0);

begin

process (CLK)
begin
   if CLK'event and CLK='1' then
   if (LOAD='1') then
     REG <= LOAD_DATA;
   else
        REG <= DIN & REG(15 downto 1);
   end if;
   end if;
 DOUT <= REG(0);
end process;

end Behavioral;
