// Authored by Mainak Chaudhuri

module processor (clk, read1Addr, read2Addr, writeAddr, writeValue, read1Valid, read2Valid, writeValid, shift_amount, command, read1Value, read2Value, regWriteValue, done);

   input clk;
   input [4:0] read1Addr;
   input [4:0] read2Addr;
   input [4:0] writeAddr;
   input [15:0] writeValue;
   input read1Valid;
   input read2Valid;
   input writeValid;
   input [3:0] shift_amount;
   input [2:0] command;

   output [15:0] read1Value;
   output [15:0] read2Value;
   output [15:0] regWriteValue;
   output done;

   wire [15:0] read1Value;
   wire [15:0] read2Value;
   wire [15:0] regWriteValue;
   wire done;

   wire [15:0] result;
   wire [1:0] current_state;
	
   // Processor = register file + execution units + state control (FSM)
   register_file RF(clk, current_state, read1Addr, read2Addr, writeAddr, regWriteValue, read1Valid, read2Valid, writeValid, read1Value, read2Value);
   compute EXECUTE(clk, current_state, command, read1Value, read2Value, shift_amount, result);
   state_control CONTROL(clk, command, done, current_state);

   assign regWriteValue = ((command == 3'b101) || (command == 3'b110) || (command == 3'b111)) ? result : writeValue;

endmodule
