module top;

    reg clk;
    reg [31:0] multiplicand;
    reg [31:0] multiplier;
    reg [31:0] product;
    reg [4:0] total_add_ops;
    reg [4:0] total_sub_ops;
    reg done;
    reg abit;

    booth BOOTH (clk, multiplicand, multiplier, product, total_add_ops, total_sub_ops, done, abit);

    always @ ( negedge clk ) begin
        if (done == 1) begin
            $display("time=%g: multiplicand = %d, multiplier = %d, product = %d, +: %d, -: %d",$time,multiplicand,multiplier,product,total_add_ops,total_sub_ops);     
        end
        done = 0;
    end

    initial begin
        product = 0;
        total_add_ops = 0;
        total_sub_ops = 0;
        done = 0;
        #110
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

    initial begin
         multiplicand = 0; multiplier = 3;
         #10         
         multiplicand = 0; multiplier = 3;
         #10
         multiplicand = 0; multiplier = 2;
         #10
         multiplicand = 2; multiplier = 2;
         #10
         multiplicand = 0; multiplier = 1;
         #10
         multiplicand = 1; multiplier = 2;
         #10         
         multiplicand = 3; multiplier = 1;
         #10
         multiplicand = 3; multiplier = 2;
         #10
         multiplicand = 1; multiplier = 2;
         #10         
         multiplicand = 0; multiplier = 1;         
    end

endmodule
