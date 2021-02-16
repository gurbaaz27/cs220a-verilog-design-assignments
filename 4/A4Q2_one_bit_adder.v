module one_bit_full_adder (a, b, cin, opcode, sum, carry);

	input a;
	input b;
	input cin;
	input opcode;

	output wire sum;
	output wire carry;

	assign sum = cin ^ (a ^ (b ^ opcode));
	assign carry = ( (a & (b ^ opcode)) | ((b ^ opcode) & cin) | (cin & a) );

endmodule