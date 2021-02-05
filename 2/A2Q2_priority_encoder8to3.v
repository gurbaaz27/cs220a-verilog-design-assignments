module priority_encoder8to3 (in, out);

	input [7:0] in;
  // output reg [2:0] out;    // 1st method is not working as of now; output only xxx appearing

	// always @( in )
  //       begin
  //           case (in)
  //             8'b10000000: out = 3'b111;
  //             8'bx1000000: out = 3'b110;
  //             8'bxx100000: out = 3'b101;
  //             8'bxxx10000: out = 3'b100;
  //             8'bxxxx1000: out = 3'b011;
  //             8'bxxxxx100: out = 3'b010;
  //             8'bxxxxxx10: out = 3'b001;
  //             8'bxxxxxxx1: out = 3'b000;
  //           endcase
  //       end

	output wire [2:0] out;     // if 2nd is to be used

  assign out = (in[0] == 1'b1) ? 3'b000:
               (in[1] == 1'b1) ? 3'b001:
               (in[2] == 1'b1) ? 3'b010:
               (in[3] == 1'b1) ? 3'b011:
               (in[4] == 1'b1) ? 3'b100:
               (in[5] == 1'b1) ? 3'b101:
               (in[6] == 1'b1) ? 3'b110:
               (in[7] == 1'b1) ? 3'b111: 3'bxxx;
               
endmodule