-- Michael Manzke 
-- michael.manzke@cs.tcd.ie 
-- 25 April 2003 

library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

	entity control_memory is Port(
											MW : out std_logic;
											MM : out std_logic ;
											RW : out std_logic ;
											MD : out std_logic ;
											FS : out std_logic_vector (4 downto 0);
											MB : out std_logic;
											TB : out std_logic;
											TA : out std_logic;
											TD : out std_logic ;
											PL : out std_logic;
											PI : out std_logic ;
											IL : out std_logic ;
											MC : out std_logic ;
											MS : out std_logic_vector (2 downto 0);
											NA : out std_logic_vector (7 downto 0);
											IN_CAR : in std_logic_vector (7 downto 0)
											);
										
	end control_memory;


	architecture Behavioral of control_memory is 
	typemem _array i s array(0 to 255) of std_logic_vector (27 downto 0);
	
	begin memory_m: process(IN_CAR) variablecontrol_mem : mem _array:=(
																						-- 0 
																						X"FFFFFFF", -- 0 
																						X"0000000", -- 1 
																						X"AAAAAAA", -- 2 
																						X"0000000", -- 3 
																						X"BBBBBBB", -- 4 
																						X"0000000", -- 5 
																						X"CCCCCCC", -- 6 
																						X"0000000", -- 7 
																						X"DDDDDDD", -- 8 
																						X"0000000", -- 9 
																						X"1111111", -- A 
																						X"0000000", -- B 
																						X"2222222", -- C 
																						X"0000000", -- D 
																						X"3333333", -- E 
																						X"0000000", -- F 
																						-- 1 
																						X"0000000", -- 0 
																						X"0000000", -- 1 
																						X"0000000", -- 2 
																						X"0000000", -- 3 
																						X"0000000", -- 4 
																						X"0000000", -- 5 
																						X"0000000", -- 6 
																						X"0000000", -- 7
																						X"0000000", -- 8 
																						X"0000000", -- 9 
																						X"0000000", -- A 
																						X"0000000", -- B 
																						X"0000000", -- C 
																						X"0000000", -- D 
																						X"0000000", -- E 
																						X"0000000" -- F 
																						); 
																						
		variable addr : integer ; vector (27 downto 0); 
			
		begin 
			
			addr := conv_integer(IN_CAR);
			control_out := control_mem(addr);
			MW <= control_out(0);
			MM <= control_out(1);
			RW <= control_out(2);
			MD <= control_out(3);
			FS <= control_out(8 downto 4);
			MB <= control_out(9);
			TB <= control_out(10);
			TA <= control_out(11);
			TD <= control_out(12);
			PL <= control_out(13);
			PI <= control_out(14);
			IL <= control_out(15);
			MC <= control_out(16);
			MS <= control_out(19 downto 17);
			NA <= control_out(27 downto 20);
				
		end process ;
			
	end Behavioral ;
