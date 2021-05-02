module booth (clk, multiplicand, multiplier, new_bit, product, total_add_ops, total_sub_ops, done);
    
    input clk;
    input signed [31:0] multiplicand;
    input signed [31:0] multiplier;
    input new_bit;

    output reg signed [63:0] product;
    output reg [4:0] total_add_ops;
    output reg [4:0] total_sub_ops;
    output reg done;

    reg [4:0] i;
    reg signed [31:0] early_checker;
    reg prev_bit;
    reg curr_bit;

    initial begin
        product <= 0;
        done <= 0;
        total_add_ops <= 0;
        total_sub_ops <= 0;
        prev_bit <= 0;
        i <= 0;
    end
    
    always @(posedge new_bit) begin
            product <= 0;
            done <= 0;
            total_add_ops <= 0;
            total_sub_ops <= 0;
            i <= 0;    
            prev_bit <= 0;
    end    

    always @(posedge clk) begin
        curr_bit <= multiplier[i];
        #1

        if (curr_bit != prev_bit) begin
            if (curr_bit == 1) begin
                product <= product - (multiplicand << i);
                total_sub_ops <= total_sub_ops + 1;
            end
            else begin
                product <= product + (multiplicand << i);
                total_add_ops <= total_add_ops + 1;
            end
        end

        early_checker <= multiplier >>> (i+1);
        #1
        if (curr_bit == 0) begin
            if (early_checker == 0) begin
                done <= 1;
            end
        end
        else begin
            if (early_checker == -1) begin
                done <= 1;
            end
        end 

        if (i == 31) begin
            done <= 1;
        end

        prev_bit <= curr_bit;
        i <= i + 1;
    end

endmodule