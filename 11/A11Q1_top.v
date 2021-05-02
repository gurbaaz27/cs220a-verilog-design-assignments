module top;

    reg clk;
    reg signed [31:0] multiplicand;
    reg signed [31:0] multiplier;
    reg signed [31:0] product;
    wire [4:0] total_add_ops;
    wire [4:0] total_sub_ops;
    wire done;
    reg abit;
    reg [3:0] idx;

    booth BOOTH (clk, multiplicand, multiplier, new_bit, product, total_add_ops, total_sub_ops, done);

    always @ ( negedge clk ) begin
        if (done == 1) begin
            $display("time=%g: multiplicand = %d, multiplier = %d, product = %d, +: %d, -: %d",$time,multiplicand,multiplier,product,total_add_ops,total_sub_ops);     
        end
        done = 0;
    end

    initial begin
        idx = 0;
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
