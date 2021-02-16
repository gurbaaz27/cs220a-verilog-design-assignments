module one_bit (a, b, cin, op, sum, carry);

   input a;
   input b;
   input cin;
   input op;

   output sum;
   wire sum;
   output carry;
   wire carry;
   assign sum = cin^(a^(b^op));
   assign carry = ((a&(b^op)) | ((b^op)&cin) | (a&cin)); 

endmodule