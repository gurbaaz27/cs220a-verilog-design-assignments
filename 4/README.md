### [40 points] 1. Design an eight-bit adder/subtracter to add/subtract two eight-bit two's complement numbers. Divide your design into three modules. One module implements a one-bit adder/subtracter with four inputs a, b, cin, and opcode and two outputs sum and carry. The input opcode is 0 if the operation is an addition and it is 1 if the operation is a subtraction. The second module implements the eight-bit adder/subtracter using the one-bit adder/subtracter module. This module takes three inputs namely, the two input numbers and the opcode. It produces three outputs namely, the sum, the carry out, and whether there is an overflow. Implement a top module to test your implementation. Keep one time unit gap between two consecutive test input sets.

### [60 points] 2. Imagine a 15x15 grid (length of each side is 15). The leftmost bottom corner is (0, 0). The leftmost top corner is (0, 15). The rightmost top corner is (15, 15). The rightmost bottom corner is (15, 0). A worm is sitting at (0, 0) to start with. In each move, the worm can take 0, 1, 2, or 3 steps along east, west, north, or south directions. If the move causes the worm to hit the boundary, it stops there. For example, at (0, 0) if it tries to move toward west or south it stays at (0 0); at (13 0) if it tries to move toward east three steps, it takes only two steps and stops at (15, 0). Two time units before each rising clock edge a new input is provided. The input comes in the form of a direction (two bits) and the number of steps (two bits). Write a module to compute the new coordinates of the worm based on the input using a five-bit adder/subtracter. The new coordinates are computed on each rising edge of the clock, which is also an input to the module. Write a top module to test your design. You can display the new coordinates along with your inputs just before sending a new input. Simulate for ten clock cycles. The clock should have a period of ten time units and 50% duty cycle.

----------------
## Submission:
Submit your verilog files named clearly. Prefix the file names for Q1 using A4Q1_ and those for Q2 using A4_Q2_. Email the files as attachment to cs220spring2021submit@gmail.com. The subject line of the email MUST be the following (replace N by your group number): Assignment#4 submission for Group#N

---------------
## Solution Usage
```bash
╰─ git clone <repo>
╰─ cd <repo>/4
```
1.
```bash
╰─ iverilog -o q1 A4Q1_one_bit_adder.v A4Q1_eight_bit_adder.v A4Q1_top.v
╰─ vvp q1 
```
2.
```bash
╰─ iverilog -o q2 A4Q2_one_bit_adder.v A4Q2_five_bit_adder.v A4Q2_compute_coordinates.v A4Q2_top.v
╰─ vvp q2 
```
---------------
#### Feb 13, 2020 0:00hrs - Feb 19, 2020 23:59hrs