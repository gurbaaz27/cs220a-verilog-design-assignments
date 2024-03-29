### [40 points] 1. Model a small DRAM bank having 16 rows each 32 bits wide using the Verilog 2D array. Initialize the 16 rows as follows: r[0] = 0, r[1] = 1, ..., r[15] = 15. Write a module to read a row from the bank. The input to the module is the clock, a row number, and an input_valid bit. On a positive edge of a clock the module does its work as follows. If the input_valid is 1, it takes in the input row number and starts processing it. If the input row number does not match with the open row number, the contents of the requested row are output two cycles later. If there is no open row, the contents of the requested row appear in the next cycle. If the current input row matches the open row, the output appears in the same cycle. Initially, no row is open. Another output of the read module is an output_valid bit. Whenever the module produces a new output, it sets this bit to 1 for the environment to know that the output corresponding to the last input is available. When the module takes in a new input, it resets the output_valid to 0 if it cannot produce an output in the same cycle. Write a top module to test your read module. The top module generates a clock with period equal to ten time units and 50% duty cycle. Give a new row number two time units before every third rising clock edge. For example, if the rising clock edges come at times 5, 15, 25, etc., the new inputs should be given at times 3, 33, 63, etc.. Remember to set the input_valid input to 1 when you send a new row number; otherwise the input_valid input should be set to 0 by the top module two time units before a rising clock edge. Display the row number and the corresponding contents whenever a new output is produced (indicated by output_valid equal to 1). Simulate for 30 clock cycles.

### [60 points] 2. Write a module to implement a finite state machine that checks if the input sequence is alternating. The module takes one bit input and the clock signal. It outputs 0 if the input sequence seen so far is not alternating; otherwise it outputs 1. Write a top module to test your FSM. The top module generates a clock with period equal to ten time units and 50% duty cycle. Give a new input bit two time units before every rising clock edge. Display the output along with the time. Simulate for ten clock cycles.

----------------
## Submission:
Submit your verilog files (two files for each question) named clearly. For example, you could name the
files as follows: 
* A3Q1_read.v, A3Q1_read_top.v
* A3Q2_fsm.v, A3Q2_fsm_top.v. 

Email the files as attachment to cs220spring2021submit@gmail.com. The subject line of the email MUST be the following (replace N by your group number):
Assignment#3 submission for Group#N

---------------
## Solution Usage
```bash
╰─ git clone <repo>
╰─ cd <repo>/3
```
1.
```bash
╰─ iverilog -o q1 A3Q1_read.v A3Q1_read_top.v
╰─ vvp q1 
```
2.
```bash
╰─ iverilog -o q2 A3Q2_fsm.v A3Q2_fsm_top.v
╰─ vvp q2 
```
---------------
#### Feb 6, 2020 0:00hrs - Feb 12, 2020 23:59hrs