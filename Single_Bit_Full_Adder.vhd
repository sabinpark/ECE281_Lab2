----------------------------------------------------------------------------------
-- Company:    USAFA
-- Engineer:   C3C Sabin Park
-- 
-- Create Date:    17:22:49 02/09/2014
-- Module Name:    Single_Bit_Full_Adder - Behavioral 
-- Project Name:   Lab2
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Single_Bit_Full_Adder is
    Port ( Cin  : in  STD_LOGIC;
           A 	 : in  STD_LOGIC;
           B 	 : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           S 	 : out  STD_LOGIC);
end Single_Bit_Full_Adder;

architecture Behavioral of Single_Bit_Full_Adder is

begin
	S <= A xor B xor Cin;
	Cout <= (A and B) or (A and Cin) or (B and Cin);
end Behavioral;

