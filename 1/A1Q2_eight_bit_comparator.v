module eight_bit_comparator (x,y,greater,less,equal);

   input [7:0] x;
   input [7:0] y;

   output wire greater;
   output wire less;
   output wire equal;

   wire [7:0] inter_equal;
   wire [7:0] inter_greater;
   wire [7:0] inter_less;
   assign inter_equal[7]=1;
   assign inter_greater[7] = 0;
   assign inter_less[7]=0;


   one_bit_full_comparator FA7 (x[7], y[7], inter_greater[6], inter_less[6], inter_equal[6] , inter_greater[7], inter_less[7], inter_equal[7] );

   one_bit_full_comparator FA6 (x[6], y[6],  inter_greater[5], inter_less[5], inter_equal[5] ,  inter_greater[6], inter_less[6], inter_equal[6] );

   one_bit_full_comparator FA5 (x[5], y[5],  inter_greater[4], inter_less[4], inter_equal[4] , inter_greater[5], inter_less[5], inter_equal[5] );

   one_bit_full_comparator FA4 (x[4], y[4],  inter_greater[3], inter_less[3], inter_equal[3] , inter_greater[4], inter_less[4], inter_equal[4]);

   one_bit_full_comparator FA3 (x[3], y[3], inter_greater[2], inter_less[2], inter_equal[2] , inter_greater[3], inter_less[3], inter_equal[3] );

   one_bit_full_comparator FA2 (x[2], y[2], inter_greater[1], inter_less[1], inter_equal[1]  ,inter_greater[2], inter_less[2], inter_equal[2]  );

   one_bit_full_comparator FA1 (x[1], y[1], inter_greater[0], inter_less[0], inter_equal[0]  , inter_greater[1], inter_less[1], inter_equal[1] );

   one_bit_full_comparator FA0 (x[0], y[0],greater, less, equal, inter_greater[0], inter_less[0], inter_equal[0] );

endmodule