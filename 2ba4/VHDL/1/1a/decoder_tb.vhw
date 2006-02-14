-- D:\CGOBRIEN\1A\DECODER_TB.VHW
-- VHDL Test Bench created by
-- HDL Bencher 4.1i
-- Fri Feb 27 16:55:14 2004
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
	COMPONENT decoder
		PORT (
			RESET : in  STD_LOGIC;
			CLK : in  STD_LOGIC;
			D_IN : in  STD_LOGIC_VECTOR (2 DOWNTO 0);
			D_OUT : out  STD_LOGIC_VECTOR (5 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL RESET : STD_LOGIC;
	SIGNAL CLK : STD_LOGIC;
	SIGNAL D_IN : STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL D_OUT : STD_LOGIC_VECTOR (5 DOWNTO 0);

BEGIN
	UUT : decoder
	PORT MAP (
		RESET => RESET,
		CLK => CLK,
		D_IN => D_IN,
		D_OUT => D_OUT
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

		PROCEDURE CHECK_D_OUT(
			next_D_OUT : STD_LOGIC_VECTOR (5 DOWNTO 0);
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (D_OUT /= next_D_OUT) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns D_OUT="));
				write(TX_LOC, D_OUT);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_D_OUT);
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
		RESET <= transport '0';
		D_IN <= transport STD_LOGIC_VECTOR'("000"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=100 ns
		D_IN <= transport STD_LOGIC_VECTOR'("001"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=200 ns
		D_IN <= transport STD_LOGIC_VECTOR'("010"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=300 ns
		D_IN <= transport STD_LOGIC_VECTOR'("011"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=400 ns
		D_IN <= transport STD_LOGIC_VECTOR'("100"); --4
		-- --------------------
		WAIT FOR 100 ns; -- Time=500 ns
		D_IN <= transport STD_LOGIC_VECTOR'("101"); --5
		-- --------------------
		WAIT FOR 100 ns; -- Time=600 ns
		D_IN <= transport STD_LOGIC_VECTOR'("110"); --6
		-- --------------------
		WAIT FOR 100 ns; -- Time=700 ns
		D_IN <= transport STD_LOGIC_VECTOR'("111"); --7
		-- --------------------
		WAIT FOR 100 ns; -- Time=800 ns
		RESET <= transport '1';
		-- --------------------
		WAIT FOR 760 ns; -- Time=1560 ns
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

CONFIGURATION decoder_cfg OF testbench IS
	FOR testbench_arch
	END FOR;
END decoder_cfg;
