module blink(clk, out);

    input clk;
    reg [14:0] count;
    output reg out;

    initial count = 15'b0;
    initial out = 1'b0;

    always @(posedge clk) begin 
        count <=  count + 1'b1;

        if(count == 25000) begin
            out <=   ~out;
            count <=   15'b1;
        end
    end

endmodule