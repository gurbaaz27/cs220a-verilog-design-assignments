`include "A8Q1_state_defs.h"
`include "A8Q1_opcode_defs.h"

`define PROP_DELAY #2

module decode(clk, state, instruction, opcode, rs, rt, rd, imm, func, jump_target);

   input clk;
   input [2:0] state;
   input [31:0] instruction;
	
   output reg [5:0] opcode;
   output reg [4:0] rs;
   output reg [4:0] rt;
   output reg [4:0] rd;
   output reg [15:0] imm;
   output reg [5:0] func;
   output reg [25:0] jump_target;
	
   always @ (posedge clk) begin
      if (state == `STATE_ID) begin
         opcode <= `PROP_DELAY instruction[31:26];
         rs <= `PROP_DELAY instruction[25:21];
         imm <= `PROP_DELAY instruction[15:0];
         func <= `PROP_DELAY instruction[5:0];
         jump_target <= `PROP_DELAY instruction[25:0];
         rd <= `PROP_DELAY instruction[15:11];
         if (instruction[31:26] == `OP_JAL) begin
            rt <= `PROP_DELAY 31; 
	      end
         else begin
            rt <= `PROP_DELAY instruction[20:16];
         end
      end
   end

endmodule
