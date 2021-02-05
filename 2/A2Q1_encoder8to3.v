<<<<<<< HEAD
module encoder8to3( en_in , en_out);
    input [7:0] en_in;
    output wire [2:0] en_out;
    assign en_out[0] =  en_in[7] | en_in[5] |  en_in[3] |  en_in[1] ;
    assign en_out[1] =  en_in[7] | en_in[6] |  en_in[3] |  en_in[2] ;
    assign en_out[2] =  en_in[7] | en_in[6] |  en_in[5] |  en_in[4] ;
endmodule
=======
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

endmodule
>>>>>>> 8aeae52f047563b70e4e3ffd1016595ce30fa0b0
