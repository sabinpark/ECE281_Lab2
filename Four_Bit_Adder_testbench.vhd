--------------------------------------------------------------------------------
-- Company:    USAFA
-- Engineer:   C3C Sabin Park
--
-- Create Date:   15:03:35 02/10/2014
-- Module Name:   C:/Users/C16Sabin.Park/Documents/Classes/Semester 4/ECE 281/Lab2/Four_Bit_Adder_testbench.vhd
-- Project Name:  Lab2
-- 
-- VHDL Test Bench Created by ISE for module: Four_Bit_Adder
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
use ieee.std_logic_unsigned.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Four_Bit_Adder_testbench IS
END Four_Bit_Adder_testbench;
 
ARCHITECTURE behavior OF Four_Bit_Adder_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Four_Bit_Adder
    PORT(PushButton : in STD_LOGIC;
         Ain : IN  std_logic_vector(3 downto 0);
         Bin : IN  std_logic_vector(3 downto 0);
         Result : OUT  std_logic_vector(3 downto 0);
			Overflow : out STD_LOGIC
        );
    END COMPONENT;

   --Inputs
	signal PushButton : std_logic := '0';
   signal Ain : std_logic_vector(3 downto 0) := (others => '0');
   signal Bin : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Result : std_logic_vector(3 downto 0);
	signal Overflow : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Four_Bit_Adder PORT MAP (
          PushButton => PushButton,
			 Ain => Ain,
          Bin => Bin,
          Result => Result,
			 Overflow => Overflow
		  );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 5 ns.
      wait for 5 ns;	
		
		-- initially sets everything as working fine...
		-- but later will report errors if there are any
		report "EVERYTHING WORKS SUCCESSFULLY!!!   ";
		
		----- start of addition test -----
		for I in 0 to 15 loop
			for J in 0 to 15 loop
				wait for 1 ns;
				
				-- check if this is true!
				assert (Result = Ain + Bin) 
					report "JUST KIDDING!  CHECK THIS OUT:   " &
					"Operation: ADDITION" & "     ,     " &
					"Ain  [" &
					std_logic'image(Ain(3)) & "  " &
					std_logic'image(Ain(2)) & "  " &
					std_logic'image(Ain(1)) & "  " &
					std_logic'image(Ain(0)) & "]     +     " &
					"Bin  [" &
					std_logic'image(Bin(3)) & "  " &
					std_logic'image(Bin(2)) & "  " &
					std_logic'image(Bin(1)) & "  " &
					std_logic'image(Bin(0)) & "]     =     " &
					"Result  [" &
					std_logic'image(Result(3)) & "  " &
					std_logic'image(Result(2)) & "  " &
					std_logic'image(Result(1)) & "  " &
					std_logic'image(Result(0)) & "]         "
				
				-- only outputs the above in the console if Result != Ain + Bin
				severity ERROR;
				
				Bin <= Bin + "0001";
			end loop;
			
			Ain <= Ain + "0001";
		end loop;
		
		----- start of subtraction test -----
		PushButton <= '1';
		Ain <= "0000";
		Bin <= "0000";
		
		for K in 0 to 15 loop
			for L in 0 to 15 loop
				wait for 1 ns;
				
				-- check if this is true!
				assert (Result = Ain - Bin) 
				
					report "JUST KIDDING!  CHECK THIS OUT:   " &
					"Operation: SUBTRACTION" & "     ,     " &
					"Ain  [" &
					std_logic'image(Ain(3)) & "  " &
					std_logic'image(Ain(2)) & "  " &
					std_logic'image(Ain(1)) & "  " &
					std_logic'image(Ain(0)) & "]     -     " &
					"Bin  [" &
					std_logic'image(Bin(3)) & "  " &
					std_logic'image(Bin(2)) & "  " &
					std_logic'image(Bin(1)) & "  " &
					std_logic'image(Bin(0)) & "]     =     " &
					"Result  [" &
					std_logic'image(Result(3)) & "  " &
					std_logic'image(Result(2)) & "  " &
					std_logic'image(Result(1)) & "  " &
					std_logic'image(Result(0)) & "]         "
				
				-- only outputs the above in the console if Result != Ain - Bin
				severity ERROR;
				
				Bin <= Bin + "0001";
			end loop;
			
			Ain <= Ain + "0001";
		end loop;
		
      wait;
   end process;

END;
