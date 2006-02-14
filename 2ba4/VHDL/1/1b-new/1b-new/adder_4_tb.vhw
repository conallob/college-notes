-- F:\COLLEGE\2BA4\VHDL\1\1B-NEW\1B-NEW\ADDER_4_TB.VHW
-- VHDL Test Bench created by
-- HDL Bencher 4.1i
-- Wed Apr 14 21:46:57 2004
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
	COMPONENT adder_4
		PORT (
			B : in  std_logic_vector (3 DOWNTO 0);
			A : in  std_logic_vector (3 DOWNTO 0);
			C0 : in  std_logic;
			S : out  std_logic_vector (3 DOWNTO 0);
			C4 : out  std_logic
		);
	END COMPONENT;

	SIGNAL B : std_logic_vector (3 DOWNTO 0);
	SIGNAL A : std_logic_vector (3 DOWNTO 0);
	SIGNAL C0 : std_logic;
	SIGNAL S : std_logic_vector (3 DOWNTO 0);
	SIGNAL C4 : std_logic;

BEGIN
	UUT : adder_4
	PORT MAP (
		B => B,
		A => A,
		C0 => C0,
		S => S,
		C4 => C4
	);

	PROCESS
		VARIABLE TX_OUT : LINE;
		VARIABLE TX_ERROR : INTEGER := 0;

		PROCEDURE CHECK_S(
			next_S : std_logic_vector (3 DOWNTO 0);
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (S /= next_S) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns S="));
				write(TX_LOC, S);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_S);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_C4(
			next_C4 : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (C4 /= next_C4) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns C4="));
				write(TX_LOC, C4);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_C4);
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
		B <= transport std_logic_vector'("0011"); --3
		A <= transport std_logic_vector'("1011"); --B
		C0 <= transport '0';
		-- --------------------
		WAIT FOR 1000 ns; -- Time=1000 ns
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

CONFIGURATION adder_4_cfg OF testbench IS
	FOR testbench_arch
	END FOR;
END adder_4_cfg;
