module booth (clk, multiplicand, multiplier, product, total_add_ops, total_sub_ops, done, abit);
    input clk;
    input [31:0] multiplicand;
    input [31:0] multiplier;
    input abit;

    output [31:0] product;
    output [4:0] total_add_ops;
    output [4:0] total_sub_ops;
    output done;

    reg [4:0] i;
    reg [4:0] temp;
    reg [1:0] diff;
    reg flag = 0;
    reg prev_bit;

    initial begin
        i = 5'b0;
        temp = 5'b0;
        prev_bit = 1'b0;
    end

    always @(posedge clk) begin

        if (i == 5'b11111) begin
            done = 1;
        end

        diff = {multiplier[i], prev_bit};

        case (diff)
            2'b01: begin
                product = product - (multiplicand << i);
                total_sub_ops = total_sub_ops + 1;
            end
            2'b10: begin
                product = product + (multiplicand << i);
                total_add_ops = total_add_ops + 1;
            end
            default: begin  end
        endcase

        prev_bit = multiplier[i];
        i = i + 1;
    end

endmodule