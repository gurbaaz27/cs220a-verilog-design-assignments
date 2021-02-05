module one_bit_full_comparator (a, b, greater , less , equal , prev_greater, prev_less, prev_equal);

   input a;
   input b;
   input prev_greater;
   input prev_less;
   input prev_equal;
   output wire greater;
   output wire less;
   output wire equal;
   
   assign greater = prev_greater | (prev_equal & a & (~b)) ;
   assign less = prev_less | (prev_equal & b & (~a));
   assign equal = prev_equal & (((~a) & (~b)) | (a&b));

endmodule