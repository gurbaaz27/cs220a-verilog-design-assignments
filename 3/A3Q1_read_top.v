`define TICK #2 
module top;

   reg clk;
   reg input_valid;
   reg [3:0] row_num;
   wire output_valid;
   wire [31:0] out;
   
   read M(clk, row_num ,input_valid, output_valid,out);

    always @(output_valid)
    begin
        if(output_valid == 1'b1)begin
         $display("< %d >  %d %b ",$time ,out , output_valid);
        end
    end


   initial begin
       #1000
       $finish;
   end

    initial begin
        forever begin
        clk=0;
        #5
        clk=1;
        #5
        clk=0;
    end
    end 
    initial begin
        #3
        input_valid=1; row_num=0;
        #4
        input_valid=0;
        #26
        input_valid=1; row_num=0;
        #4
        input_valid=0;
        #26
        input_valid=1; row_num=0;
         #4
        input_valid=0;
        #26
        input_valid=1; row_num=1;
         #4
        input_valid=0;
        #26
        input_valid=1; row_num=1;
         #4
        input_valid=0;
        #26
        input_valid=1; row_num=2;
         #4
        input_valid=0;
        #26
        input_valid=1; row_num=3;
         #4
        input_valid=0;
    end 
endmodule
