-- F:\3BA5\ASSIGNMENTS\1A
-- VHDL Test Bench created by
-- HDL Bencher 6.1i
-- Thu Dec 09 21:41:52 2004
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

ENTITY addr_counter_tb IS
END addr_counter_tb;

ARCHITECTURE testbench_arch OF addr_counter_tb IS
-- If you get a compiler error on the following line,
-- from the menu do Options->Configuration select VHDL 87
FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";
	COMPONENT addr_counter
		PORT (
			CLK : In  std_logic;
			RESET : In  std_logic;
			COUNT : Out  std_logic_vector (5 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL CLK : std_logic;
	SIGNAL RESET : std_logic;
	SIGNAL COUNT : std_logic_vector (5 DOWNTO 0);

BEGIN
	UUT : addr_counter
	PORT MAP (
		CLK => CLK,
		RESET => RESET,
		COUNT => COUNT
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

		PROCEDURE CHECK_COUNT(
			next_COUNT : std_logic_vector (5 DOWNTO 0);
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (COUNT /= next_COUNT) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns COUNT="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, COUNT);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_COUNT);
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
		RESET <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=100 ns
		RESET <= transport '0';
		-- --------------------
		WAIT FOR 700 ns; -- Time=800 ns
		RESET <= transport '1';
		-- --------------------
		WAIT FOR 110 ns; -- Time=910 ns
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

CONFIGURATION addr_counter_cfg OF addr_counter_tb IS
	FOR testbench_arch
	END FOR;
END addr_counter_cfg;
