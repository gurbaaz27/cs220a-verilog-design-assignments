`include "A8Q1_state_defs.h"
`include "A8Q1_opcode_defs.h"
`include "A8Q1_func_defs.h"

`define PROP_DELAY #2

module execute(clk, state, opcode, rsv, rtv, imm, func, jump_target, program_counter, data_addr, result, instruction_invalid);

   input clk;
   input [2:0] state;
   input [5:0] opcode;
   input [7:0] rsv;
   input [7:0] rtv;
   input [15:0] imm;
   input [5:0] func;
   input [25:0] jump_target;
	
   output reg [7:0] program_counter;
   output reg [7:0] data_addr;
   output reg [7:0] result;
   output reg instruction_invalid;
	
   initial begin
      instruction_invalid = 1;
   end
	
   always @ (posedge clk) begin
      if (state == `STATE_EX) begin
         if ((opcode == `OP_RFORM) && (func == `FUNC_ADDU)) begin
            result <= `PROP_DELAY rsv + rtv;
            instruction_invalid <= `PROP_DELAY 0;
	      end
	      else if ((opcode == `OP_RFORM) && (func == `FUNC_SLT)) begin
	         result <= `PROP_DELAY $signed(rsv) < $signed(rtv);
            instruction_invalid <= `PROP_DELAY 0;
	      end
         else if ((opcode == `OP_RFORM) && (func == `FUNC_JR)) begin
	         program_counter <= `PROP_DELAY rsv;
            instruction_invalid <= `PROP_DELAY 0;
	      end
         else if (opcode == `OP_BEQ) begin
	         program_counter <= `PROP_DELAY (rsv == rtv) ? program_counter + imm[7:0] : program_counter;
            instruction_invalid <= `PROP_DELAY 0;
	      end
         else if (opcode == `OP_BNE) begin
	         program_counter <= `PROP_DELAY (rsv != rtv) ? program_counter + imm[7:0] : program_counter;
            instruction_invalid <= `PROP_DELAY 0;
	      end
         else if (opcode == `OP_JAL) begin
            result <= `PROP_DELAY program_counter + 1;
	         program_counter <= `PROP_DELAY imm[7:0];
            instruction_invalid <= `PROP_DELAY 0;
	      end
         else if (opcode == `OP_LW) begin
	         data_addr <= `PROP_DELAY rsv + imm[15:0];
            instruction_invalid <= `PROP_DELAY 0;
	      end
	      else if (opcode == `OP_ADDIU) begin
	         result <= `PROP_DELAY rsv + imm[15:0];
	         instruction_invalid <= `PROP_DELAY 0;
	      end
	      else begin
	         instruction_invalid <= `PROP_DELAY 1;
	      end
      end
   end

endmodule
