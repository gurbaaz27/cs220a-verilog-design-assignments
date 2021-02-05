module top;

    reg clk;
    wire [3:0] Output;    

    rotate ROTATE (clk, Output);

    always @( Output )
        begin
        $display("time:%d: Output = %b",$time,Output);
        end

    initial
        begin 
        #3100000
        $finish;
        end

    initial begin
        forever begin
            clk = 1;
            #5
            clk = 0;
            #5
            clk = 1;
        end
    end

endmodule