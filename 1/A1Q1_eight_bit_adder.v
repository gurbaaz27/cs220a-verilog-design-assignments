module eight_bit_adder (x, y, carry_in, sum, carry_out);

	input [7:0] x;
	input [7:0] y;
	input carry_in;

	output [7:0] sum;
	wire [7:0] sum;
	output carry_out;
	wire carry_out;

	wire [6:0] intermediate_carry;

	one_bit_full_adder FA0 (x[0], y[0], carry_in, sum[0], intermediate_carry[0]);
	one_bit_full_adder FA1 ();

endmodule
