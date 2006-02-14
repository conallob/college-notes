-- F:\2BA4\VHDL\2\2\HALF_ADDER_TB.VHW
-- VHDL Test Bench created by
-- HDL Bencher 4.1i
-- Wed May 12 11:08:40 2004
-- 
-- Notes:
-- 1) This testbench has been automatically generated from
--   your Test Bench Waveform
-- 2) To use this as a user modifiable testbench do the following:
--   - Save it as a file with a .vhd extension (i.e. File->Save As...)
--   - Add it to your project as a testbench source (i.e. Project->Add Source...)
-- 

LIBRARY  ieee;
USE ieee.std_logic_1164.all;

LIBRARY ieee;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE testbench_arch OF testbench IS
-- If you get a compiler error on the following line,
-- from the menu do Options->Configuration select VHDL 87
FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";
	COMPONENT half_adder
		PORT (
			x : in  std_logic;
			y : in  std_logic;
			s : out  std_logic;
			c : out  std_logic
		);
	END COMPONENT;

	SIGNAL x : std_logic;
	SIGNAL y : std_logic;
	SIGNAL s : std_logic;
	SIGNAL c : std_logic;

BEGIN
	UUT : half_adder
	PORT MAP (
		x => x,
		y => y,
		s => s,
		c => c
	);

	PROCESS
		VARIABLE TX_OUT : LINE;
		VARIABLE TX_ERROR : INTEGER := 0;

		PROCEDURE CHECK_s(
			next_s : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (s /= next_s) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns s="));
				write(TX_LOC, s);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_s);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_c(
			next_c : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (c /= next_c) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns c="));
				write(TX_LOC, c);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_c);
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
		x <= transport '0';
		y <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=100 ns
		y <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=200 ns
		x <= transport '1';
		y <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=300 ns
		y <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=400 ns
		x <= transport '0';
		y <= transport '0';
		-- --------------------
		WAIT FOR 1000 ns; -- Time=1400 ns
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

CONFIGURATION half_adder_cfg OF testbench IS
	FOR testbench_arch
	END FOR;
END half_adder_cfg;
