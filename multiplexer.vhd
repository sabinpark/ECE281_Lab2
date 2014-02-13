----------------------------------------------------------------------------------
-- Company:    USAFA
-- Engineer:   C3C Sabin Park
-- 
-- Create Date:    17:28:53 02/10/2014 
-- Module Name:    multiplexer - Behavioral 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity multiplexer is
    Port ( Switch : in  STD_LOGIC;
			  D0	 	: in  STD_LOGIC_VECTOR (3 downto 0);
           D1 		: in  STD_LOGIC_VECTOR (3 downto 0);
           Y	 	: out STD_LOGIC_VECTOR (3 downto 0));
end multiplexer;

architecture Behavioral of multiplexer is

begin

	with Switch select
	Y	 <= D0 when '0',
			 D1 when '1',
			 "0101" when others;  -- just some random, never outputed value

end Behavioral;

