module compute_coordinates (clk, dir, steps, x, y, fx, fy);

    input clk;
    input [1:0] dir;
    input [1:0] steps;
    input [4:0] x;
    input [4:0] y;

    output wire [4:0] fx;
    output wire [4:0] fy;

    reg [1:0] addx;
    reg [1:0] addy;
    reg dirx;
    reg diry;

    five_bit_adder FX (x, {3'b0,addx}, dirx, fx);
    five_bit_adder FY (y, {3'b0,addy}, diry, fy);

    always @(posedge clk)
    begin
        case(dir)
            2'b00 : begin
                dirx <= 0;
                diry <= 0;
                addx <= steps;
                addy <= 0; 
            end
            2'b01 : begin
                dirx <= 1;
                diry <= 0;
                addx <= steps;
                addy <= 0;
            end
            2'b10 : begin
                dirx <= 0;
                diry <= 0;
                addx <= 0;
                addy <= steps; 
            end
            2'b11 : begin
                dirx <= 0;
                diry <= 1;
                addx <= 0;
                addy <= steps; 
            end
        endcase
   end

endmodule
