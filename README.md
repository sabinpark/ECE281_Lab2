ECE281_Lab2
===========
Sabin's Lab 2

# Functionality Update
Captain Silva checked my design.  Full points for functionality!

# Pre-Lab
## Full Adder
A 1-bit full adder is a component that takes in 3 binary inputs and returns the sum of the three.  The three inputs are A, B, and Cin (carry in).  The two outputs in a 1-bit adder are S (sum) and Cout (carry out).

### Full Adder Schematic and Truth Table
A schematic of the 1-bit full adder was provdided.  Using this schematic, I created a truth table (also shown below).  The truth table was double checked with the information provided in the Digital Design and Computer Architecture textbook on page 240.

#### Schematic
![alt text](https://raw2.github.com/sabinpark/ECE281_Lab2/master/full_adder_schematic.png "Full Adder Schematic")
#### Truth Table
![alt text](https://raw2.github.com/sabinpark/ECE281_Lab2/master/1_bit_adder_truth_table.PNG "Full Adder Truth Table")

### Boolean Equations
Using the truth table, I created two Karnaugh maps, one each for SUM and C_OUT.  Next, I used those k-maps to come up with the boolean equations.  I verified my answers with the text once again.

#### Karnaugh Maps and Boolean Equations
![alt text](https://raw2.github.com/sabinpark/ECE281_Lab2/master/full_adder_kmaps_equations.PNG "K-Maps and Boolean Equations")

### Interface
Below is an image of the full adder interface drawn in two different ways.  Both show three inputs and two outputs as explained above.

![alt text](https://raw2.github.com/sabinpark/ECE281_Lab2/master/full_adder_interfaces.png "Full Adder Interface")

### VHDL Module and Test Bench
The three inputs and the two outputs were set as standard logic signals.  The code below shows the CONNECTION part of the module:
```vhdl
  S <= A xor B xor Cin;
  Cout <= (A and B) or (A and Cin) or (B and Cin);
```
Each binary combination of the inputs were tested in the test bench and are displayed in the waveform image below:
#### Full Adder Test Bench Results
![alt text](https://raw2.github.com/sabinpark/ECE281_Lab2/master/full_adder_waveform.PNG "Full Adder Waveform")

Comparing the values of the waveform with the simulation proved that the simulation was a success!

## Errors/Debugging
Everything in my code seemed to be working well.  The syntax for the full adder and the test bench were correct.  However, when I first ran my simulation, the results were all "U".  This meant that the inputs were not found properly.  I went over my code multiple times and to no avail, the results were still incorrect.  On a whim, I decided to restart ISE project navigator.  I then reran the simulation and I got the correct results.  I realized that when a simulation doesn't work, it may be due to the program itself and that restarting may be required.

# Lab
## 4-Bit Adder (ADDITION)
The first part of the actual lab portion was to create a 4-bit adder by chaining four of the 1-bit full adders together.  I created a schematic of the 4-bit adder as shown below:
![alt text](https://raw2.github.com/sabinpark/ECE281_Lab2/master/4_bit_adder_addition_schematic.PNG "4_Bit Adder Addition Schematic")

For the adder, I set the *Cin* of the LSB as 0.  The rest of the *Cin*s were set as the *Cout*s of the previous bit.  This schematic follows exactly what I did in the vhdl module.

### VHDL for the 4-Bit Adder (ADDITION)
Below is the CONNECTIONS part of the 4-bit adder.  This was made using structural architecture.  As described earlier, the first bit (the LSB) has a *Cin* of *0*.  The rest of the bits take in the *Cout* of the previous bit.  Finally, the MSB outputs a *null* value for its *Cout*.

```
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
```

Essentially, the code above looks at 1 bit of the two input buses and sums it together with a carry in bit.  The sums are outputted into the respective bits for the *sum* bus.  *NOTE:* I had to create intermediary signals within the ARCHITECTURE part of the module.  These intermediary signals were used to set the carry in and carry out bits.

### UCF
Just like with Lab 1, I set each input and output signals with the appropriate switches/LEDs on the FPGA.  This was simple to do.
```
	# ==== Slide Switches (SW) ====
	NET "Ain(3)" LOC = "R17"; # Type = INPUT, Sch name = SW7
	NET "Ain(2)" LOC = "N17"; # Type = INPUT, Sch name = SW6
	NET "Ain(1)" LOC = "L13"; # Type = INPUT, Sch name = SW5
	NET "Ain(0)" LOC = "L14"; # Type = INPUT, Sch name = SW4
	NET "Bin(3)" LOC = "K17"; # Type = INPUT, Sch name = SW3
	NET "Bin(2)" LOC = "K18"; # Type = INPUT, Sch name = SW2
	NET "Bin(1)" LOC = "H18"; # Type = INPUT, Sch name = SW1
	NET "Bin(0)" LOC = "G18"; # Type = INPUT, Sch name = SW0
	
	# LED outputs constraints
	NET "Result(3)"  LOC = "K14"; # Sch name = LD3
	NET "Result(2)"  LOC = "K15"; # Sch name = LD2
	NET "Result(1)"  LOC = "J15"; # Sch name = LD1
	NET "Result(0)"  LOC = "J14"; # Sch name = LD0
```

## 4-Bit Adder (FULL FUNCTIONALITY)
Up to this point, the work I have done amounts only to a B.  Below, I will go through the additional functionality that I added for full points.

### Subtraction
#### Overview and Design Process
The first additional functionality I implemented was subtraction.  Before jumping directly into the code, I first made an updated schematic of what the new four-bit full adder should do.  As shown below, I created the *NOT* of B, a multiplexer (MUX) to choose between B and B_NOT, another input (*C_in*) to act as the chooser for the MUX and the initial carry in of the full adder, and another output (overflow) to determine if overflow has occurred or not.  I will use a push button to alter the value of *C_in*.

##### 4-Bit Full Adder Final Schematic
![alt text](https://github.com/sabinpark/ECE281_Lab2/raw/master/4_bit_adder_full_schematic.PNG "4-Bit Adder Final Schematic")

This design works in such a way that if I do not press the push button, everything will work just the way it did with the addition-only verion of the full adder.  If I do press the push button, the MUX will output B_NOT, and the full adder will have an initial carry_in of 1.  To put it simply, this process converts B into its 2's complement.  By adding the inputs (A and the 2's complement of B) together, we now achieve subtraction of the two numbers.

### Multiplexer
To begin, I created a multiplexer (MUX) which will determine whether the input, B, is to be added or subracted from the other input, A.  The MUX had three inputs (D0, D1, and Switch) and one output (Y).  Since the MUX is essentially a "chooser", I programmed the MUX component so that if Switch = 0, the output would be whatever D0 was, and if Switch = 1, then the output would be whatever D1 would be.

**NOTE:** I had to account not only for the 0 and 1 output, but the *else* condition as well:
```
with Switch select
	Y <= D0 when '0',
	     D1 when '1',
	     "0101" when others;  -- just some random, never outputed value
```

I then declared the MUX component in the same section I declared the full_adders for each individual bit within the main vhdl file of the four bit full adder.  A generic MUX component was declared under ARCHITECTURE, and more specific inputs/outputs were set for the implementation of the MUX under CONNECTION.   

To connect the MUX, I had to create the *NOT* of the input, B.  This was easily done in the ARCHITECTURE and CONNECTION sections of the 4-bit full adder vhdl file.  The MUX was then set up as shown below:
```
	Mux: multiplexer PORT MAP(
		Switch => PushButton, 
		D0     => Bin, 
		D1     => Bin_NOT, 
		Y      => muxOutput);
```
As mentioned earlier, the "chooser" of the MUX will be implemented by the push button.

With this design, I plugged in my FPGA, generated my programming file, and was able to get the correct values when subtracting B from A.

### Overflow Detection and XOR
Before I went on to simulating my design with a testbench, I decided to make my design detect overflow using an LED.  I set the *Overflow* signal (mentioned above) to the left-most LED on the FPGA (LOC = R4). 

We know that if the sum of two negative numbers is positive, or the sum of two positive numbers is negative, then an overflow has occurred.  There is also a simple trick to detect if an overflow has occurred.  To do this, one must see if the carry in of the MSB is equal to its carry out.  For instance, adding 1100 + 1100 produces 1000 with a carry out of 1.  Since two negative numbers did indeed produce another negative number, an overflow has not occured.  Notice how the carry in of the MSB does indeed equal its carry out.  However, adding 1000 + 1000 produces 0000 with a carry out of 1.  Since the carry in of the MSB and its carry out are not equal, we may say that an overflow occurs.  This is validated by the fact that two negative numbers produced a positive sum.  Knowing this, I created a truth table using the MSB's carry in and carry out signals.  As a result, the output of the *overflow* signal is defined as the XOR of both inputs.  This change was applied to the final bit full adder component.  Shown below, *C3* is the *Cin* of the MSB, while *finalCarry* is the *Cout* of the MSB.
```
	Overflow <= C3 XOR finalCarry;
```

#### More Intermediary Connections
It is important to note the intermediary connections created under ARCHITECTURE.

Already used above, I added *finalCarry* (the final carry out).  I also added *muxOutput* (the output of the MUX--either B or B_not).

## Physical Test and Test Bench Simulation
After hooking up the FPGA once more, I generated the program file, and fortunately, the button did indeed correctly modify the device to do both addition and subtraction.

### Test Bench
I created the test bench with the appropriate inputs and outputs.  I set the initial values of the inputs/outputs as *0*.  **NOTE** I realized that single values should be surround by single quotes, while numbers with more than one bit required double quotes.  

ie) 
```
	'0' vs. "0000"
```

First, I reported a string that states that there are no errors and the program is successful.  If the test fails (meaning that the assertion statement below fails), then I made sure the console would refute the successfulness of the simulation and report the errors that occurred.

Under *Stimulus Process*, I began by testing the addition of *A* and *B*.  I accomplished this by creating a nested for-loop.  Each for-loop went from 0 to 15.  This accounts for the 256 combinations of *A* and *B*.  Inside the for-loop, I made an *assert* statement with a *severity* of *ERROR*.  If **Result = A + B** was asserted to be *TRUE*, then nothing would happen; the console would simply state that the program was successful.  However, if the assertion was *FALSE*, the console would report that there actually was an error, then show which combination of *A* and *B* caused the error.  This roundabout way of reporting the success/failure of the program does meet the requirements in the lab handout, however, next time, I plan on properly utilizing *if statements*.  After every iteration, the inner loop incremented *B* by "0001", and the outer loop incremeted *A* by "0001".  

The same process of using nested *for-loop*s was done for testing the subtraction functionality as well.  Again, there were 256 combinations to account for.  This time, however, the only difference was that the assertion was for **Result = A - B**.

If there was an error, I made it so that the console would print out the input values and the corresponding output values.

Below is the first half of the testbench code (testing addition).
```
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
```

Running the simulation, I found that the design was indeed successful.  Just to be sure that the errors are accounted for, I replaced the assert statement with: 
```
assert (Result = Ain + Bin + 1) 
```
As expected, the console returned 256 errors due to the additional '1'.  Both the success and failure of the design was confirmed.  

Shown below are the waveforms and snippets of the outputs from the console (both success and failure):

#### Simulation Wave Form
![alt text](https://raw2.github.com/sabinpark/ECE281_Lab2/master/four_bit_adder_tb_waveform.PNG "Test Bench Waveform")

#### Simluation Success and Failure (CONSOLE)
![alt text](https://raw2.github.com/sabinpark/ECE281_Lab2/master/testbench_success.PNG "Success")
![alt text](https://raw2.github.com/sabinpark/ECE281_Lab2/master/testbench_fail.PNG "Fail")

### Errors/Debugging Round 2
I had a problem with displaying all 512 combinations of the four-bit adder within the test bench.  I realized that the simulation would cut off after 1 microsecond.  As a result, I had to make the waiting time much smaller between each iteration of the *for-loop*s.  I ended up making the wait time between each iteration 1 nanosecond.  This was enough to display all 512 combinations.  As you may notice from the waveform image, the signals are very condensed together.  Proper viewing would require you to zoom in, but luckily, the *assert* statement comes in handy and displays any errors on the console.

# Conclusion
In the end, I created a four-bit adder with adding and subtracting capabilities (determined by a push button).  The four-bit adder also lets the user know if there is an overflow.  The design was tested and confirmed to work as intended.
