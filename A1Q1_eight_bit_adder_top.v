module eight_bit_adder_top;

	reg [7:0] A;
	reg [7:0] B;
	reg Cin;

	wire [7:0] Sum;
	wire Carry;

	eight_bit_adder ADDER (A, B, Cin, Sum, Carry);

	always @ (A or B or Cin)


endmodule
