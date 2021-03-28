// Authored by Mainak Chaudhuri

`include "A6_state_defs.h"

module compute(clk, current_state, command, operand1, operand2, shift_amount, result);
	 
   input clk;
   input [1:0] current_state;
   input [2:0] command;
   input [15:0] operand1;
   input [15:0] operand2;
   input [3:0] shift_amount;
	
   output [15:0] result;
   reg [15:0] result;
	
   always @ (posedge clk) begin
      if (current_state == `STATE_COMPUTE) begin
         if (command == 3'b101) begin
	    result <= operand1 + operand2;
	 end
	 else if (command == 3'b110) begin
	    result <= operand1 - operand2;
	 end
	 else if (command == 3'b111) begin
	    result <= operand1 << shift_amount;
	 end
      end
   end

endmodule
