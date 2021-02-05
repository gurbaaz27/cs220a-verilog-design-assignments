`define TICK #1
module top;

    reg clk;
    wire out;
    
    blink M(clk, out);
    always @( out )begin
        $display("<%d > %d",$time ,out);
     end
    initial begin 
        #1000
        $finish;
    end

    initial begin
        forever begin
        clk = 0;
        #5
        clk = 1;
        #5
        clk = 0;
        end
    end


endmodule