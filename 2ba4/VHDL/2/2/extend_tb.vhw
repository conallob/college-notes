-- F:\2BA4\VHDL\2\2\EXTEND_TB.VHW
-- VHDL Test Bench created by
-- HDL Bencher 4.1i
-- Wed May 12 10:51:44 2004
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
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

LIBRARY ieee;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE testbench_arch OF testbench IS
-- If you get a compiler error on the following line,
-- from the menu do Options->Configuration select VHDL 87
FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";
	COMPONENT extend
		PORT (
			dr : in  std_logic_vector (2 DOWNTO 0);
			sb : in  std_logic_vector (2 DOWNTO 0);
			extend_out : out  std_logic_vector (15 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL dr : std_logic_vector (2 DOWNTO 0);
	SIGNAL sb : std_logic_vector (2 DOWNTO 0);
	SIGNAL extend_out : std_logic_vector (15 DOWNTO 0);

BEGIN
	UUT : extend
	PORT MAP (
		dr => dr,
		sb => sb,
		extend_out => extend_out
	);

	PROCESS
		VARIABLE TX_OUT : LINE;
		VARIABLE TX_ERROR : INTEGER := 0;

		PROCEDURE CHECK_extend_out(
			next_extend_out : std_logic_vector (15 DOWNTO 0);
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (extend_out /= next_extend_out) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns extend_out="));
				write(TX_LOC, extend_out);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_extend_out);
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
		dr <= transport std_logic_vector'("000"); --0
		sb <= transport std_logic_vector'("111"); --7
		-- --------------------
		WAIT FOR 100 ns; -- Time=100 ns
		dr <= transport std_logic_vector'("001"); --1
		sb <= transport std_logic_vector'("110"); --6
		-- --------------------
		WAIT FOR 100 ns; -- Time=200 ns
		dr <= transport std_logic_vector'("010"); --2
		sb <= transport std_logic_vector'("101"); --5
		-- --------------------
		WAIT FOR 100 ns; -- Time=300 ns
		dr <= transport std_logic_vector'("011"); --3
		sb <= transport std_logic_vector'("100"); --4
		-- --------------------
		WAIT FOR 100 ns; -- Time=400 ns
		dr <= transport std_logic_vector'("100"); --4
		sb <= transport std_logic_vector'("011"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=500 ns
		dr <= transport std_logic_vector'("101"); --5
		sb <= transport std_logic_vector'("010"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=600 ns
		dr <= transport std_logic_vector'("110"); --6
		sb <= transport std_logic_vector'("001"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=700 ns
		dr <= transport std_logic_vector'("111"); --7
		sb <= transport std_logic_vector'("000"); --0
		-- --------------------
		WAIT FOR 1000 ns; -- Time=1700 ns
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

CONFIGURATION extend_cfg OF testbench IS
	FOR testbench_arch
	END FOR;
END extend_cfg;
