module top;

    reg clk;
    reg signed [31:0] multiplicand;
    reg signed [31:0] multiplier;
    wire signed [63:0] product;
    wire [4:0] total_add_ops;
    wire [4:0] total_sub_ops;
    wire done;
    reg new_bit;
    reg [3:0] counter;

    reg signed [31:0] multiplicand_mem [0:9];
    reg signed [31:0] multiplier_mem [0:9];

    booth BOOTH (clk, multiplicand, multiplier, new_bit, product, total_add_ops, total_sub_ops, done);

    always @ ( negedge clk ) begin
        if (done == 1) begin
            $display("time=%g: multiplicand = %d, multiplier = %d, product = %d \t +: %d, -: %d",$time,multiplicand,multiplier,product,total_add_ops,total_sub_ops);     
            counter = counter + 1;
            new_bit <= 1;
            if(counter < 10) begin
                multiplicand = multiplicand_mem[counter]; multiplier = multiplier_mem[counter];
            end else begin
                $finish;
            end
        end
    end

    always @(negedge clk)begin
        new_bit <= 0;
    end

    initial begin
        counter = 0;
        new_bit <= 1;

        multiplicand_mem[0] = 1; multiplier_mem[0] = 3;
        multiplicand_mem[1] = 55; multiplier_mem[1] = 4;
        multiplicand_mem[2] = 2; multiplier_mem[2] = 42;
        multiplicand_mem[3] = -10; multiplier_mem[3] = 10;
        multiplicand_mem[4] = 5; multiplier_mem[4] = 0;
        multiplicand_mem[5] = 0; multiplier_mem[5] = 21;
        multiplicand_mem[6] = 30; multiplier_mem[6] = 3;
        multiplicand_mem[7] = 100; multiplier_mem[7] = 500;
        multiplicand_mem[8] = 17; multiplier_mem[8] = 4;
        multiplicand_mem[9] = -5; multiplier_mem[9] = -1;     

        multiplicand = multiplicand_mem[counter]; multiplier = multiplier_mem[counter]; 
    end

    initial begin
        $display("CS220: Assignment#11 Group#9 Q1\n-------------------------------");
        forever begin
            clk = 0;
            #5
            clk = 1;
            #5
            clk = 0;
        end
    end

endmodule
