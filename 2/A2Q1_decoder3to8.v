module decoder3to8 (in, out);

	input [2:0] in;
	output reg [7:0] out;    

    always @( in )
    begin
        out = 8'd0;
        case (in)
            3'b000: out[0] = 1'b1;
            3'b001: out[1] = 1'b1;
            3'b010: out[2] = 1'b1;
            3'b011: out[3] = 1'b1;
            3'b100: out[4] = 1'b1;
            3'b101: out[5] = 1'b1;
            3'b110: out[6] = 1'b1;
            3'b111: out[7] = 1'b1; 
        endcase
    end
    
    // output reg [7:0] out;    // if 2nd is to be used
    // assign out[0] = ~in[2] & ~in[1] & ~in[0];
    // assign out[1] = ~in[2] & ~in[1] & in[0];
    // assign out[2] = ~in[2] & in[1] & ~in[0];
    // assign out[3] = ~in[2] & in[1] & in[0];
    // assign out[4] = in[2] & ~in[1] & ~in[0];
    // assign out[5] = in[2] & ~in[1] & in[0];
    // assign out[6] = in[2] & in[1] & ~in[0];
    // assign out[7] = in[2] & in[1] & in[0];

endmodule
