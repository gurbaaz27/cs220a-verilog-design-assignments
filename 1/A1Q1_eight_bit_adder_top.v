module eight_bit_adder_top;
    reg [7:0] A;
    reg [7:0] B;
    reg Cin;

    wire [7:0] Sum;
    wire Carry;

    eight_bit_adder ADDER (A, B, Cin, Sum, Carry);
    always @ (A or B or Cin or Sum or Carry)
        begin
        $display("time=%d: A = %d, B = %d, Cin = %d, Sum = %d, Carry = %d",$time,A,B,Cin,Sum,Carry);
        end
   
    initial
        begin
        #100
        $finish;
        end

    initial
        begin
         A = 100; B = 100; Cin = 1;
         #1
         $display("\n");
         A = 50; B = 60; Cin = 0;
         #1
         $display("\n");
         A = 200; B = 200; Cin = 0;
         #1
         $display("\n");
         A = 10; B = 10; Cin = 1;
         #1
         $display("\n");
         A = 1; B = 2; Cin = 0;
         #1
         $display("\n");
         A = 20; B = 0; Cin = 0;
         #1
         $display("\n");
         A = 0; B = 0; Cin = 1;
         #1
         $display("\n");
         A = 255; B = 255; Cin = 0;
         #1
         $display("\n");
         A = 20; B = 200; Cin = 0;
         #1
         $display("\n");
         A = 5; B = 6; Cin = 1;
         
        end

endmodule
