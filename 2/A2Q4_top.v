`define TICK #1
module top;

    reg clk;
    wire [3:0] Output;    

    rotate M(clk, Output);
    always @( Output )
        begin
        $display("time:%d: Output = %b",$time,Output);
        end

    initial
        begin 
        #1000
        $finish;
        end

    initial begin
        forever begin
            clk = 0;
            #5
            $display("\n");
            clk = 1;
            #5
            $display("\n");
            clk = 0;
        end
    end

endmodule