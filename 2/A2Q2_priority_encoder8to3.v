module priority_encoder8to3 (in, out);

	input [7:0] in;

  output reg [2:0] out;  

	always @( in )
        begin
            casex (in)
              8'b10000000: out = 3'b111;
              8'bx1000000: out = 3'b110;
              8'bxx100000: out = 3'b101;
              8'bxxx10000: out = 3'b100;
              8'bxxxx1000: out = 3'b011;
              8'bxxxxx100: out = 3'b010;
              8'bxxxxxx10: out = 3'b001;
              8'bxxxxxxx1: out = 3'b000;
            endcase
        end

  // Method II:
  // output reg [2:0] out;  
  // always @(*)
  //       begin     
  //           if (in[0]) out <= 3'b000;  
  //           else if (in[1]) out <= 3'b001;  
  //           else if (in[2]) out <= 3'b010;  
  //           else if (in[3]) out <= 3'b011;  
  //           else if (in[4]) out <= 3'b100;  
  //           else if (in[5]) out <= 3'b101;  
  //           else if (in[6]) out <= 3'b110;  
  //           else if (in[7]) out <= 3'b111;  
  //           else out <= 3'bxxx;     
  //       end

  // Method III:
	// output wire [2:0] out;

  // assign out = (in[0] == 1'b1) ? 3'b000:
  //              (in[1] == 1'b1) ? 3'b001:
  //              (in[2] == 1'b1) ? 3'b010:
  //              (in[3] == 1'b1) ? 3'b011:
  //              (in[4] == 1'b1) ? 3'b100:
  //              (in[5] == 1'b1) ? 3'b101:
  //              (in[6] == 1'b1) ? 3'b110:
  //              (in[7] == 1'b1) ? 3'b111: 3'bxxx;
               
endmodule