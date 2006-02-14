-- F:\2BA4\VHDL\2\2\SPLITTER16_TB.VHW
-- VHDL Test Bench created by
-- HDL Bencher 4.1i
-- Tue May 11 21:24:55 2004
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
	COMPONENT splitter_16bit
		PORT (
			input : in  std_logic_vector (8 DOWNTO 0);
			output0 : out  std_logic;
			output2 : out  std_logic;
			output1 : out  std_logic;
			output3 : out  std_logic;
			output4 : out  std_logic;
			output5 : out  std_logic;
			output6 : out  std_logic;
			output7 : out  std_logic;
			output8 : out  std_logic
		);
	END COMPONENT;

	SIGNAL input : std_logic_vector (8 DOWNTO 0);
	SIGNAL output0 : std_logic;
	SIGNAL output2 : std_logic;
	SIGNAL output1 : std_logic;
	SIGNAL output3 : std_logic;
	SIGNAL output4 : std_logic;
	SIGNAL output5 : std_logic;
	SIGNAL output6 : std_logic;
	SIGNAL output7 : std_logic;
	SIGNAL output8 : std_logic;

BEGIN
	UUT : splitter_16bit
	PORT MAP (
		input => input,
		output0 => output0,
		output2 => output2,
		output1 => output1,
		output3 => output3,
		output4 => output4,
		output5 => output5,
		output6 => output6,
		output7 => output7,
		output8 => output8
	);

	PROCESS
		VARIABLE TX_OUT : LINE;
		VARIABLE TX_ERROR : INTEGER := 0;

		PROCEDURE CHECK_output0(
			next_output0 : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (output0 /= next_output0) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns output0="));
				write(TX_LOC, output0);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_output0);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_output2(
			next_output2 : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (output2 /= next_output2) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns output2="));
				write(TX_LOC, output2);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_output2);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_output1(
			next_output1 : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (output1 /= next_output1) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns output1="));
				write(TX_LOC, output1);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_output1);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_output3(
			next_output3 : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (output3 /= next_output3) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns output3="));
				write(TX_LOC, output3);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_output3);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_output4(
			next_output4 : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (output4 /= next_output4) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns output4="));
				write(TX_LOC, output4);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_output4);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_output5(
			next_output5 : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (output5 /= next_output5) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns output5="));
				write(TX_LOC, output5);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_output5);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_output6(
			next_output6 : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (output6 /= next_output6) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns output6="));
				write(TX_LOC, output6);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_output6);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_output7(
			next_output7 : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (output7 /= next_output7) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns output7="));
				write(TX_LOC, output7);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_output7);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_output8(
			next_output8 : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (output8 /= next_output8) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns output8="));
				write(TX_LOC, output8);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_output8);
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
		input <= transport std_logic_vector'("000000000"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=100 ns
		input <= transport std_logic_vector'("000000010"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=200 ns
		input <= transport std_logic_vector'("000000100"); --4
		-- --------------------
		WAIT FOR 100 ns; -- Time=300 ns
		input <= transport std_logic_vector'("000001000"); --8
		-- --------------------
		WAIT FOR 100 ns; -- Time=400 ns
		input <= transport std_logic_vector'("000010000"); --10
		-- --------------------
		WAIT FOR 100 ns; -- Time=500 ns
		input <= transport std_logic_vector'("000100000"); --20
		-- --------------------
		WAIT FOR 100 ns; -- Time=600 ns
		input <= transport std_logic_vector'("001000000"); --40
		-- --------------------
		WAIT FOR 100 ns; -- Time=700 ns
		input <= transport std_logic_vector'("010000000"); --80
		-- --------------------
		WAIT FOR 100 ns; -- Time=800 ns
		input <= transport std_logic_vector'("100000000"); --100
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

CONFIGURATION splitter_16bit_cfg OF testbench IS
	FOR testbench_arch
	END FOR;
END splitter_16bit_cfg;
