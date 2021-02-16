module five_bit_adder (x, y, opcode, sum);

	input [4:0] x;
	input [4:0] y;
    input opcode;

	output wire [4:0] sum;
    wire carry_out;

	wire [3:0] intermediate_carry;

	one_bit_full_adder FA0 (x[0], y[0], opcode, opcode, sum[0], intermediate_carry[0]);
	one_bit_full_adder FA1 (x[1], y[1], intermediate_carry[0], opcode, sum[1], intermediate_carry[1]);
	one_bit_full_adder FA2 (x[2], y[2], intermediate_carry[1], opcode, sum[2], intermediate_carry[2]);
	one_bit_full_adder FA3 (x[3], y[3], intermediate_carry[2], opcode, sum[3], intermediate_carry[3]);
	one_bit_full_adder FA4 (x[4], y[4], intermediate_carry[3], opcode, sum[4], carry_out);

endmodule
