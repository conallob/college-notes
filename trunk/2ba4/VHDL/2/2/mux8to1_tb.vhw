-- F:\2BA4\VHDL\2\2\MUX8TO1_TB.VHW
-- VHDL Test Bench created by
-- HDL Bencher 4.1i
-- Tue May 11 21:16:55 2004
-- 
-- Notes:
-- 1) This testbench has been automatically generated from
--   your Test Bench Waveform
-- 2) To use this as a user modifiable testbench do the following:
--   - Save it as a file with a .vhd extension (i.e. File->Save As...)
--   - Add it to your project as a testbench source (i.e. Project->Add Source...)
-- 

LIBRARY  IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

LIBRARY ieee;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE testbench_arch OF testbench IS
-- If you get a compiler error on the following line,
-- from the menu do Options->Configuration select VHDL 87
FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";
	COMPONENT mux_8to1
		PORT (
			SEL : in  std_logic_vector (2 DOWNTO 0);
			A : in  std_logic;
			B : in  std_logic;
			C : in  std_logic;
			D : in  std_logic;
			E : in  std_logic;
			F : in  std_logic;
			G : in  std_logic;
			H : in  std_logic;
			MUX_OUT : out  std_logic
		);
	END COMPONENT;

	SIGNAL SEL : std_logic_vector (2 DOWNTO 0);
	SIGNAL A : std_logic;
	SIGNAL B : std_logic;
	SIGNAL C : std_logic;
	SIGNAL D : std_logic;
	SIGNAL E : std_logic;
	SIGNAL F : std_logic;
	SIGNAL G : std_logic;
	SIGNAL H : std_logic;
	SIGNAL MUX_OUT : std_logic;

BEGIN
	UUT : mux_8to1
	PORT MAP (
		SEL => SEL,
		A => A,
		B => B,
		C => C,
		D => D,
		E => E,
		F => F,
		G => G,
		H => H,
		MUX_OUT => MUX_OUT
	);

	PROCESS
		VARIABLE TX_OUT : LINE;
		VARIABLE TX_ERROR : INTEGER := 0;

		PROCEDURE CHECK_MUX_OUT(
			next_MUX_OUT : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (MUX_OUT /= next_MUX_OUT) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns MUX_OUT="));
				write(TX_LOC, MUX_OUT);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_MUX_OUT);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		BEGIN
		-- --------------------
		SEL <= transport std_logic_vector'("000"); --0
		A <= transport '1';
		B <= transport '0';
		C <= transport '0';
		D <= transport '0';
		E <= transport '0';
		F <= transport '0';
		G <= transport '0';
		H <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=100 ns
		SEL <= transport std_logic_vector'("001"); --1
		B <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=200 ns
		SEL <= transport std_logic_vector'("010"); --2
		C <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=300 ns
		D <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=400 ns
		SEL <= transport std_logic_vector'("100"); --4
		E <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=500 ns
		SEL <= transport std_logic_vector'("101"); --5
		F <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=600 ns
		SEL <= transport std_logic_vector'("110"); --6
		G <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=700 ns
		SEL <= transport std_logic_vector'("111"); --7
		H <= transport '1';
		-- --------------------
		WAIT FOR 1000 ns; -- Time=1700 ns
		-- --------------------

		IF (TX_ERROR = 0) THEN 
			write(TX_OUT,string'("No errors or warnings"));
			writeline(results, TX_OUT);
			ASSERT (FALSE) REPORT
				"Simulation successful (not a failure).  No problems detected. "
				SEVERITY FAILURE;
		ELSE
			write(TX_OUT, TX_ERROR);
			write(TX_OUT, string'(
				" errors found in simulation"));
			writeline(results, TX_OUT);
			ASSERT (FALSE) REPORT
				"Errors found during simulation"
				SEVERITY FAILURE;
		END IF;
	END PROCESS;
END testbench_arch;

CONFIGURATION mux_8to1_cfg OF testbench IS
	FOR testbench_arch
	END FOR;
END mux_8to1_cfg;
