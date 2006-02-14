-- D:\CGOBRIEN\1A\REG_TB.VHW
-- VHDL Test Bench created by
-- HDL Bencher 4.1i
-- Fri Feb 27 16:58:26 2004
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
	COMPONENT reg
		PORT (
			CLK : in  STD_LOGIC;
			DIN : in  STD_LOGIC;
			LOAD : in  STD_LOGIC;
			LOAD_DATA : in  STD_LOGIC_VECTOR (3 DOWNTO 0);
			DOUT : out  STD_LOGIC_VECTOR (3 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL CLK : STD_LOGIC;
	SIGNAL DIN : STD_LOGIC;
	SIGNAL LOAD : STD_LOGIC;
	SIGNAL LOAD_DATA : STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL DOUT : STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN
	UUT : reg
	PORT MAP (
		CLK => CLK,
		DIN => DIN,
		LOAD => LOAD,
		LOAD_DATA => LOAD_DATA,
		DOUT => DOUT
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

		PROCEDURE CHECK_DOUT(
			next_DOUT : STD_LOGIC_VECTOR (3 DOWNTO 0);
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (DOUT /= next_DOUT) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns DOUT="));
				write(TX_LOC, DOUT);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_DOUT);
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
		DIN <= transport '1';
		LOAD <= transport '1';
		LOAD_DATA <= transport STD_LOGIC_VECTOR'("0000"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=100 ns
		DIN <= transport '0';
		LOAD_DATA <= transport STD_LOGIC_VECTOR'("0001"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=200 ns
		DIN <= transport '1';
		LOAD_DATA <= transport STD_LOGIC_VECTOR'("0010"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=300 ns
		DIN <= transport '0';
		LOAD_DATA <= transport STD_LOGIC_VECTOR'("0011"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=400 ns
		DIN <= transport '1';
		LOAD <= transport '0';
		LOAD_DATA <= transport STD_LOGIC_VECTOR'("0100"); --4
		-- --------------------
		WAIT FOR 100 ns; -- Time=500 ns
		DIN <= transport '0';
		LOAD <= transport '1';
		LOAD_DATA <= transport STD_LOGIC_VECTOR'("0101"); --5
		-- --------------------
		WAIT FOR 100 ns; -- Time=600 ns
		DIN <= transport '1';
		LOAD_DATA <= transport STD_LOGIC_VECTOR'("0110"); --6
		-- --------------------
		WAIT FOR 100 ns; -- Time=700 ns
		DIN <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=800 ns
		DIN <= transport '1';
		-- --------------------
		WAIT FOR 960 ns; -- Time=1760 ns
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

CONFIGURATION reg_cfg OF testbench IS
	FOR testbench_arch
	END FOR;
END reg_cfg;
