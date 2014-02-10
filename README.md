ECE281_Lab2
===========
Sabin's Lab 2

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
## 4-Bit Adder
The first part of the actual lab portion was to create a 4-bit adder by chaining four of the 1-bit full adders together.  I created a schematic of the 4-bit adder as shown below:
![alt text](https://raw2.github.com/sabinpark/ECE281_Lab2/master/4_bit_adder_addition_schematic.PNG "4_Bit Adder Addition Schematic")

For the adder, I set the C_IN of the LSB as 0.  The rest of the C_INs were set as the C_OUTs of the previous bit.  This schematic follows exactly what I did in the vhdl module.

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
