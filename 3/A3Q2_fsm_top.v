<<<<<<< HEAD
`define TICK #2
module top;

    reg bit ;
    reg clk;
    wire out;

    fsm M(bit , clk, out);
    always @(posedge clk or out)begin
        $display("<%d> %d ",$time ,out);
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

    initial begin
        #3
        bit =0;
        #10
        bit =1;
        #10
        bit =0;
        #10
        bit =1;
        #10
        bit =0;
        #10
        bit =1;
        #10
        bit =0;
        #10
        bit =0;
        #10
        bit =0;
        #10
        bit =1;
        #10
        $finish;
    end

    initial begin
        #200
        $finish;
    end
=======
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

>>>>>>> df3e2484c78eb20bae8180df20773f8ad1e10eda
endmodule