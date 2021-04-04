`include "A8Q1_state_defs.h"

`define OUTPUT_REG 2
`define PROP_DELAY #2

module register_file(clk, state, rs, rt, rd, result, instruction_invalid, rsv, rtv, done);

   input clk;
   input [2:0] state;
   input [4:0] rs;
   input [4:0] rt;
   input [4:0] rd;
   input [7:0] result;
   input instruction_invalid;
	
   output reg [7:0] rsv;
   output reg [7:0] rtv;
   output reg done;
	
   reg [7:0] regfile [0:31];
   reg [5:0] i;
	
   initial begin
      for (i = 0; i < 32; i = i + 1) begin
         regfile[i] = 0; 
      end 

      done = 0;
   end
	
   always @ (posedge clk) begin
     
      if (state == `STATE_RF) begin
         rsv <= `PROP_DELAY regfile[rs];
	      rtv <= `PROP_DELAY regfile[rt];
      end
      else if ((state == `STATE_WB) && (rd != 0) && (instruction_invalid == 0)) begin
         regfile[rd] <= `PROP_DELAY result;
      end
      else if (state == `STATE_OUTPUT) begin
         rsv <= `PROP_DELAY regfile[`OUTPUT_REG];
         done <= `PROP_DELAY 1;
      end
   end

endmodule
