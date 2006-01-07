-- F:\2BA4\VHDL\2\2\CAR_TB.VHW
-- VHDL Test Bench created by
-- HDL Bencher 4.1i
-- Wed May 12 11:01:33 2004
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
	COMPONENT car
		PORT (
			CLK : in  std_logic;
			Reset : in  std_logic;
			Incr : in  std_logic;
			Din : in  std_logic_vector (7 DOWNTO 0);
			Dout : out  std_logic_vector (7 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL CLK : std_logic;
	SIGNAL Reset : std_logic;
	SIGNAL Incr : std_logic;
	SIGNAL Din : std_logic_vector (7 DOWNTO 0);
	SIGNAL Dout : std_logic_vector (7 DOWNTO 0);

BEGIN
	UUT : car
	PORT MAP (
		CLK => CLK,
		Reset => Reset,
		Incr => Incr,
		Din => Din,
		Dout => Dout
	);

	PROCESS -- clock process
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

	PROCESS
		VARIABLE TX_OUT : LINE;
		VARIABLE TX_ERROR : INTEGER := 0;

		PROCEDURE CHECK_Dout(
			next_Dout : std_logic_vector (7 DOWNTO 0);
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (Dout /= next_Dout) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns Dout="));
				write(TX_LOC, Dout);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_Dout);
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
		Reset <= transport '0';
		Incr <= transport '0';
		Din <= transport std_logic_vector'("00000010"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=100 ns
		Incr <= transport '1';
		Din <= transport std_logic_vector'("00000100"); --4
		-- --------------------
		WAIT FOR 100 ns; -- Time=200 ns
		Incr <= transport '0';
		Din <= transport std_logic_vector'("00000110"); --6
		-- --------------------
		WAIT FOR 100 ns; -- Time=300 ns
		Incr <= transport '1';
		Din <= transport std_logic_vector'("00001000"); --8
		-- --------------------
		WAIT FOR 100 ns; -- Time=400 ns
		Incr <= transport '0';
		Din <= transport std_logic_vector'("00010000"); --10
		-- --------------------
		WAIT FOR 100 ns; -- Time=500 ns
		Incr <= transport '1';
		Din <= transport std_logic_vector'("00100000"); --20
		-- --------------------
		WAIT FOR 100 ns; -- Time=600 ns
		Reset <= transport '1';
		Incr <= transport '0';
		Din <= transport std_logic_vector'("01000000"); --40
		-- --------------------
		WAIT FOR 960 ns; -- Time=1560 ns
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

CONFIGURATION car_cfg OF testbench IS
	FOR testbench_arch
	END FOR;
END car_cfg;
