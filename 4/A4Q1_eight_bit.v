module eight_bit (x, y, carry_in, opcode, sum, carry_out);

   input [7:0] x;
   input [7:0] y;
   input carry_in;
   input opcode;

   output [7:0] sum;
   wire [7:0] sum;
   output carry_out;
   wire carry_out;

   wire [6:0] intermediate_carry;

   one_bit FA0 (x[0], y[0], carry_in,opcode, sum[0], intermediate_carry[0]);
   one_bit FA1 (x[1], y[1], intermediate_carry[0],opcode,  sum[1], intermediate_carry[1]);
   one_bit FA2 (x[2], y[2], intermediate_carry[1],opcode,  sum[2], intermediate_carry[2]);
   one_bit FA3 (x[3], y[3], intermediate_carry[2],opcode,  sum[3], intermediate_carry[3]);
   one_bit FA4 (x[4], y[4], intermediate_carry[3],opcode,  sum[4], intermediate_carry[4]);
   one_bit FA5 (x[5], y[5], intermediate_carry[4],opcode,  sum[5], intermediate_carry[5]);
   one_bit FA6 (x[6], y[6], intermediate_carry[5],opcode,  sum[6], intermediate_carry[6]);
   one_bit FA7 (x[7], y[7], intermediate_carry[6],opcode,  sum[7], carry_out);

endmodule