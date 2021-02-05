`define TICK #1
module rotate(clk , out);

    input clk;
    reg [14:0] count;
    output reg [3:0] out;

    initial count = 15'b0;
    initial out = 4'b1000;
    always @(posedge clk)begin 
        count <= `TICK count + 1'b1;

        if(count == 20) begin
            out[0] <= `TICK out[3];
            out[3] <= `TICK out[2];
            out[2] <= `TICK out[1];
            out[1] <= `TICK out[0];
            count <=  `TICK 15'b1;
        end
    end

endmodule