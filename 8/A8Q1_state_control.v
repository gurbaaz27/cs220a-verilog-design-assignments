`include "A8Q1_state_defs.h"

`define MAX_PC 14
`define PROP_DELAY #2

module state_control(clk, program_counter, state);

   input clk;
   input [7:0] program_counter;
   output reg [2:0] state;
	
   initial begin
      state = `STATE_IF;
   end
	
   always @ (posedge clk) begin
      if ((state == `STATE_WB) && (program_counter < `MAX_PC)) begin
         state <= `PROP_DELAY `STATE_IF;
      end
      else if (state != `STATE_OUTPUT) begin
         state <= `PROP_DELAY state + 1;
      end
   end

endmodule