-- $Id: reg_16bit.vhd,v 1.2 2004/05/13 11:35:32 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity reg_16bit is
    Port ( 
       load_data : in std_logic_vector(15 downto 0);
		 load, clk, din : in std_logic;
       dout : out std_logic_vector(15 downto 0)
		);
end reg_16bit;

architecture Behavioral of reg_16bit is
begin
process (clk)
variable r : std_logic_vector(15 downto 0);
begin
   if clk'event and clk = '1' then
   	if (load='1') then
     		r := load_data;
   	else
     		r := din & r(15 downto 1);
   	end if;
   end if;
 dout <= r;
end process;

end Behavioral;
