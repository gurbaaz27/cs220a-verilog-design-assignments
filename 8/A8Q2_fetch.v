`include "A8Q2_state_defs.h"
`define PROP_DELAY #2

module fetch(clk, state, program_counter, instruction);

   input clk;
   input [2:0] state;
	
   output reg [7:0] program_counter;
   output reg [31:0] instruction;
	
   reg [31:0] ins_mem [0:10];
	
   initial begin
      ins_mem[0] = 32'b010111_00000_00001_0000_0000_0000_0000;    // lw    $1, 0($0)     // opcode: 0x23
      ins_mem[1] = 32'b010111_00000_00010_0000_0000_0000_0001;    // lw    $2, 1($0)
      ins_mem[2] = 32'b010111_00000_00011_0000_0000_0000_0010;    // lw    $3, 2($0)
      ins_mem[3] = 32'b001001_00000_00100_0000_0000_0000_1010;    // addiu $4, $0, 0     // opcode: 0x9
      ins_mem[4] = 32'b001001_00001_00101_0000_0000_0000_0000;    // addiu $5, $1, 0
      ins_mem[5] = 32'b000000_00101_00010_00110_00000_101010;     // slt   $6, $5, $2    // opcode: 0x0, func: 0x2a
      ins_mem[6] = 32'b000100_00110_00000_0000_0000_0000_0101;    // beq   $6, $0, exit  // opcode: 0x4, encode exit as 5
      ins_mem[7] = 32'b000000_00100_00100_00101_00000_100001;     // addu  $4, $4, $5    // opcode: 0x0, func: 0x21
      ins_mem[8] = 32'b000000_00101_00101_00011_00000_100001;     // addu  $5, $5, $3
      ins_mem[9] = 32'b000000_00101_00001_00110_00000_101010;     // slt   $6, $5, $2
      ins_mem[10] = 32'b000101_00110_00000_1111_1111_1111_1101;   // bne   $6, $0, loop  // opcode: 0x5, encode loop as -3
   end
	
   always @ (posedge clk) begin
      if (state == `STATE_IF) begin
         instruction <= `PROP_DELAY ins_mem[program_counter];
	 program_counter <= `PROP_DELAY program_counter + 1;
      end
   end

endmodule
