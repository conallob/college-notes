-- F:\2BA4\VHDL\2\2\CONTROL_MEMORY_TB.VHW
-- VHDL Test Bench created by
-- HDL Bencher 4.1i
-- Wed May 12 15:10:39 2004
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
	COMPONENT control_memory
		PORT (
			place : in  std_logic_vector (7 DOWNTO 0);
			NA : out  std_logic_vector (7 DOWNTO 0);
			MS : out  std_logic_vector (2 DOWNTO 0);
			MC : out  std_logic;
			IL : out  std_logic;
			PI : out  std_logic;
			PL : out  std_logic;
			TD : out  std_logic;
			TA : out  std_logic;
			TB : out  std_logic;
			MB : out  std_logic;
			FS : out  std_logic_vector (4 DOWNTO 0);
			MD : out  std_logic;
			RW : out  std_logic;
			MM : out  std_logic;
			MW : out  std_logic
		);
	END COMPONENT;

	SIGNAL place : std_logic_vector (7 DOWNTO 0);
	SIGNAL NA : std_logic_vector (7 DOWNTO 0);
	SIGNAL MS : std_logic_vector (2 DOWNTO 0);
	SIGNAL MC : std_logic;
	SIGNAL IL : std_logic;
	SIGNAL PI : std_logic;
	SIGNAL PL : std_logic;
	SIGNAL TD : std_logic;
	SIGNAL TA : std_logic;
	SIGNAL TB : std_logic;
	SIGNAL MB : std_logic;
	SIGNAL FS : std_logic_vector (4 DOWNTO 0);
	SIGNAL MD : std_logic;
	SIGNAL RW : std_logic;
	SIGNAL MM : std_logic;
	SIGNAL MW : std_logic;

BEGIN
	UUT : control_memory
	PORT MAP (
		place => place,
		NA => NA,
		MS => MS,
		MC => MC,
		IL => IL,
		PI => PI,
		PL => PL,
		TD => TD,
		TA => TA,
		TB => TB,
		MB => MB,
		FS => FS,
		MD => MD,
		RW => RW,
		MM => MM,
		MW => MW
	);

	PROCESS
		VARIABLE TX_OUT : LINE;
		VARIABLE TX_ERROR : INTEGER := 0;

		PROCEDURE CHECK_NA(
			next_NA : std_logic_vector (7 DOWNTO 0);
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (NA /= next_NA) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns NA="));
				write(TX_LOC, NA);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_NA);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_MS(
			next_MS : std_logic_vector (2 DOWNTO 0);
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (MS /= next_MS) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns MS="));
				write(TX_LOC, MS);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_MS);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_MC(
			next_MC : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (MC /= next_MC) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns MC="));
				write(TX_LOC, MC);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_MC);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_IL(
			next_IL : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (IL /= next_IL) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns IL="));
				write(TX_LOC, IL);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_IL);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_PI(
			next_PI : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (PI /= next_PI) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns PI="));
				write(TX_LOC, PI);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_PI);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_PL(
			next_PL : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (PL /= next_PL) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns PL="));
				write(TX_LOC, PL);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_PL);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_TD(
			next_TD : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (TD /= next_TD) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns TD="));
				write(TX_LOC, TD);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_TD);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_TA(
			next_TA : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (TA /= next_TA) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns TA="));
				write(TX_LOC, TA);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_TA);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_TB(
			next_TB : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (TB /= next_TB) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns TB="));
				write(TX_LOC, TB);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_TB);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_MB(
			next_MB : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (MB /= next_MB) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns MB="));
				write(TX_LOC, MB);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_MB);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_FS(
			next_FS : std_logic_vector (4 DOWNTO 0);
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (FS /= next_FS) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns FS="));
				write(TX_LOC, FS);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_FS);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_MD(
			next_MD : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (MD /= next_MD) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns MD="));
				write(TX_LOC, MD);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_MD);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_RW(
			next_RW : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (RW /= next_RW) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns RW="));
				write(TX_LOC, RW);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_RW);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_MM(
			next_MM : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (MM /= next_MM) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns MM="));
				write(TX_LOC, MM);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_MM);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_MW(
			next_MW : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (MW /= next_MW) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns MW="));
				write(TX_LOC, MW);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_MW);
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
		place <= transport std_logic_vector'("11111111"); --FF
		-- --------------------
		WAIT FOR 100 ns; -- Time=100 ns
		place <= transport std_logic_vector'("01111101"); --7D
		-- --------------------
		WAIT FOR 100 ns; -- Time=200 ns
		place <= transport std_logic_vector'("00101001"); --29
		-- --------------------
		WAIT FOR 100 ns; -- Time=300 ns
		place <= transport std_logic_vector'("01001010"); --4A
		-- --------------------
		WAIT FOR 100 ns; -- Time=400 ns
		place <= transport std_logic_vector'("00100100"); --24
		-- --------------------
		WAIT FOR 100 ns; -- Time=500 ns
		place <= transport std_logic_vector'("00001111"); --F
		-- --------------------
		WAIT FOR 100 ns; -- Time=600 ns
		place <= transport std_logic_vector'("10001110"); --8E
		-- --------------------
		WAIT FOR 100 ns; -- Time=700 ns
		place <= transport std_logic_vector'("00100011"); --23
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

CONFIGURATION control_memory_cfg OF testbench IS
	FOR testbench_arch
	END FOR;
END control_memory_cfg;
