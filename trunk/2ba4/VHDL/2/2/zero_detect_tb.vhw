-- F:\2BA4\VHDL\2\2\ZERO_DETECT_TB.VHW
-- VHDL Test Bench created by
-- HDL Bencher 4.1i
-- Tue May 11 21:29:51 2004
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
	COMPONENT zero_detect_16bit
		PORT (
			input : in  std_logic_vector (15 DOWNTO 0);
			z : out  std_logic
		);
	END COMPONENT;

	SIGNAL input : std_logic_vector (15 DOWNTO 0);
	SIGNAL z : std_logic;

BEGIN
	UUT : zero_detect_16bit
	PORT MAP (
		input => input,
		z => z
	);

	PROCESS
		VARIABLE TX_OUT : LINE;
		VARIABLE TX_ERROR : INTEGER := 0;

		PROCEDURE CHECK_z(
			next_z : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (z /= next_z) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns z="));
				write(TX_LOC, z);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_z);
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
		input <= transport std_logic_vector'("0000000000000000"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=100 ns
		input <= transport std_logic_vector'("0000000000000010"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=200 ns
		input <= transport std_logic_vector'("0000000000000100"); --4
		-- --------------------
		WAIT FOR 100 ns; -- Time=300 ns
		input <= transport std_logic_vector'("0000000000001000"); --8
		-- --------------------
		WAIT FOR 100 ns; -- Time=400 ns
		input <= transport std_logic_vector'("0000000000010000"); --10
		-- --------------------
		WAIT FOR 100 ns; -- Time=500 ns
		input <= transport std_logic_vector'("0000000000100000"); --20
		-- --------------------
		WAIT FOR 100 ns; -- Time=600 ns
		input <= transport std_logic_vector'("0000000001000000"); --40
		-- --------------------
		WAIT FOR 100 ns; -- Time=700 ns
		input <= transport std_logic_vector'("0000000010000000"); --80
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

CONFIGURATION zero_detect_16bit_cfg OF testbench IS
	FOR testbench_arch
	END FOR;
END zero_detect_16bit_cfg;
