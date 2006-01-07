-- $Id: memory.vhd,v 1.2 2004/05/13 11:35:32 conall Exp $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memory is
    Port (CLK, MW : in std_logic;
	 A : in std_logic_vector(8 downto 0);
	 Din : in std_logic_vector (15 downto 0);
	 Dout : out std_logic_vector(15 downto 0));

end memory;

architecture Behavioral of memory is

	type data_type is array (511 downto 0) of std_logic_vector (15 downto 0); 
	SIGNAL data : data_type;

begin

process (CLK) 
 begin 
 	if (CLK'event and CLK = '1' and MW = '1') then  
 		data(conv_integer(A)) <= Din; 
 	end if; 
 end process; 
 
Dout <= data(conv_integer(A));


end Behavioral;
