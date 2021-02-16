module five_bit (x, y, carry_in, opcode, sum);

   input [4:0] x;
   input [1:0] y;
   input carry_in;
   input opcode;

   reg buffer=0;

   output [4:0] sum;
   wire [4:0] sum;
   //output carry_out;
   wire carry_out;

   wire [3:0] intermediate_carry;

   one_bit FA0 (x[0], y[0], carry_in,opcode, sum[0], intermediate_carry[0]);
   one_bit FA1 (x[1], y[1], intermediate_carry[0],opcode,  sum[1], intermediate_carry[1]);
   one_bit FA2 (x[2], buffer , intermediate_carry[1],opcode,  sum[2], intermediate_carry[2]);
   one_bit FA3 (x[3], buffer , intermediate_carry[2],opcode,  sum[3], intermediate_carry[3]);
   one_bit FA4 (x[4], buffer , intermediate_carry[3],opcode,  sum[4], carry_out);

  
endmodule