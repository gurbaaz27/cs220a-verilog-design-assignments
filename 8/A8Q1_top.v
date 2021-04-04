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
   wire [7:0] result_lw;
   wire instruction_invalid;
   wire [7:0] rsv;
   wire [7:0] rtv;
   wire done;
   wire [7:0] data_addr;
	
   state_control SC(clk, PC, state);
   // fetch IF(clk, state, PC, instruction);
   decode ID(clk, state, instruction, opcode, rs, rt, rd, imm, func, jump_target);
   register_file RF(clk, state, rs, rt, (opcode == `OP_RFORM) ? rd : ((opcode == `OP_BEQ) || (opcode == `OP_BNE ) ? 5'b0 : rt ), (opcode == `OP_LW) ? result_lw : result, instruction_invalid, rsv, rtv, done);
   execute EX(clk, state, opcode, rsv, rtv, imm, func, jump_target, PC, data_addr, result, instruction_invalid, instruction);
   data_memory DM(clk, state, opcode, data_addr, result_lw);
	
   initial begin
      forever begin
         clk = 0;
         #5
         clk = 1;
         #5
         clk = 0;
      end
   end
   always @(rs or rt or rd)begin
      $display("%d %d %d",rs,rt,rd);
   end
   always @ (posedge done) begin
      $display("Time: %d, output = %d", $time,$signed(rsv) );
      $finish;
   end

   

endmodule
