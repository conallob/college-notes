-- $Id: shifter_16bit.vhd,v 1.1 2004/05/13 11:35:32 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity shifter_16bit is
    Port (
	 		 s : in std_logic_vector(1 downto 0);
	  	 	 B : in std_logic_vector(15 downto 0);
	 		 G : out std_logic_vector(15 downto 0));
end shifter_16bit;

architecture Behavioral of shifter_16bit is
	COMPONENT mux_4to1_16bit	PORT(
		s : in std_logic_vector(1 downto 0);
		in0 : in std_logic_vector(15 downto 0);
		in1 : in std_logic_vector(15 downto 0);
		in2 : in std_logic_vector(15 downto 0);
		in3 : in std_logic_vector(15 downto 0);          
		mux_out : out std_logic_vector(15 downto 0)
		);
	END COMPONENT;

	SIGNAL sl, sr : std_logic_vector(15 downto 0);

begin

	sr <= '0' & B(15 downto 1);
	sl <= B(14 downto 0) & '0';


	Inst_mux_4to1_16bit: mux_4to1_16bit PORT MAP(
		s => s,
		in0 => B,
		in1 => sr,
		in2 => sl,
		in3 => "0000000000000000",
		mux_out => G
	);

end Behavioral;
