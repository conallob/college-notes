-- $Id: shift_register.vhd 233 2004-05-11 21:16:01Z conall $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity shift_register is
    Port ( 
	 	CLK, DIN, RESET : in std_logic;
       	Q0, Q1, Q2: out std_logic 
		);

end shift_register;

architecture Behavioral of shift_register is

signal mem : std_logic_vector(2 downto 0);

begin

process (CLK)
begin
	if CLK'event and CLK='1' then
		if RESET'event and RESET='1' then
			mem <= "000"; -- reset
		else
			-- incrememt signals, losing the most stale one...
			mem(2) <= mem(1);
			mem(1) <= mem(0);
			-- Let's save the signal from DIN as my most recent signal
     		mem(0) <= DIN; 
   		end if;
	end if;
	Q0 <= mem(0); -- stage 1 of pipeline
	Q1 <= mem(1); -- stage 2 of pipeline
	Q2 <= mem(2); -- stage 3 of pipeline
end process;

end Behavioral;
