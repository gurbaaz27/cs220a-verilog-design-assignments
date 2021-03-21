module full_adder (x, y, opcode, sum, carry_out);

	input signed [15:0] x;
	input signed[15:0] y;
	input opcode;
	output wire signed [15:0] sum;
	output wire carry_out;

	wire [14:0] intermediate_carry;

	one_bit_full_adder FA0 (x[0], y[0], opcode, opcode, sum[0], intermediate_carry[0]);
	one_bit_full_adder FA1 (x[1], y[1], intermediate_carry[0], opcode, sum[1], intermediate_carry[1]);
	one_bit_full_adder FA2 (x[2], y[2], intermediate_carry[1], opcode, sum[2], intermediate_carry[2]);
	one_bit_full_adder FA3 (x[3], y[3], intermediate_carry[2], opcode, sum[3], intermediate_carry[3]);
	one_bit_full_adder FA4 (x[4], y[4], intermediate_carry[3], opcode, sum[4], intermediate_carry[4]);
	one_bit_full_adder FA5 (x[5], y[5], intermediate_carry[4], opcode, sum[5], intermediate_carry[5]);
	one_bit_full_adder FA6 (x[6], y[6], intermediate_carry[5], opcode, sum[6], intermediate_carry[6]);
    one_bit_full_adder FA7 (x[7], y[7], intermediate_carry[6], opcode, sum[7], intermediate_carry[7]);
	one_bit_full_adder FA8 (x[8], y[8], intermediate_carry[7], opcode, sum[8], intermediate_carry[8]);
	one_bit_full_adder FA9 (x[9], y[9], intermediate_carry[8], opcode, sum[9], intermediate_carry[9]);
	one_bit_full_adder FAa (x[10], y[10], intermediate_carry[9], opcode, sum[10], intermediate_carry[10]);
	one_bit_full_adder FAb (x[11], y[11], intermediate_carry[10], opcode, sum[11], intermediate_carry[11]);
	one_bit_full_adder FAc (x[12], y[12], intermediate_carry[11], opcode, sum[12], intermediate_carry[12]);
    one_bit_full_adder FAd (x[13], y[13], intermediate_carry[12], opcode, sum[13], intermediate_carry[13]);
	one_bit_full_adder FAe (x[14], y[14], intermediate_carry[13], opcode, sum[14], intermediate_carry[14]);
	one_bit_full_adder FAf (x[15], y[15], intermediate_carry[14], opcode, sum[15], carry_out);


endmodule