-- F:\2BA4\VHDL\2\2\LOGIC_TB.VHW
-- VHDL Test Bench created by
-- HDL Bencher 4.1i
-- Wed May 12 10:44:56 2004
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
	COMPONENT logic_16bit
		PORT (
			SEL : in  std_logic_vector (1 DOWNTO 0);
			A : in  std_logic_vector (15 DOWNTO 0);
			B : in  std_logic_vector (15 DOWNTO 0);
			MUX_OUT : out  std_logic_vector (15 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL SEL : std_logic_vector (1 DOWNTO 0);
	SIGNAL A : std_logic_vector (15 DOWNTO 0);
	SIGNAL B : std_logic_vector (15 DOWNTO 0);
	SIGNAL MUX_OUT : std_logic_vector (15 DOWNTO 0);

BEGIN
	UUT : logic_16bit
	PORT MAP (
		SEL => SEL,
		A => A,
		B => B,
		MUX_OUT => MUX_OUT
	);

	PROCESS
		VARIABLE TX_OUT : LINE;
		VARIABLE TX_ERROR : INTEGER := 0;

		PROCEDURE CHECK_MUX_OUT(
			next_MUX_OUT : std_logic_vector (15 DOWNTO 0);
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (MUX_OUT /= next_MUX_OUT) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns MUX_OUT="));
				write(TX_LOC, MUX_OUT);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_MUX_OUT);
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
		SEL <= transport std_logic_vector'("00"); --0
		A <= transport std_logic_vector'("1101110010100110"); --DCA6
		B <= transport std_logic_vector'("0000001000110100"); --234
		-- --------------------
		WAIT FOR 100 ns; -- Time=100 ns
		SEL <= transport std_logic_vector'("01"); --1
		A <= transport std_logic_vector'("0001100110010010"); --1992
		B <= transport std_logic_vector'("0001011011010111"); --16D7
		-- --------------------
		WAIT FOR 100 ns; -- Time=200 ns
		SEL <= transport std_logic_vector'("10"); --2
		A <= transport std_logic_vector'("0000001111011000"); --3D8
		B <= transport std_logic_vector'("0000001010001110"); --28E
		-- --------------------
		WAIT FOR 100 ns; -- Time=300 ns
		SEL <= transport std_logic_vector'("11"); --3
		A <= transport std_logic_vector'("0000100110010110"); --996
		B <= transport std_logic_vector'("0000001111011000"); --3D8
		-- --------------------
		WAIT FOR 100 ns; -- Time=400 ns
		SEL <= transport std_logic_vector'("00"); --0
		A <= transport std_logic_vector'("0000000001010100"); --54
		B <= transport std_logic_vector'("0000010101001010"); --54A
		-- --------------------
		WAIT FOR 100 ns; -- Time=500 ns
		SEL <= transport std_logic_vector'("01"); --1
		A <= transport std_logic_vector'("0000001010101100"); --2AC
		B <= transport std_logic_vector'("0001110101101011"); --1D6B
		-- --------------------
		WAIT FOR 100 ns; -- Time=600 ns
		SEL <= transport std_logic_vector'("10"); --2
		A <= transport std_logic_vector'("0000000000110011"); --33
		B <= transport std_logic_vector'("0000000010100101"); --A5
		-- --------------------
		WAIT FOR 100 ns; -- Time=700 ns
		SEL <= transport std_logic_vector'("11"); --3
		A <= transport std_logic_vector'("0000000111100100"); --1E4
		B <= transport std_logic_vector'("0001001001001100"); --124C
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

CONFIGURATION logic_16bit_cfg OF testbench IS
	FOR testbench_arch
	END FOR;
END logic_16bit_cfg;
