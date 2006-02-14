-- F:\2BA4\VHDL\2\2\FLAG_SPLITTER_TB.VHW
-- VHDL Test Bench created by
-- HDL Bencher 4.1i
-- Wed May 12 10:59:37 2004
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
	COMPONENT flag_splitter
		PORT (
			flag : in  std_logic_vector (3 DOWNTO 0);
			sel : in  std_logic_vector (2 DOWNTO 0);
			MUX_OUT : out  std_logic
		);
	END COMPONENT;

	SIGNAL flag : std_logic_vector (3 DOWNTO 0);
	SIGNAL sel : std_logic_vector (2 DOWNTO 0);
	SIGNAL MUX_OUT : std_logic;

BEGIN
	UUT : flag_splitter
	PORT MAP (
		flag => flag,
		sel => sel,
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
		flag <= transport std_logic_vector'("0000"); --0
		sel <= transport std_logic_vector'("000"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=100 ns
		flag <= transport std_logic_vector'("0010"); --2
		sel <= transport std_logic_vector'("001"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=200 ns
		flag <= transport std_logic_vector'("0100"); --4
		sel <= transport std_logic_vector'("010"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=300 ns
		flag <= transport std_logic_vector'("0110"); --6
		sel <= transport std_logic_vector'("011"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=400 ns
		flag <= transport std_logic_vector'("1000"); --8
		sel <= transport std_logic_vector'("100"); --4
		-- --------------------
		WAIT FOR 100 ns; -- Time=500 ns
		flag <= transport std_logic_vector'("1010"); --A
		sel <= transport std_logic_vector'("101"); --5
		-- --------------------
		WAIT FOR 100 ns; -- Time=600 ns
		flag <= transport std_logic_vector'("1100"); --C
		sel <= transport std_logic_vector'("110"); --6
		-- --------------------
		WAIT FOR 100 ns; -- Time=700 ns
		flag <= transport std_logic_vector'("1110"); --E
		sel <= transport std_logic_vector'("111"); --7
		-- --------------------
		WAIT FOR 100 ns; -- Time=800 ns
		flag <= transport std_logic_vector'("1111"); --F
		-- --------------------
		WAIT FOR 1000 ns; -- Time=1800 ns
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

CONFIGURATION flag_splitter_cfg OF testbench IS
	FOR testbench_arch
	END FOR;
END flag_splitter_cfg;
