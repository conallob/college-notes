-- $Id$

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity float_exp_adder is
	Port (
		s : in std_logic;
		x, y: in std_logic_vector(31 downto 0);
		output: out std_logic_vector(31 downto 0)
		);
end float_exp_adder;

architecture Behavioral of float_exp_adder is

signal a : std_logic_vector(7 downto 0);
signal b : std_logic_vector(7 downto 0); 

begin

a <= x(30 downto 23);
b <= y(30 downto 23);

process(s, a, b)

begin
	if s = '1' then
		output <= (a + b);
	else
		output(30 downto 23) <= (a + (not b) + 1);
	end if;
	output(31) <= '0';
	output(22 downto 0) <= "00000000000000000000000";
end process;

end Behavioral;
