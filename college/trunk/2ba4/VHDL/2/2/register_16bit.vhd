-- $Id: register_16bit.vhd,v 1.1 2004/05/11 21:16:00 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity register_16bit is
    Port ( 
	 	 CLK, DIN, LOAD : in std_logic;
       LOAD_DATA : in std_logic_vector(15 downto 0);
       DOUT : out std_logic 
		);

end register_16bit;

architecture Behavioral of register_16bit is

signal REG : std_logic_vector(15 downto 0);

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
