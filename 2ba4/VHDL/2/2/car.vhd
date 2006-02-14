-- $Id: car.vhd,v 1.3 2004/05/13 11:35:31 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity car is
    Port (CLK, Reset, Incr : in std_logic;
	 	Din : in std_logic_vector(7 downto 0);
		Dout : out std_logic_vector(7 downto 0));
end car;

architecture Behavioral of car is

	COMPONENT half_adder
	PORT(
		x, y : IN std_logic;
		S, C : OUT std_logic
		);
	END COMPONENT;

	SIGNAL carry : std_logic_vector(8 downto 0);
	SIGNAL output : std_logic_vector(7 downto 0);

begin

process(CLK, Reset)
	begin
		if(CLK'event and CLK = '1')then
			if(reset = '1')then
				Dout <= "00000000";
			else
				Dout <= output; 
			end if;
		end if;
end process;

	carry(0)	<= Incr;
		g1: for I in 0 to 7 generate
			Inst_half_adder: half_adder PORT MAP(
				x => Din(I),
				y => carry(I),
				S => output(I),
				C => carry(I+1)
			);
		end generate;

end Behavioral;
