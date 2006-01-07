-- $Id: flag_splitter.vhd,v 1.3 2004/05/13 11:35:31 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity flag_splitter is
    Port (
	       v, n, z, c : in std_logic;
			 sel : in std_logic_vector(2 downto 0);
	       MUX_OUT : out std_logic
			 );
end flag_splitter;

architecture Behavioral of flag_splitter is

begin

process(flag, sel)

begin
	case sel is
		when "000" => MUX_OUT <= '0';
		when "001" => MUX_OUT <= '1';
		when "010" => MUX_OUT <= c;
		when "011" => MUX_OUT <= v;
		when "100" => MUX_OUT <= z;
		when "101" => MUX_OUT <= n;
		when "110" => MUX_OUT <= not(c);
		when "111" => MUX_OUT <= not(z);
		when others => NULL;
	end case;
end process;

end Behavioral;
