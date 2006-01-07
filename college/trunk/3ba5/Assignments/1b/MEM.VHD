-- $Id: memory.vhd,v 1.2 2004/05/13 11:35:32 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memory is
	Port (
		 rw : in std_logic;
		 address : in std_logic_vector(5 downto 0);
		 dbus : inout std_logic_vector (31 downto 0)
		 );

end memory;

architecture Behavioral of memory is

begin

	type data_type is array (63 downto 0) of std_logic_vector (31 downto 0); 
	SIGNAL data : data_type;	

begin 
 	if (rw'event and rw = '1') then 
	 	-- r/w is 1, so we're reading memory.
		dbus <= data(conv_integer(address));
 	else if (rw'event and rw = '0') then
		-- r/w is 0, so we're writing to memory.
		data(conv_integer(address)) <= dbus;
	end if;
end process; 

end Behavioral;
