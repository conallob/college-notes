-- $Id: full_adder_9bit.vhd,v 1.1 2004/05/13 11:35:32 conall Exp $`

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity full_adder_9bit is
    Port ( Cin : std_logic;
	 A, B : in std_logic_vector(8 downto 0);
	 G : out std_logic_vector(8 downto 0);
	 Cout : out std_logic
	 );
end full_adder_9bit;

architecture Behavioral of full_adder_9bit is

	COMPONENT full_adder
	PORT(
		x, y, cin : in std_logic;    
		sum, cout : out std_logic;
		);
	END COMPONENT;

	signal carry : std_logic_vector(9 downto 0);

begin

	carry(0) <= Cin;
	Cout <= carry(9);

	fa: for I in 0 to 8 generate
	Inst_full_adder: full_adder PORT MAP(
		x => A(I),
		y => B(I),
		cin => carry(I),
		sum => G(I),
		cout => carry(I+1)
	);
	end generate;

end Behavioral;

