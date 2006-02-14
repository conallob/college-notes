-- F:\2BA4\VHDL\2\2\OPCODE_TB.VHW
-- VHDL Test Bench created by
-- HDL Bencher 4.1i
-- Wed May 12 15:12:11 2004
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
	COMPONENT opcode
		PORT (
			DATA_IN : in  std_logic_vector (15 DOWNTO 0);
			IL : in  std_logic;
			CLK : in  std_logic;
			DR : out  std_logic_vector (2 DOWNTO 0);
			SA : out  std_logic_vector (2 DOWNTO 0);
			SB : out  std_logic_vector (2 DOWNTO 0);
			OPCODE_OUT : out  std_logic_vector (7 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL DATA_IN : std_logic_vector (15 DOWNTO 0);
	SIGNAL IL : std_logic;
	SIGNAL CLK : std_logic;
	SIGNAL DR : std_logic_vector (2 DOWNTO 0);
	SIGNAL SA : std_logic_vector (2 DOWNTO 0);
	SIGNAL SB : std_logic_vector (2 DOWNTO 0);
	SIGNAL OPCODE_OUT : std_logic_vector (7 DOWNTO 0);

BEGIN
	UUT : opcode
	PORT MAP (
		DATA_IN => DATA_IN,
		IL => IL,
		CLK => CLK,
		DR => DR,
		SA => SA,
		SB => SB,
		OPCODE_OUT => OPCODE_OUT
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

		PROCEDURE CHECK_DR(
			next_DR : std_logic_vector (2 DOWNTO 0);
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (DR /= next_DR) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns DR="));
				write(TX_LOC, DR);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_DR);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_SA(
			next_SA : std_logic_vector (2 DOWNTO 0);
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (SA /= next_SA) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns SA="));
				write(TX_LOC, SA);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_SA);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_SB(
			next_SB : std_logic_vector (2 DOWNTO 0);
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (SB /= next_SB) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns SB="));
				write(TX_LOC, SB);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_SB);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_OPCODE_OUT(
			next_OPCODE_OUT : std_logic_vector (7 DOWNTO 0);
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (OPCODE_OUT /= next_OPCODE_OUT) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns OPCODE_OUT="));
				write(TX_LOC, OPCODE_OUT);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_OPCODE_OUT);
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
		DATA_IN <= transport std_logic_vector'("1011001001010110"); --B256
		IL <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=100 ns
		DATA_IN <= transport std_logic_vector'("0001000111001000"); --11C8
		IL <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=200 ns
		DATA_IN <= transport std_logic_vector'("1011000110010111"); --B197
		IL <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=300 ns
		DATA_IN <= transport std_logic_vector'("1101010101101000"); --D568
		IL <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=400 ns
		DATA_IN <= transport std_logic_vector'("1000101001101000"); --8A68
		IL <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=500 ns
		DATA_IN <= transport std_logic_vector'("0000000110110011"); --1B3
		-- --------------------
		WAIT FOR 100 ns; -- Time=600 ns
		DATA_IN <= transport std_logic_vector'("0001010100111011"); --153B
		IL <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=700 ns
		DATA_IN <= transport std_logic_vector'("0000000000000001"); --1
		-- --------------------
		WAIT FOR 960 ns; -- Time=1660 ns
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

CONFIGURATION opcode_cfg OF testbench IS
	FOR testbench_arch
	END FOR;
END opcode_cfg;
