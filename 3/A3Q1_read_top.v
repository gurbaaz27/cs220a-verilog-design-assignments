`define TICK #2 
module top;

    reg clk;
    reg input_valid;
    reg [3:0] row_num;
    wire output_valid;
    wire [31:0] out;

    reg [5:0]count_cycle;
   
    read READ(clk, row_num ,input_valid, output_valid,out);

    always @(output_valid)
    begin
        if(output_valid == 1'b1)begin
         $display("time=%d: row_num = %d, content = %d, count_cycle => %d",$time ,row_num , out, count_cycle);
        end
    end

    always @(posedge clk)
    begin
        count_cycle <= count_cycle+1;
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
        count_cycle=0;
        #3
        input_valid=1; row_num=0;
        #10
        input_valid=0;
        #20
        input_valid=1; row_num=0;
        #10
        input_valid=0;
        #20
        input_valid=1; row_num=0;
        #10
        input_valid=0;
        #20
        input_valid=1; row_num=1;
        #10
        input_valid=0;
        #20
        input_valid=1; row_num=1;
        #10
        input_valid=0;
        #20
        input_valid=1; row_num=2;
        #10
        input_valid=0;
        #20
        input_valid=1; row_num=3;
        #10
        input_valid=0;
        #20
        input_valid=1; row_num=7;
        #10
        input_valid=0;
        #20
        input_valid=1; row_num=8;
        #10
        input_valid=0;
        #20
        input_valid=1; row_num=8;
        #10
        input_valid=0;
    end 
endmodule
