--------------------------------------------------------------------------------
-- Company:    USAFA
-- Engineer:   C3C Sabin PArk
--
-- Create Date:   20:36:31 02/09/2014
-- Module Name:   C:/Users/C16Sabin.Park/Documents/Classes/Semester 4/ECE 281/Lab2/full_adder_testbench.vhd
-- Project Name:  Lab2
-- 
-- VHDL Test Bench Created by ISE for module: Single_Bit_Full_Adder
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY full_adder_testbench IS
END full_adder_testbench;
 
ARCHITECTURE behavior OF full_adder_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Single_Bit_Full_Adder
    PORT(
         Cin  : IN  std_logic;
         A 	  : IN  std_logic;
         B    : IN  std_logic;
         Cout : OUT  std_logic;
         S    : OUT  std_logic);
    END COMPONENT;
    

   --Inputs
   signal Cin : std_logic := '0';
   signal A   : std_logic := '0';
   signal B   : std_logic := '0';

 	--Outputs
   signal Cout : std_logic;
   signal S    : std_logic;
	
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Single_Bit_Full_Adder PORT MAP (
          Cin => Cin,
          A => A,
          B => B,
          Cout => Cout,
          S => S);

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 
   -- Stimulus process
   stim_proc: process
   begin		
		
		Cin <= '0';
		A <= '0';
		B <= '0';
		wait for 100 ns;	
		
		Cin <= '0';
		A <= '0';
		B <= '1';
		wait for 100 ns;	
		
		Cin <= '0';
		A <= '1';
		B <= '0';
		wait for 100 ns;

		Cin <= '0';
		A <= '1';
		B <= '1';
		wait for 100 ns;
		
		Cin <= '1';
		A <= '0';
		B <= '0';
		wait for 100 ns;

		Cin <= '1';
		A <= '0';
		B <= '1';
		wait for 100 ns;
		
		Cin <= '1';
		A <= '1';
		B <= '0';
		wait for 100 ns;
		
		Cin <= '1';
		A <= '1';
		B <= '1';
		wait for 100 ns;

      wait;
   end process;

END;
