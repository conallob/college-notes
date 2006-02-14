-- F:\3BA5\ASSIGNMENTS\1A
-- VHDL Test Bench created by
-- HDL Bencher 6.1i
-- Thu Dec 09 17:25:03 2004
-- 
-- Notes:
-- 1) This testbench has been automatically generated from
--   your Test Bench Waveform
-- 2) To use this as a user modifiable testbench do the following:
--   - Save it as a file with a .vhd extension (i.e. File->Save As...)
--   - Add it to your project as a testbench source (i.e. Project->Add Source...)
-- 

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY or_gate_tb IS
END or_gate_tb;

ARCHITECTURE testbench_arch OF or_gate_tb IS
-- If you get a compiler error on the following line,
-- from the menu do Options->Configuration select VHDL 87
FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";
	COMPONENT or_inv_gate
		PORT (
			a : In  std_logic;
			b : In  std_logic;
			output : Out  std_logic
		);
	END COMPONENT;

	SIGNAL a : std_logic;
	SIGNAL b : std_logic;
	SIGNAL output : std_logic;

BEGIN
	UUT : or_inv_gate
	PORT MAP (
		a => a,
		b => b,
		output => output
	);

	PROCESS
		VARIABLE TX_OUT : LINE;
		VARIABLE TX_ERROR : INTEGER := 0;

		PROCEDURE CHECK_output(
			next_output : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (output /= next_output) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns output="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, output);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_output);
				STD.TEXTIO.write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				STD.TEXTIO.writeline(results, TX_LOC);
				STD.TEXTIO.Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		BEGIN
		-- --------------------
		a <= transport '0';
		b <= transport '0';
		-- --------------------
		WAIT FOR 2 ns; -- Time=2 ns
		b <= transport '1';
		-- --------------------
		WAIT FOR 2 ns; -- Time=4 ns
		a <= transport '1';
		b <= transport '0';
		-- --------------------
		WAIT FOR 2 ns; -- Time=6 ns
		b <= transport '1';
		-- --------------------
		WAIT FOR 3 ns; -- Time=9 ns
		-- --------------------

		IF (TX_ERROR = 0) THEN 
			STD.TEXTIO.write(TX_OUT,string'("No errors or warnings"));
			STD.TEXTIO.writeline(results, TX_OUT);
			ASSERT (FALSE) REPORT
				"Simulation successful (not a failure).  No problems detected. "
				SEVERITY FAILURE;
		ELSE
			STD.TEXTIO.write(TX_OUT, TX_ERROR);
			STD.TEXTIO.write(TX_OUT, string'(
				" errors found in simulation"));
			STD.TEXTIO.writeline(results, TX_OUT);
			ASSERT (FALSE) REPORT
				"Errors found during simulation"
				SEVERITY FAILURE;
		END IF;
	END PROCESS;
END testbench_arch;

CONFIGURATION or_inv_gate_cfg OF or_gate_tb IS
	FOR testbench_arch
	END FOR;
END or_inv_gate_cfg;
