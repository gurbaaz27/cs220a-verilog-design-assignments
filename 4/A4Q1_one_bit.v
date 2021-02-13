module one_bit_full_adder (a, b, cin, sum, carry);

	input a;
	input b;
	input cin;

	output wire sum;
	output wire carry;

	assign sum = cin ^ (a ^ b);
	assign carry = ( (a & b) | (b & cin) | (cin & a) );

endmodule
