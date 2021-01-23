module eight_bit_adder_top;

	reg [7:0] A;
	reg [7:0] B;
	reg Cin;

	wire [7:0] Sum;
	wire Carry;

	eight_bit_adder ADDER (A, B, Cin, Sum, Carry);

	always @ (A or B or Cin)

	end

	initial begin
      		A = 100; B = 100; Cin = 1;
      		#1
      		$display("\n");
      		A = 200; B = 200; Cin = 0;
      		#1
      		$display("\n");
      		A = 20; B = 200; Cin = 0;
      		#1
      
   	end


endmodule
