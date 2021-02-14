module eight_bit_adder_top;

    reg signed [7:0] A;
    reg signed [7:0] B;
    reg Opcode;

    wire signed [7:0] Sum;
    wire Carry;
    wire Overflow;

    eight_bit_adder ADDER (A, B, Opcode, Sum, Carry, Overflow);

    always @ (A or B or Opcode or Sum or Carry or Overflow)
        begin
        $display("time=%d: A = %d, B = %d, Opcode = %b, Sum = %d, Carry = %d, Overflow = %b",$time,A,B,Opcode,Sum,Carry,Overflow);
        end
   
    initial
        begin
        #100
        $finish;
        end

    initial
        begin
        /*****
        put good test cases
        ******/
         A = 100; B = 100; Opcode = 1;
         #1
         $display("\n");
         A = 50; B = 60; Opcode = 0;
         #1
         $display("\n");
         A = 110; B = 30; Opcode = 0;
         #1
         $display("\n");
         A = 10; B = -125; Opcode = 1;
         #1
         $display("\n");
         A = 1; B = 2; Opcode = 0;
         #1
         $display("\n");
         A = 20; B = 0; Opcode = 0;
         #1
         $display("\n");
         A = 0; B = 0; Opcode = 1;
         #1
         $display("\n");
         A = -123; B = -6; Opcode = 0;
         #1
         $display("\n");
         A = 127; B = 127; Opcode = 0;
         #1
         $display("\n");
         A = 5; B = 6; Opcode = 1;         
        end

endmodule