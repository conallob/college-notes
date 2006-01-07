-- F:\3BA5\ASSIGNMENTS\1A
-- VHDL Test Bench created by
-- HDL Bencher 6.1i
-- Thu Dec 09 22:01:04 2004
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

ENTITY mem_tb IS
END mem_tb;

ARCHITECTURE testbench_arch OF mem_tb IS
-- If you get a compiler error on the following line,
-- from the menu do Options->Configuration select VHDL 87
FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";
	COMPONENT memory
		PORT (
			rw : In  std_logic;
			address : In  std_logic_vector (5 DOWNTO 0);
			dbus : InOut  std_logic_vector (31 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL rw : std_logic;
	SIGNAL address : std_logic_vector (5 DOWNTO 0);
	SIGNAL dbus : std_logic_vector (31 DOWNTO 0);

BEGIN
	UUT : memory
	PORT MAP (
		rw => rw,
		address => address,
		dbus => dbus
	);

	PROCESS
		VARIABLE TX_OUT : LINE;
		VARIABLE TX_ERROR : INTEGER := 0;

		PROCEDURE CHECK_dbus(
			next_dbus : std_logic_vector (31 DOWNTO 0);
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (dbus /= next_dbus) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns dbus="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, dbus);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_dbus);
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
		rw <= transport '0';
		address <= transport std_logic_vector'("000000"); --0
		dbus <= transport std_logic_vector'("00000000000000000000000000000100"); --4
		-- --------------------
		WAIT FOR 2 ns; -- Time=2 ns
		rw <= transport '1';
		address <= transport std_logic_vector'("000000"); --0
		dbus <= transport std_logic_vector'("00000000000000000000000000000100"); --4
		-- --------------------
		WAIT FOR 2 ns; -- Time=4 ns
		rw <= transport '0';
		address <= transport std_logic_vector'("000000"); --0
		-- --------------------
		WAIT FOR 2 ns; -- Time=6 ns
		address <= transport std_logic_vector'("000000"); --0
		-- --------------------
		WAIT FOR 2 ns; -- Time=8 ns
		rw <= transport '0';
		address <= transport std_logic_vector'("000000"); --0
		-- --------------------
		WAIT FOR 2 ns; -- Time=10 ns
		address <= transport std_logic_vector'("000000"); --0
		-- --------------------
		WAIT FOR 2 ns; -- Time=12 ns
		rw <= transport '0';
		address <= transport std_logic_vector'("000000"); --0
		-- --------------------
		WAIT FOR 2 ns; -- Time=14 ns
		rw <= transport '0';
		address <= transport std_logic_vector'("000000"); --0
		-- --------------------
		WAIT FOR 2 ns; -- Time=16 ns
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

CONFIGURATION memory_cfg OF mem_tb IS
	FOR testbench_arch
	END FOR;
END memory_cfg;
