-- F:\2BA4\VHDL\2\2\MUX9TO1_TB.VHW
-- VHDL Test Bench created by
-- HDL Bencher 4.1i
-- Tue May 11 21:38:41 2004
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
	COMPONENT mux_9to1_16bit
		PORT (
			SEL : in  std_logic_vector (3 DOWNTO 0);
			A : in  std_logic_vector (15 DOWNTO 0);
			B : in  std_logic_vector (15 DOWNTO 0);
			C : in  std_logic_vector (15 DOWNTO 0);
			D : in  std_logic_vector (15 DOWNTO 0);
			E : in  std_logic_vector (15 DOWNTO 0);
			F : in  std_logic_vector (15 DOWNTO 0);
			G : in  std_logic_vector (15 DOWNTO 0);
			H : in  std_logic_vector (15 DOWNTO 0);
			I : in  std_logic_vector (15 DOWNTO 0);
			MUX_OUT : out  std_logic_vector (15 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL SEL : std_logic_vector (3 DOWNTO 0);
	SIGNAL A : std_logic_vector (15 DOWNTO 0);
	SIGNAL B : std_logic_vector (15 DOWNTO 0);
	SIGNAL C : std_logic_vector (15 DOWNTO 0);
	SIGNAL D : std_logic_vector (15 DOWNTO 0);
	SIGNAL E : std_logic_vector (15 DOWNTO 0);
	SIGNAL F : std_logic_vector (15 DOWNTO 0);
	SIGNAL G : std_logic_vector (15 DOWNTO 0);
	SIGNAL H : std_logic_vector (15 DOWNTO 0);
	SIGNAL I : std_logic_vector (15 DOWNTO 0);
	SIGNAL MUX_OUT : std_logic_vector (15 DOWNTO 0);

BEGIN
	UUT : mux_9to1_16bit
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
		I => I,
		MUX_OUT => MUX_OUT
	);

	PROCESS
		VARIABLE TX_OUT : LINE;
		VARIABLE TX_ERROR : INTEGER := 0;

		PROCEDURE CHECK_MUX_OUT(
			next_MUX_OUT : std_logic_vector (15 DOWNTO 0);
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
		SEL <= transport std_logic_vector'("0000"); --0
		A <= transport std_logic_vector'("0000000000001001"); --9
		B <= transport std_logic_vector'("0000000000001000"); --8
		C <= transport std_logic_vector'("0000000000000111"); --7
		D <= transport std_logic_vector'("0000000000000110"); --6
		E <= transport std_logic_vector'("0000000000000101"); --5
		F <= transport std_logic_vector'("0000000000000100"); --4
		G <= transport std_logic_vector'("0000000000000011"); --3
		H <= transport std_logic_vector'("0000000000000010"); --2
		I <= transport std_logic_vector'("0000000000000001"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=100 ns
		SEL <= transport std_logic_vector'("0001"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=200 ns
		SEL <= transport std_logic_vector'("0010"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=300 ns
		SEL <= transport std_logic_vector'("0011"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=400 ns
		SEL <= transport std_logic_vector'("0100"); --4
		-- --------------------
		WAIT FOR 100 ns; -- Time=500 ns
		SEL <= transport std_logic_vector'("0101"); --5
		-- --------------------
		WAIT FOR 100 ns; -- Time=600 ns
		SEL <= transport std_logic_vector'("0110"); --6
		-- --------------------
		WAIT FOR 100 ns; -- Time=700 ns
		SEL <= transport std_logic_vector'("0111"); --7
		-- --------------------
		WAIT FOR 100 ns; -- Time=800 ns
		SEL <= transport std_logic_vector'("1000"); --8
		-- --------------------
		WAIT FOR 100 ns; -- Time=900 ns
		SEL <= transport std_logic_vector'("1001"); --9
		-- --------------------
		WAIT FOR 100 ns; -- Time=1000 ns
		SEL <= transport std_logic_vector'("1010"); --A
		-- --------------------
		WAIT FOR 1000 ns; -- Time=2000 ns
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

CONFIGURATION mux_9to1_16bit_cfg OF testbench IS
	FOR testbench_arch
	END FOR;
END mux_9to1_16bit_cfg;
