module top;
<<<<<<< HEAD
reg [7:0] in;
wire [2:0] out;


priority_encoder pe(in  , out);
always @(in or out)
    begin 
    $display("input = %b  output = %d",in,out);
    end

initial 
    begin
    #100
    $finish;
    end


initial 
    begin
    in = 0;
    #1
    in = 1;
    #1
    in = 2;
    #1
    in = 32;
    #1
    in = 40;
    #1
    in = 64;
    #1
    in = 60;
    #1
    in = 200;
    #1
    in = 12;
    #1
    in = 36;
    #1
    in = 128;
    end

endmodule
=======

	reg [7:0] Input;    
    wire [2:0] Output;

    priority_encoder8to3 PRIORITY_ENCODER (Input, Output);

    always @ (Input or Output)
        begin
        $display("time=%d: Input = %b, Output = %b",$time,Input,Output);
        end
   
    initial
        begin
        #100
        $finish;
        end

    initial
        begin
         Input = 8'b10010000;
         #1
         $display("\n");
         Input = 8'b01000100;
         #1
         $display("\n");
         Input = 2;
         #1
         $display("\n");
         Input = 3;
         #1
         $display("\n");
         Input = 4;
         #1
         $display("\n");
         Input = 5;
         #1
         $display("\n");
         Input = 6;
         #1
         $display("\n");
         Input = 7;
        end


endmodule
>>>>>>> 8aeae52f047563b70e4e3ffd1016595ce30fa0b0
