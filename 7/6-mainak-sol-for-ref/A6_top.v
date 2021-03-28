// Authored by Mainak Chaudhuri

`define PROP_DELAY #2

module top;

   reg clk;
   reg [4:0] read1Addr;
   reg [4:0] read2Addr;
   reg [4:0] writeAddr;
   reg [15:0] writeValue;
   reg read1Valid;
   reg read2Valid;
   reg writeValid;
   reg [3:0] shift_amount;
   reg [2:0] command;

   wire [15:0] read1Value;
   wire [15:0] read2Value;
   wire [15:0] regWriteValue;
   wire done;

   reg [3:0] PC;

   processor PROCESSOR (clk, read1Addr, read2Addr, writeAddr, writeValue, read1Valid, read2Valid, writeValid, shift_amount, command, read1Value, read2Value, regWriteValue, done);

   initial begin
      forever begin
         clk = 0;
         #5
         clk = 1;
         #5
         clk = 0;
      end
   end

   initial begin
      // First instruction
      command <= `PROP_DELAY 3'b000;
      writeAddr <= `PROP_DELAY 1;
      writeValue <= `PROP_DELAY 17;
      read1Valid <= `PROP_DELAY 0;
      read2Valid <= `PROP_DELAY 0;
      writeValid <= `PROP_DELAY 1;
      PC <= `PROP_DELAY 1;  // Points to the next instruction
   end

   always @ (posedge done) begin
      case (command)
         3'b000: $display("Time: %3d, Command = %b", $time, command);
         3'b001: $display("Time: %3d, Command = %b, Read1Addr = %d, Read1Value = %b", $time, command, read1Addr, read1Value);
         3'b010: $display("Time: %3d, Command = %b, Read1Addr = %d, Read2Addr = %d, Read1Value = %b, Read2Value = %b", $time, command, read1Addr, read2Addr, read1Value, read2Value);
         3'b011: $display("Time: %3d, Command = %b, Read1Addr = %d, Read1Value = %b", $time, command, read1Addr, read1Value);
         3'b100: $display("Time: %3d, Command = %b, Read1Addr = %d, Read2Addr = %d, Read1Value = %b, Read2Value = %b", $time, command, read1Addr, read2Addr, read1Value, read2Value);
         3'b101: $display("Time: %3d, Command = %b, WriteAddr = %d, WriteValue = %b", $time, command, writeAddr, regWriteValue);
         3'b110: $display("Time: %3d, Command = %b, WriteAddr = %d, WriteValue = %b", $time, command, writeAddr, regWriteValue);
         3'b111: $display("Time: %3d, Command = %b, WriteAddr = %d, WriteValue = %b", $time, command, writeAddr, regWriteValue);
      endcase
      
      case (PC)
         1: begin
               command <= `PROP_DELAY 3'b011;
               read1Addr <= `PROP_DELAY 1;
               writeAddr <= `PROP_DELAY 2;
               writeValue <= `PROP_DELAY 16'b1111111111110111;
               read1Valid <= `PROP_DELAY 1;
               read2Valid <= `PROP_DELAY 0;
               writeValid <= `PROP_DELAY 1;
               PC <= `PROP_DELAY 2;
            end
         2: begin
               command <= `PROP_DELAY 3'b100;
               read1Addr <= `PROP_DELAY 1;
               read2Addr <= `PROP_DELAY 2;
               writeAddr <= `PROP_DELAY 3;
               writeValue <= `PROP_DELAY 65;
               read1Valid <= `PROP_DELAY 1;
               read2Valid <= `PROP_DELAY 1;
               writeValid <= `PROP_DELAY 1;
               PC <= `PROP_DELAY 3;
            end
         3: begin
               command <= `PROP_DELAY 3'b010;
               read1Addr <= `PROP_DELAY 2;
               read2Addr <= `PROP_DELAY 3;
               read1Valid <= `PROP_DELAY 1;
               read2Valid <= `PROP_DELAY 1;
               writeValid <= `PROP_DELAY 0;
               PC <= `PROP_DELAY 4;
            end
         4: begin
               command <= `PROP_DELAY 3'b111;
               read1Addr <= `PROP_DELAY 3;
               writeAddr <= `PROP_DELAY 5;
               read1Valid <= `PROP_DELAY 1;
               read2Valid <= `PROP_DELAY 0;
               writeValid <= `PROP_DELAY 1;
               shift_amount <= `PROP_DELAY 3;
               PC <= `PROP_DELAY 5;
            end
         5: begin
               command <= `PROP_DELAY 3'b101;
               read1Addr <= `PROP_DELAY 1;
               read2Addr <= `PROP_DELAY 2;
               writeAddr <= `PROP_DELAY 4;
               read1Valid <= `PROP_DELAY 1;
               read2Valid <= `PROP_DELAY 1;
               writeValid <= `PROP_DELAY 1;
               PC <= `PROP_DELAY 6;
            end
         6: begin
               command <= `PROP_DELAY 3'b111;
               read1Addr <= `PROP_DELAY 4;
               writeAddr <= `PROP_DELAY 4;
               read1Valid <= `PROP_DELAY 1;
               read2Valid <= `PROP_DELAY 0;
               writeValid <= `PROP_DELAY 1;
               shift_amount <= `PROP_DELAY 9;
               PC <= `PROP_DELAY 7;
            end
         7: begin
               command <= `PROP_DELAY 3'b110;
               read1Addr <= `PROP_DELAY 5;
               read2Addr <= `PROP_DELAY 4;
               writeAddr <= `PROP_DELAY 6;
               read1Valid <= `PROP_DELAY 1;
               read2Valid <= `PROP_DELAY 1;
               writeValid <= `PROP_DELAY 1;
               PC <= `PROP_DELAY 8;
            end
         8: begin
               command <= `PROP_DELAY 3'b001;
               read1Addr <= `PROP_DELAY 6;
               read1Valid <= `PROP_DELAY 1;
               read2Valid <= `PROP_DELAY 0;
               writeValid <= `PROP_DELAY 0;
               PC <= `PROP_DELAY 9;
            end
         9: $finish; 
      endcase
   end
   
endmodule
