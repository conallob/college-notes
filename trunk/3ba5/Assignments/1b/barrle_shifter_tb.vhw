-- F:\1B
-- VHDL Test Bench created by
-- HDL Bencher 6.1i
-- Wed Jan 26 19:51:22 2005
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

ENTITY barrle_shifter_tb IS
END barrle_shifter_tb;

ARCHITECTURE testbench_arch OF barrle_shifter_tb IS
-- If you get a compiler error on the following line,
-- from the menu do Options->Configuration select VHDL 87
FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";
	COMPONENT barrel_shifter_32bit
		PORT (
			s : In  std_logic_vector (4 DOWNTO 0);
			input : In  std_logic_vector (31 DOWNTO 0);
			output : Out  std_logic_vector (31 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL s : std_logic_vector (4 DOWNTO 0);
	SIGNAL input : std_logic_vector (31 DOWNTO 0);
	SIGNAL output : std_logic_vector (31 DOWNTO 0);

BEGIN
	UUT : barrel_shifter_32bit
	PORT MAP (
		s => s,
		input => input,
		output => output
	);

	PROCESS
		VARIABLE TX_OUT : LINE;
		VARIABLE TX_ERROR : INTEGER := 0;

		PROCEDURE CHECK_output(
			next_output : std_logic_vector (31 DOWNTO 0);
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
		s <= transport std_logic_vector'("00000"); --0
		input <= transport std_logic_vector'("11111111111111111111111111111111"); --FFFFFFFF
		-- --------------------
		WAIT FOR 50 ns; -- Time=50 ns
		CHECK_output("00000000000000000000000000000001",50); --1
		-- --------------------
		WAIT FOR 50 ns; -- Time=100 ns
		s <= transport std_logic_vector'("00001"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=200 ns
		s <= transport std_logic_vector'("00010"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=300 ns
		s <= transport std_logic_vector'("00011"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=400 ns
		s <= transport std_logic_vector'("00100"); --4
		-- --------------------
		WAIT FOR 100 ns; -- Time=500 ns
		s <= transport std_logic_vector'("00111"); --7
		-- --------------------
		WAIT FOR 100 ns; -- Time=600 ns
		s <= transport std_logic_vector'("01000"); --8
		-- --------------------
		WAIT FOR 100 ns; -- Time=700 ns
		s <= transport std_logic_vector'("01100"); --C
		-- --------------------
		WAIT FOR 100 ns; -- Time=800 ns
		s <= transport std_logic_vector'("10000"); --10
		-- --------------------
		WAIT FOR 100 ns; -- Time=900 ns
		s <= transport std_logic_vector'("10100"); --14
		-- --------------------
		WAIT FOR 100 ns; -- Time=1000 ns
		s <= transport std_logic_vector'("11000"); --18
		-- --------------------
		WAIT FOR 100 ns; -- Time=1100 ns
		s <= transport std_logic_vector'("11100"); --1C
		-- --------------------
		WAIT FOR 100 ns; -- Time=1200 ns
		s <= transport std_logic_vector'("11111"); --1F
		-- --------------------
		WAIT FOR 150 ns; -- Time=1350 ns
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

CONFIGURATION barrel_shifter_32bit_cfg OF barrle_shifter_tb IS
	FOR testbench_arch
	END FOR;
END barrel_shifter_32bit_cfg;
