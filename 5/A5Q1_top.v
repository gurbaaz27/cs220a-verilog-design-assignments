module top;
	reg [1:0] Y;
    reg clk;    
    wire [3:0] State;

    fsm FSM (Y, clk, State);

    always @ ( posedge clk ) begin
        $display("time=%g: Current State = %d, Y = %b",$time,State,Y);
    end

    initial begin
        #100
        $finish;
    end

    initial begin
        forever begin
         clk = 0;
         #5        
         clk = 1;
         #5        
         clk = 0;
        end
    end

    initial
        begin
         #3
         Y = 0;
         #10        
         Y = 1;
         #10
         Y = 2;
         #10
         Y = 2'b1x;
         #10
         Y = 3;
         #10
         Y = 2;
         #10
         Y = 0;
         #10
         Y = 2;
         #10
         Y = 2'b1x;
         #10
         Y = 3;
        end

endmodule