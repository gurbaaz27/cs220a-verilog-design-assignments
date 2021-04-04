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
	
   initial begin
    // array[10]
       data_mem[0] = 127;
       data_mem[1] = -127;
       data_mem[2] = 127;
       data_mem[3] = -127;
       data_mem[4] = 127;
       data_mem[5] = -127;
       data_mem[6] = 127;
       data_mem[7] = -127;
       data_mem[8] = 127;
       data_mem[9] = -128;
    // n
       data_mem[10] = 9;
   end
	
   always @ (posedge clk) begin
      if (state == `STATE_DM) begin   
         if (opcode == `OP_LW) begin
           // $display("yesss, %d",$time);
	         result_lw <= `PROP_DELAY data_mem[data_addr];
	      end        
      end
   end

endmodule
