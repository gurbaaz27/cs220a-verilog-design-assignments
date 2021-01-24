module eight_bit_comparator_top;
    reg [7:0] A;
    reg [7:0] B;

    wire greater ;
    wire less;
    wire equal;


    eight_bit_comparator COMPARE(A,B,greater,less,equal);
    always @ (A or B or greater or equal or less)
        begin
        $display("A = %d , B = %d, greater = %d, less = %d,  equal = %d",A,B,greater,less,equal);
        end
   
    initial
        begin
        #100
        $finish;
        end

    initial
        begin
         A = 100; B = 100;
         #1
         $display("\n");
         A = 50; B = 60; 
         #1
         $display("\n");
         A = 32; B =  31; 
         #1
         $display("\n");
         A = 255; B = 255; 
         #1
         $display("\n");
         A = 0; B = 255; 
         #1
         $display("\n");
         A = 31; B = 128; 
         #1
         $display("\n");
         A = 26; B = 75; 
         #1
         $display("\n");
         A = 99; B = 100;
         #1
         $display("\n");
         A = 235; B = 200; 
         #1
         $display("\n");
         A = 6; B = 6; 
         
        end

endmodule