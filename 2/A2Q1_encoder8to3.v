module encoder8to3 (in, out);

	input [7:0] in;
	output reg [2:0] out;

	always @( in )
        begin
            case (in)
              8'b10000000: out = 3'b111;
              8'b01000000: out = 3'b110;
              8'b00100000: out = 3'b101;
              8'b00010000: out = 3'b100;
              8'b00001000: out = 3'b011;
              8'b00000100: out = 3'b010;
              8'b00000010: out = 3'b001;
              8'b00000001: out = 3'b000;
            endcase
        end

  // Method II:
  // output wire [2:0] out;

  // assign out[0] =  in[7] | in[5] |  in[3] |  in[1] ;
  // assign out[1] =  in[7] | in[6] |  in[3] |  in[2] ;
  // assign out[2] =  in[7] | in[6] |  in[5] |  in[4] ;

endmodule
