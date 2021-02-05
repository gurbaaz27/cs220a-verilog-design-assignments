module blink(clk , out);
input clk;
//output [14:0] count;
reg [14:0] count;
output out;
reg out;

initial count = 15'b0;
initial out = 1'b0;
always @(posedge clk)begin 
    count <= `TICK count + 1'b1;

    if(count == 20) begin
        out <=  `TICK ~out;
        count <=  `TICK 15'b1;
     end
end

endmodule