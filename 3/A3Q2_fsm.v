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

    
endmodule