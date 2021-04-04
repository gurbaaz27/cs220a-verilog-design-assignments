`include "A8Q1_state_defs.h"
`define PROP_DELAY #2

module data_memory(clk, state, data_addr, result);

   input clk;
   input [2:0] state;
	input [7:0] data_addr;

   output reg [7:0] result;
	
   reg [7:0] data_mem [0:10];
	
   initial begin
    // array[10]
       data_mem[0] = 1;
       data_mem[1] = 2;
       data_mem[2] = 3;
       data_mem[3] = 4;
       data_mem[4] = 5;
       data_mem[5] = 6;
       data_mem[6] = 7;
       data_mem[7] = 8;
       data_mem[8] = 9;
       data_mem[9] = 10;
    // n
       data_mem[10] = 8;
   end
	
   always @ (posedge clk) begin
      if (state == `STATE_DM) begin         
        result <= `PROP_DELAY data_mem[data_addr];
      end
   end

endmodule
