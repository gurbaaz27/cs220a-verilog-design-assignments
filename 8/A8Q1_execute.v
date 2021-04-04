`include "A8Q1_state_defs.h"
`include "A8Q1_opcode_defs.h"
`include "A8Q1_func_defs.h"

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
	
   reg [31:0] ins_mem [0:13];
	
   initial begin
      instruction_invalid = 1;
      program_counter = 12;
      instruction = 0;

      ins_mem[0] = 32'b001001_00000_00010_0000_0000_0000_0000;    // addiu $2, $0, 0    // opcode: 0x9
      ins_mem[1] = 32'b001001_00000_00011_0000_0000_0000_0000;    // addiu $3, $0, 0
      ins_mem[2] = 32'b000000_00001_00011_00100_00000_101010;     // slt   $4, $3, $1   // opcode: 0x0, func: 0x2a
      ins_mem[3] = 32'b000100_00100_00000_0000_0000_0000_1000;    // beq   $4, $0, exit // opcode: 0x4, encode exit as 8
      ins_mem[4] = 32'b001001_00000_00101_0000_0000_0000_1010;    // addiu $5, $0, 10
      ins_mem[5] = 32'b000100_00011_00101_0000_0000_0000_0110;    // beq   $3, $5, exit // encode exit as 6
      ins_mem[6] = 32'b010111_00011_00110_0000_0000_0000_0000;    // lw    $6, 0($3)    // opcode: 0x23
      ins_mem[7] = 32'b000000_00010_00110_00010_00000_100001;     // addu  $2, $2, $6   // opcode: 0x0, func: 0x21
      ins_mem[8] = 32'b001001_00011_00011_0000_0000_0000_0001;    // addiu $3, $3, 1
      ins_mem[9] = 32'b000000_00001_00011_00100_00000_101010;     // slt   $4, $3, $1
      ins_mem[10] = 32'b000101_00100_00000_1111_1111_1111_1011;   // bne   $4, $0, loop // opcode: 0x5, encode loop as -5
      ins_mem[11] = 32'b000000_11111_00000_00000_00000_001000;    // jr    $31          // opcode: 0x0, func: 0x8, rs: 31  
      ins_mem[12] = 32'b010111_00000_00001_0000_0000_0000_1010;   // lw    $1, 10($0)
      ins_mem[13] = 32'b000011_00_0000_0000_0000_0000_0000_0000;  // jal   Sum          // opcode: 0x3, encode Sum as 0
   end

   always @ (posedge clk) begin
      if (state == `STATE_IF) begin
         $display("passing new instruction pc: %d", program_counter);
         instruction <= `PROP_DELAY ins_mem[program_counter];
	      program_counter <= `PROP_DELAY program_counter + 1;
      end
   end
	
   always @ (posedge clk) begin
       $display("opcode %d, function->%d",opcode,func);
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
            $display("RSV: %d", rsv);
	         program_counter <= `PROP_DELAY rsv;
            instruction_invalid <= `PROP_DELAY 0;
	      end
         else if (opcode == `OP_BEQ) begin
            $display("program_counter: %d", program_counter);
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
           
          
             $display("program_counter:", result);
             $display("program_counter: %d", program_counter);
        
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
