-- $Id$

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity float_adder is
	Port (
		s : in std_logic;
		a, b: in std_logic_vector(31 downto 0);
		output: out std_logic_vector(31 downto 0)
		);
end float_adder;

architecture Behavioral of float_adder is

begin

process(s)

begin
	if s = '1' then
		output <= (a + b);
	else
		output <= (a + (not b) + 1);
	end if;

end process;

end Behavioral;
