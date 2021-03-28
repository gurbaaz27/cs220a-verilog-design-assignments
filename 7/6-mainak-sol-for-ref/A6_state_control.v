// Authored by Mainak Chaudhuri

`include "A6_state_defs.h"
`include "A6_latency.h"

`define PROP_DELAY #2

module state_control(clk, command, done, current_state);

   input clk;
   input [2:0] command;

   output done;
   reg done = 0;

   output [1:0] current_state;	
   reg [1:0] current_state;

   reg [4:0] delay_count;
	
   initial begin
      current_state = `STATE_INPUT;
   end
	
   always @ (posedge clk) begin
      if (current_state == `STATE_INPUT) begin
         current_state <= `PROP_DELAY `STATE_RF_RW;
	 delay_count <= `PROP_DELAY 1;
         done <= `PROP_DELAY 0;
      end
      else if ((current_state == `STATE_RF_RW) && (delay_count != `LATENCY_RF_READ)) begin
         delay_count <= `PROP_DELAY delay_count + 1;
      end
      else if ((current_state == `STATE_RF_RW) && (delay_count == `LATENCY_RF_READ) &&
	       ((command == 3'b000) || (command == 3'b001) || (command == 3'b010) ||
		(command == 3'b011) || (command == 3'b100))) begin
         // Assumes read/write latency to be same as a simplification
         // Otherwise the condition above will be a bit more complex
         current_state <= `PROP_DELAY `STATE_INPUT;
         done <= `PROP_DELAY 1;
      end
      else if ((current_state == `STATE_RF_RW) && (delay_count == `LATENCY_RF_READ) &&
	       ((command == 3'b101) || (command == 3'b110) || (command == 3'b111))) begin
         current_state <= `PROP_DELAY `STATE_COMPUTE;
	 delay_count <= `PROP_DELAY 1;
      end
      else if ((current_state == `STATE_COMPUTE) && (delay_count != `LATENCY_COMPUTE)) begin
         delay_count <= `PROP_DELAY delay_count + 1;
      end
      else if ((current_state == `STATE_COMPUTE) && (delay_count == `LATENCY_COMPUTE)) begin
         current_state <= `PROP_DELAY `STATE_RF_W;
	 delay_count <= `PROP_DELAY 1;
      end
      else if ((current_state == `STATE_RF_W) && (delay_count != `LATENCY_RF_WRITE)) begin
         delay_count <= `PROP_DELAY delay_count + 1;
      end
      else if ((current_state == `STATE_RF_W) && (delay_count == `LATENCY_RF_WRITE)) begin
         current_state <= `STATE_INPUT;
         done <= `PROP_DELAY 1;
      end
   end

endmodule
