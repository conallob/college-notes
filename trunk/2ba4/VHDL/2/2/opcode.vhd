-- $Id: opcode.vhd,v 1.2 2004/05/13 11:35:32 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity opcode is
    Port ( DATA_IN : in std_logic_vector(15 downto 0);
           IL : in std_logic;
           CLK : in std_logic;
			  DR : out std_logic_vector(2 downto 0);
           SA : out std_logic_vector(2 downto 0);
           SB : out std_logic_vector(2 downto 0);          
           OPCODE_OUT : out std_logic_vector(7 downto 0));

end opcode;

architecture Behavioral of opcode is

begin


	process (CLK, IL, DATA_IN)
	begin

		if (rising_edge(CLK)) then
			if IL = '1' then
			   DR <= DATA_IN(8 downto 6);
				SA <= DATA_IN(5 downto 3);
				SB <= DATA_IN(2 downto 0);
				OPCODE_OUT(7) <= '0';
				OPCODE_OUT(6 downto 0) <= DATA_IN(15 downto 9);
				
			end if;
		end if;

	end process;


end Behavioral;