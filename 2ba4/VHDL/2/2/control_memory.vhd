-- $Id: control_memory.vhd,v 1.1 2004/05/13 11:35:31 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_memory is
    Port ( place : in std_logic_vector(7 downto 0);
           NA : out std_logic_vector(7 downto 0);
           MS : out std_logic_vector(2 downto 0);
           MC : out std_logic;
           IL : out std_logic;
           PI : out std_logic;
           PL : out std_logic;
           TD : out std_logic;
           TA : out std_logic;
           TB : out std_logic;
           MB : out std_logic;
           FS : out std_logic_vector(4 downto 0);
           MD : out std_logic;
           RW : out std_logic;
           MM : out std_logic;
           MW : out std_logic);
end control_memory;

architecture Behavioral of control_memory is

	type mem_array is array (0 to 255) of std_logic_vector(27 downto 0);

begin

	process (place)

	variable ctrl_mem : mem_array := (

	X"fffffff",X"bbbcccd",X"444447f",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",
	X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000",X"0000000"
	);

	variable addr : integer;
	variable ctrl_sig : std_logic_vector(27 downto 0);

	begin

	addr := conv_integer(place);
	ctrl_sig := ctrl_mem(addr);

	MW <= ctrl_sig(0);
	MM <= ctrl_sig(1);
	RW <= ctrl_sig(2);
	MD <= ctrl_sig(3);
	FS <= ctrl_sig(8 downto 4);
	MB <= ctrl_sig(9);
	TB <= ctrl_sig(10);
	TA <= ctrl_sig(11);
	TD <= ctrl_sig(12);
	PL <= ctrl_sig(13);
	PI <= ctrl_sig(14);
	IL <= ctrl_sig(15);
	MC <= ctrl_sig(16);
	MS <= ctrl_sig(19 downto 17);
	NA <= ctrl_sig(27 downto 20);

	end process;

end Behavioral;