`include "A8Q1_state_defs.h"
`include "A8Q1_opcode_defs.h"

module top;

   reg clk;
	
   wire [7:0] PC;
   wire [2:0] state;
   wire [31:0] instruction;
   wire [5:0] opcode;
   wire [4:0] rs;
   wire [4:0] rt;
   wire [4:0] rd;
   wire [15:0] imm;
   wire [5:0] func;
   wire [25:0] jump_target;
   wire [7:0] result;
   wire instruction_invalid;
   wire [7:0] rsv;
   wire [7:0] rtv;
   wire done;
   wire [7:0] data_addr;
	
   state_control SC(clk, PC, state);
   fetch IF(clk, state, PC, instruction);
   decode ID(clk, state, instruction, opcode, rs, rt, rd, imm, func, jump_target);
   register_file RF(clk, state, rs, rt, (opcode == `OP_RFORM) ? rd : rt, result, instruction_invalid, rsv, rtv, done);
   execute EX(clk, state, opcode, rsv, rtv, imm, func, jump_target, PC, data_addr, result, instruction_invalid);
   data_memory DM(clk, state, data_addr, result);
	
   initial begin
      forever begin
         clk = 0;
         #5
         clk = 1;
         #5
         clk = 0;
      end
   end

   always @ (posedge done) begin
      $display("Time: %d, output = %d", $time, rsv);
      $finish;
   end

endmodule
