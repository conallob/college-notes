-- $Id: 16bit_ripple.vhd,v 1.1 2004/05/11 13:20:17 conall Exp $

library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
	port(x, y : in std_logic;
		  s, c : out std_logic);
end half_adder;

architecture dataflow_3 of half_adder is
begin
	s <= x xor y;
	c <= x and y;
end dataflow_3;

library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
	port(x, y, z : in std_logic;
		  s, c : out std_logic);
end full_adder;

architecture struct_dataflow_3 of full_adder is
begin
	component half_adder
	port (x, y : in std_logic;
			s, c : out std_logic);
	end component;

	signal hs, hc, tc : std_logic;

	begin
		HA1 : half_adder
			port map(x, y, hs, hc);
		HA2 : half_adder
			port map(hs, z, s, tc);
		c <= tc or hc;
		
end struct_dataflow_3;


library ieee;
use ieee.std_logic_1164.all;

entity adder_16 is
	port(B, A : in std_logic_vector(15 downto 0);
		  C0 : in std_logic;
		  S : out std_logic_vector(15 downto 0);
		  C4 : out std_logic);
end adder_16;

architecture structural_16 of adder_16 is
	component half_adder
	port (x, y, z : in std_logic;
			s, c : out std_logic);
	end component;

	signal c : std_logic_vector(3 downto 1);
	--	Not too sure about this  ^^^^^^^^^^

	begin
		Bit0 : full_adder
			port map(B(0), A(0), C0, S(0), C(1));
		Bit1 : full_adder
			port map(B(1), A(1), C(1), S(1), C(2));
		Bit2 : full_adder
			port map(B(2), A(2), C(2), S(2), C(3));
		Bit3 : full_adder
			port map(B(3), A(3), C(3), S(3), C(4));
		Bit4 : full_adder
			port map(B(4), A(4), C(4), S(4), C(5));
		Bit5 : full_adder
			port map(B(5), A(5), C(5), S(5), C(6));
		Bit6 : full_adder
			port map(B(6), A(6), C(6), S(6), C(7));
		Bit7 : full_adder
			port map(B(7), A(7), C(7), S(7), C(8));
		Bit8 : full_adder
			port map(B(8), A(8), C(8), S(8), C(9));
		Bit9 : full_adder
			port map(B(9), A(9), C(9), S(9), C(10));
		Bit10 : full_adder
			port map(B(10), A(10), C(10), S(10), C(11));
		Bit11 : full_adder
			port map(B(11), A(11), C(11), S(11), C(12));
		Bit12 : full_adder
			port map(B(12), A(12), C(12), S(12), C(13));
		Bit13 : full_adder
			port map(B(13), A(13), C(13), S(13), C(14));
		Bit14 : full_adder
			port map(B(14), A(14), C(14), S(14), C(15));
		Bit15 : full_adder
			port map(B(15), A(15), C(15), S(15), C(0));		
end structural_16;

