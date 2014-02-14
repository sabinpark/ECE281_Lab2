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
    Port ( PushButton : in STD_LOGIC;
			  Ain : in  STD_LOGIC_VECTOR (3 downto 0);
           Bin : in  STD_LOGIC_VECTOR (3 downto 0);
			  Result : out  STD_LOGIC_VECTOR (3 downto 0);
			  Overflow : out STD_LOGIC);
end Four_Bit_Adder;

architecture Structural of Four_Bit_Adder is
	component Single_Bit_Full_Adder
		 Port ( Cin  : in  STD_LOGIC;
				  A 	 : in  STD_LOGIC;
				  B 	 : in  STD_LOGIC;
				  Cout : out  STD_LOGIC;
				  S 	 : out  STD_LOGIC);
	end component;
	
	component multiplexer
		Port ( Switch 	: in  STD_LOGIC;  -- will be used with a push button
				 D0		: in  STD_LOGIC_VECTOR (3 downto 0);
		  	 	 D1	 	: in  STD_LOGIC_VECTOR (3 downto 0);
				 Y	 		: out STD_LOGIC_VECTOR (3 downto 0));  -- operation will be ADD for 0 and SUBTRACT for 1
	end component;
	
	signal Bin_NOT 	: std_logic_vector (3 downto 0);
	signal muxOutput  : std_logic_vector (3 downto 0);
	
	signal C1 : std_logic;
	signal C2 : std_logic;
	signal C3 : std_logic;
	signal finalCarry : std_logic;
	
begin
	Bin_NOT <= not Bin;

	Mux: multiplexer PORT MAP(
		Switch => PushButton, 
		D0	 	 => Bin, 
		D1		 => Bin_NOT, 
		Y 		 => muxOutput);

	Bit0: Single_Bit_Full_Adder PORT MAP(
		Cin => PushButton,
		A => Ain(0),
		B => muxOutput(0),
		Cout => C1,
		S => Result(0));
		
	Bit1: Single_Bit_Full_Adder PORT MAP(
		Cin => C1,
		A => Ain(1),
		B => muxOutput(1),
		Cout => C2,
		S => Result(1));
		
	Bit2: Single_Bit_Full_Adder PORT MAP(
		Cin => C2,
		A => Ain(2),
		B => muxOutput(2),
		Cout => C3,
		S => Result(2));
	
	Bit3: Single_Bit_Full_Adder PORT MAP(
		Cin => C3,
		A => Ain(3),
		B => muxOutput(3),
		Cout => finalCarry,
		S => Result(3));

	Overflow <= C3 XOR finalCarry;

end Structural;

