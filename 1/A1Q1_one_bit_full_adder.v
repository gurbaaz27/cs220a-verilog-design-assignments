module one_bit_full_adder (a, b, cin, sum, cout);

   input a;
   input b;
   input cin;

   output sum;
   wire sum;
   output cout;
   wire cout;
   assign sum = cin^(a^b);
   assign cout = ((a&b) | (b&cin) | (a&cin)); 

endmodule