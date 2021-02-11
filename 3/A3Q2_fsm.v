module fsm (in, clk, out);

	input in;
	input clk;
	reg a,b,c;
	output wire out;

	initial begin
		a = 0; b = 0; c = 0;
	end
               
	always @(posedge clk) begin 
		a <= (~in & (c | a)) | (a & (b | c)) | (b & in);
		b <= (a & b) | (~a & ~b & in) | (a & ~c & in);
		c <= ~c | a | (b & in) | (~b & c & ~in);
    end

	assign out = ~a | b | ~c;

endmodule