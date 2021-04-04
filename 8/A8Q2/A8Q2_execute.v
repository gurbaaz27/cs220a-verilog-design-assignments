`include "A8Q2_state_defs.h"
`include "A8Q2_opcode_defs.h"
`include "A8Q2_func_defs.h"

`define PROP_DELAY #2

module execute(clk, state, opcode, rsv, rtv, imm, func, jump_target, program_counter, data_addr, result, instruction_invalid, instruction);
   
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
   output reg [31:0] instruction;
	
   reg [31:0] ins_mem [0:10];
	
   initial begin
      instruction_invalid = 1;
      program_counter = 0;
      instruction = 0;

      ins_mem[0] = 32'b010111_00000_00001_0000_0000_0000_0000;    // lw    $1, 0($0)     // opcode: 0x23
      ins_mem[1] = 32'b010111_00000_00010_0000_0000_0000_0001;    // lw    $2, 1($0)
      ins_mem[2] = 32'b010111_00000_00011_0000_0000_0000_0010;    // lw    $3, 2($0)
      ins_mem[3] = 32'b001001_00000_00100_0000_0000_0000_0000;    // addiu $4, $0, 0     // opcode: 0x9
      ins_mem[4] = 32'b001001_00001_00101_0000_0000_0000_0000;    // addiu $5, $1, 0
      ins_mem[5] = 32'b000000_00101_00010_00110_00000_101010;     // slt   $6, $5, $2    // opcode: 0x0, func: 0x2a
      ins_mem[6] = 32'b000100_00110_00000_0000_0000_0000_0101;    // beq   $6, $0, exit  // opcode: 0x4, encode exit as 5
      ins_mem[7] = 32'b000000_00100_00101_00100_00000_100001;     // addu  $4, $4, $5    // opcode: 0x0, func: 0x21
      ins_mem[8] = 32'b000000_00101_00011_00101_00000_100001;     // addu  $5, $5, $3
      ins_mem[9] = 32'b000000_00101_00010_00110_00000_101010;     // slt   $6, $5, $2
      ins_mem[10] = 32'b000101_00110_00000_1111_1111_1111_1101;   // bne   $6, $0, loop  // opcode: 0x5, encode loop as -3
   end

   always @ (posedge clk) begin
      if (state == `STATE_IF) begin
         instruction <= `PROP_DELAY ins_mem[program_counter];
	      program_counter <= `PROP_DELAY program_counter + 1;
      end
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
            if(rsv == rtv) begin
               program_counter <= `PROP_DELAY program_counter + imm[7:0] - 1;
            end
            instruction_invalid <= `PROP_DELAY 0;
	      end
         else if (opcode == `OP_BNE) begin
            if(rsv != rtv) begin
               program_counter <= `PROP_DELAY program_counter + imm[7:0] - 1;
            end
            instruction_invalid <= `PROP_DELAY 0;
	      end
         else if (opcode == `OP_JAL) begin
            result <= program_counter ;
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
