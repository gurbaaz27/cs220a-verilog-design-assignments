## Submission:
Submit your verilog files named clearly. Prefix the file names for Q1 using A5Q1_ and those for Q2 using A5Q2_. Email the files as attachment to cs220spring2021submit@gmail.com. The subject line of the email MUST be the following (replace N by your group number): Assignment#5 submission for Group#N

---------------
## Solution Usage
```bash
╰─ git clone <repo>
╰─ cd <repo>/5
```
1.
```bash
╰─ iverilog -o q1 A5Q1_*.v
╰─ vvp q1 
```
2.
```bash
╰─ iverilog -o q2 A5Q2_*.v
╰─ vvp q2 
```
3. You can also use `make`.
```bash
╰─ make q1
╰─ make q2 
╰─ make clean
```
---------------
#### Feb 20, 2020 0:00hrs - Mar 12, 2020 23:59hrs