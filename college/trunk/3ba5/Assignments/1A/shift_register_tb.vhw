-- F:\3BA5\ASSIGNMENTS\1A
-- VHDL Test Bench created by
-- HDL Bencher 6.1i
-- Thu Dec 09 18:17:39 2004
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

ENTITY shift_register_tb IS
END shift_register_tb;

ARCHITECTURE testbench_arch OF shift_register_tb IS
-- If you get a compiler error on the following line,
-- from the menu do Options->Configuration select VHDL 87
FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";
	COMPONENT shift_register
		PORT (
			CLK : In  std_logic;
			DIN : In  std_logic;
			RESET : In  std_logic;
			Q0 : Out  std_logic;
			Q1 : Out  std_logic;
			Q2 : Out  std_logic
		);
	END COMPONENT;

	SIGNAL CLK : std_logic;
	SIGNAL DIN : std_logic;
	SIGNAL RESET : std_logic;
	SIGNAL Q0 : std_logic;
	SIGNAL Q1 : std_logic;
	SIGNAL Q2 : std_logic;

BEGIN
	UUT : shift_register
	PORT MAP (
		CLK => CLK,
		DIN => DIN,
		RESET => RESET,
		Q0 => Q0,
		Q1 => Q1,
		Q2 => Q2
	);

	PROCESS -- clock process for CLK,
	BEGIN
		CLOCK_LOOP : LOOP
		CLK <= transport '0';
		WAIT FOR 10 ns;
		CLK <= transport '1';
		WAIT FOR 10 ns;
		WAIT FOR 40 ns;
		CLK <= transport '0';
		WAIT FOR 40 ns;
		END LOOP CLOCK_LOOP;
	END PROCESS;

	PROCESS   -- Process for CLK
		VARIABLE TX_OUT : LINE;
		VARIABLE TX_ERROR : INTEGER := 0;

		PROCEDURE CHECK_Q0(
			next_Q0 : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (Q0 /= next_Q0) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns Q0="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, Q0);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_Q0);
				STD.TEXTIO.write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				STD.TEXTIO.writeline(results, TX_LOC);
				STD.TEXTIO.Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_Q1(
			next_Q1 : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (Q1 /= next_Q1) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns Q1="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, Q1);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_Q1);
				STD.TEXTIO.write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				STD.TEXTIO.writeline(results, TX_LOC);
				STD.TEXTIO.Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_Q2(
			next_Q2 : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (Q2 /= next_Q2) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns Q2="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, Q2);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_Q2);
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
		DIN <= transport '1';
		RESET <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=100 ns
		DIN <= transport '0';
		-- --------------------
		WAIT FOR 200 ns; -- Time=300 ns
		DIN <= transport '1';
		-- --------------------
		WAIT FOR 300 ns; -- Time=600 ns
		DIN <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=700 ns
		DIN <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=800 ns
		DIN <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=900 ns
		RESET <= transport '1';
		-- --------------------
		WAIT FOR 110 ns; -- Time=1010 ns
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

CONFIGURATION shift_register_cfg OF shift_register_tb IS
	FOR testbench_arch
	END FOR;
END shift_register_cfg;
