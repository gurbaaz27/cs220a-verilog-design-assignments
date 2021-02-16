module top;
    reg [7:0] A;
    reg [7:0] B;
    reg Cin;
    reg opcode;

    wire [7:0] Sum;
    wire Carry;

    eight_bit M (A, B, Cin,opcode, Sum, Carry);
    always @ (A or B or Cin or Sum or Carry or opcode)
        begin
        $display("time=%d: A = %b, B = %b, Cin = %b,Opcode= %b ,Sum = %b, Carry = %b",$time,A,B,Cin,opcode,Sum,Carry);
        end
   
    initial
        begin
        #100
        $finish;
        end

    initial
        begin
         A = 100; B = 100; Cin = 0;opcode=0;
         #1
         $display("\n");
         A = 50; B = 60; Cin = 0;opcode=0;
         #1
         $display("\n");
         A = 200; B = 200; Cin = 0;opcode=0;
         #1
         $display("\n");
         A = 10; B = 10; Cin = 1;opcode=1;
         #1
         $display("\n");
         A = 1; B = 2; Cin = 1;opcode=1;
         #1
         $display("\n");
         A = 20; B = 0; Cin = 1;opcode=1;
         #1
         $display("\n");
         A = 0; B = 0; Cin = 1;opcode=1;
         #1
         $display("\n");
         A = 15; B = 31; Cin = 1;opcode=1;
         #1
         $display("\n");
         A = 20; B = 100; Cin = 1;opcode=1;
         #1
         $display("\n");
         A = 9; B = 6; Cin = 1;opcode=1;
         
        end

endmodule
