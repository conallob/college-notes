-- F:\3BA5\ASSIGNMENTS\1A
-- VHDL Test Bench created by
-- HDL Bencher 6.1i
-- Thu Dec 09 17:42:16 2004
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

ENTITY dlatch_tb IS
END dlatch_tb;

ARCHITECTURE testbench_arch OF dlatch_tb IS
-- If you get a compiler error on the following line,
-- from the menu do Options->Configuration select VHDL 87
FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";
	COMPONENT dlatch
		PORT (
			CLK : In  std_logic;
			RESET : In  std_logic;
			DIN : In  std_logic_vector (31 DOWNTO 0);
			OUTPUT : Out  std_logic_vector (31 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL CLK : std_logic;
	SIGNAL RESET : std_logic;
	SIGNAL DIN : std_logic_vector (31 DOWNTO 0);
	SIGNAL OUTPUT : std_logic_vector (31 DOWNTO 0);

BEGIN
	UUT : dlatch
	PORT MAP (
		CLK => CLK,
		RESET => RESET,
		DIN => DIN,
		OUTPUT => OUTPUT
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

		PROCEDURE CHECK_OUTPUT(
			next_OUTPUT : std_logic_vector (31 DOWNTO 0);
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (OUTPUT /= next_OUTPUT) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns OUTPUT="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, OUTPUT);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_OUTPUT);
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
		RESET <= transport '0';
		DIN <= transport std_logic_vector'("00000000000000000000000000001111"); --F
		-- --------------------
		WAIT FOR 100 ns; -- Time=100 ns
		DIN <= transport std_logic_vector'("00000000000000000000000011111111"); --FF
		-- --------------------
		WAIT FOR 100 ns; -- Time=200 ns
		DIN <= transport std_logic_vector'("00000000000000000000111111111111"); --FFF
		-- --------------------
		WAIT FOR 100 ns; -- Time=300 ns
		DIN <= transport std_logic_vector'("00000000000000001111111111111111"); --FFFF
		-- --------------------
		WAIT FOR 100 ns; -- Time=400 ns
		DIN <= transport std_logic_vector'("00000000000011111111111111111111"); --FFFFF
		-- --------------------
		WAIT FOR 100 ns; -- Time=500 ns
		DIN <= transport std_logic_vector'("00000000111111111111111111111111"); --FFFFFF
		-- --------------------
		WAIT FOR 100 ns; -- Time=600 ns
		DIN <= transport std_logic_vector'("00001111111111111111111111111111"); --FFFFFFF
		-- --------------------
		WAIT FOR 100 ns; -- Time=700 ns
		RESET <= transport '1';
		DIN <= transport std_logic_vector'("11111111111111111111111111111111"); --FFFFFFFF
		-- --------------------
		WAIT FOR 110 ns; -- Time=810 ns
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

CONFIGURATION dlatch_cfg OF dlatch_tb IS
	FOR testbench_arch
	END FOR;
END dlatch_cfg;
