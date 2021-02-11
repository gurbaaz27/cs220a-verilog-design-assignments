module top;
	reg Input;
    reg clk;    
    wire Output;

    fsm FSM (Input, clk, Output);

    always @ ( clk )
        begin
        $display("time=%d: Input = %b, Output = %b",$time,Input,Output);
        end
   
    initial
        begin
        #103
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
         Input = 0;
         #10        
         Input = 1;
         #10
         Input = 0;
         #10
         Input = 1;
         #10
         Input = 0;
         #10
         Input = 1;
         #10
         Input = 0;
         #10
         Input = 1;
         #10
         Input = 0;
         #10
         Input = 1;
        end

endmodule