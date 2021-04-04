`include "A8Q2_state_defs.h"
`include "A8Q2_opcode_defs.h"
`define PROP_DELAY #2

module data_memory(clk, state, opcode, data_addr, result_lw);

   input clk;
   input [2:0] state;
	input [7:0] data_addr;
   input [5:0] opcode;

   output reg [7:0] result_lw;
	
   reg [7:0] data_mem [0:2];
   reg [3:0] i;
	
   initial begin
      // a,b,c
       data_mem[0] = -20;
       data_mem[1] = 10;
       data_mem[2] = 2;
       
      $display("Data Memory Content");
      $display("------------------");
      $display("a = %d",$signed(data_mem[0])); 
      $display("b = %d",$signed(data_mem[1])); 
      $display("c = %d",$signed(data_mem[2])); 
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
