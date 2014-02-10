ECE281_Lab2
===========

Sabin's Lab 2

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
![alt text](https://raw2.github.com/sabinpark/ECE281_Lab2/master/full_adder_kmaps_equations.PNG "K-Maps and Boolean Equations)

### Interface
Below is an image of the full adder interface drawn in two different ways.  Both show three inputs and two outputs as explained above.