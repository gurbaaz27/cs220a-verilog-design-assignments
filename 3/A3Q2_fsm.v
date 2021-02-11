<<<<<<< HEAD
`define TICK #2
module fsm(bit, clk ,out);
    input bit ;
    input clk;
    output out;
    reg out;
    reg [3:0] state;
    initial state <=`TICK 3'b000;

    always @(posedge clk) begin
        case (state)
            3'b000: begin
                        if(bit == 1'b0) state =3'b001 ;
                        else if(bit ==1'b1)    state = 3'b010 ;
                    end
            3'b001:  begin
                         if(bit == 1'b0) state = 3'b101 ;
                         else if(bit ==1'b1)   state = 3'b011 ;
                     end
            3'b010:  begin
                         if(bit == 1'b0) state = 3'b100 ;
                         else if(bit ==1'b1)   state = 3'b101 ;
                     end
            3'b011:  begin
                         if(bit == 1'b0) state = 3'b001 ;
                         else if(bit ==1'b1)   state = 3'b101 ;
                     end
            3'b100:  begin
                         if(bit == 1'b0) state = 3'b101 ;
                         else if(bit ==1'b1)   state = 3'b010 ;
                     end
            3'b101:  begin
                        state = 3'b101 ;  
                     end         
        endcase


        if(state == 3'b101)out = 0;
        else out = 1;
    end

    
=======
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

>>>>>>> df3e2484c78eb20bae8180df20773f8ad1e10eda
endmodule