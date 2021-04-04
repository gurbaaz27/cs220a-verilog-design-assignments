`include "A8Q1_state_defs.h"
`include "A8Q1_opcode_defs.h"
`define PROP_DELAY #2

module data_memory(clk, state, opcode, data_addr, result_lw);

   input clk;
   input [2:0] state;
	input [7:0] data_addr;
   input [5:0] opcode;

   output reg [7:0] result_lw;
	
   reg [7:0] data_mem [0:10];
   reg [3:0] i;
	
   initial begin
      // array[10]
       data_mem[0] = 1;
       data_mem[1] = 2;
       data_mem[2] = 3;
       data_mem[3] = -20;
       data_mem[4] = 4;
       data_mem[5] = 5;
       data_mem[6] = 6;
       data_mem[7] = -10;
       data_mem[8] = 100;
       data_mem[9] = 1;
      // n
       data_mem[10] = 8;
       
      $display("Data Memory Content");
      $display("------------------");
      for (i = 0; i < 10; i = i + 1) begin
         $display("array[%g] = %d",i,$signed(data_mem[i])); 
      end 
      $display("n = %d",$signed(data_mem[10])); 
      $display("------------------");
       
   end
	
   always @ (posedge clk) begin
      if (state == `STATE_DM) begin   
         if (opcode == `OP_LW) begin
	         result_lw <= `PROP_DELAY data_mem[data_addr];
	      end        
      end
   end

endmodule
