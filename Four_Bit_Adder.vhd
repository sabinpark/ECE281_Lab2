----------------------------------------------------------------------------------
-- Company:    USAFA
-- Engineer:   C3C Sabin PArk
-- 
-- Create Date:    08:00:46 02/10/2014 
-- Module Name:    Four_Bit_Adder - Structural 
-- Project Name:   Lab 2
-- Target Devices: FPGA
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

entity Four_Bit_Adder is
    Port ( Ain : in  STD_LOGIC_VECTOR (3 downto 0);
           Bin : in  STD_LOGIC_VECTOR (3 downto 0);
           Result : out  STD_LOGIC_VECTOR (3 downto 0));
end Four_Bit_Adder;

architecture Structural of Four_Bit_Adder is
	component full_adder
		 Port ( Cin  : in  STD_LOGIC;
				  A 	 : in  STD_LOGIC;
				  B 	 : in  STD_LOGIC;
				  Cout : out  STD_LOGIC;
				  S 	 : out  STD_LOGIC);
	end component;
	
	signal C0 : std_logic;
	signal C1 : std_logic;
	signal C2 : std_logic;
	signal nullWire : std_logic;
	
begin
	Bit0: Single_Bit_Full_Adder PORT MAP(
		Cin => '0',
		A => Ain(0),
		B => Bin(0),
		Cout => C0,
		S => Result(0));
		
	Bit1: Single_Bit_Full_Adder PORT MAP(
		Cin => C0,
		A => Ain(1),
		B => Bin(1),
		Cout => C1,
		S => Result(1));
		
	Bit2: Single_Bit_Full_Adder PORT MAP(
		Cin => C1,
		A => Ain(2),
		B => Bin(2),
		Cout => C2,
		S => Result(2));
	
	Bit3: Single_Bit_Full_Adder PORT MAP(
		Cin => C2,
		A => Ain(3),
		B => Bin(3),
		Cout => nullWire,
		S => Result(3));

end Structural;

