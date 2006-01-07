-- $Id: pc.vhd,v 1.2 2004/05/13 11:35:32 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pc is
    Port (CLK, PI, PL, Reset : in std_logic;
	 D : in std_logic_vector (8 downto 0);
	 Offset : in std_logic_vector (2 downto 0); --Has to be sign extended
	 pc_out : out std_logic_vector (8 downto 0));
end pc;

architecture Behavioral of pc is

	COMPONENT mux_4to1_9bit
	PORT(
		s : in std_logic_vector(1 downto 0);
		A, B, C, D : in std_logic_vector(8 downto 0);
		mux_out : out std_logic_vector(8 downto 0)
		);
	END COMPONENT;

	COMPONENT full_adder_9bit
	PORT(
		Cin : in std_logic;
		A, B : in std_logic_vector(8 downto 0);
		G : out std_logic_vector(8 downto 0);
		Cout : out std_logic
		);
	END COMPONENT;

	signal true_offset,value_plus_offset,incremented : std_logic_vector(8 downto 0);
	signal next_value,cur_out : std_logic_vector(8 downto 0);

begin

	true_offset(2 downto 0) <= offset(2 downto 0);
	true_o :for I in 3 to 8 generate
		true_offset(I) <= offset(2);
	end generate;

	offset_adder: full_adder_9bit PORT MAP(
		Cin => '0',
		A => cur_out,
		B => true_offset,
		G => value_plus_offset,
		Cout => open
	);

	incrementer: full_adder_9bit PORT MAP(
		Cin => '1',
		A => cur_out,
		B => "000000000",
		G => incremented,
		Cout => open
	);

	Inst_mux4_9bit: mux_4to1_9bit PORT MAP(
		s0 => PI,
		s1 => PL,
		in0 => cur_out,
		in1 => incremented,
		in2 => D,
		in3 => value_plus_offset,
		out0 => next_value
	);

process (CLK,Reset)
	begin
		if(CLK'event and CLK = '1')then
			if(Reset = '1')then
				cur_out <= "000000000";
			else
				cur_out <= next_value;
			end if;
		 end if;
end process;

	pc_out <= cur_out;

end Behavioral;

