module top;
<<<<<<< HEAD
reg [2:0] in;
wire [2:0] out;
wire [7:0] intermediate;

decoder3to8 d(in  , intermediate);
encoder8to3 e(intermediate , out);

always @(in or out)
    begin 
    $display("input = %d  %d = output",in,out);
    end

initial 
    begin
    #10
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
    in = 3;
    #1
    in = 4;
    #1
    in = 5;
    #1
    in = 6;
    #1
    in = 7;

    end

endmodule
=======

	reg [2:0] Input;    
    wire [7:0] Decoded;
    wire [2:0] Output;

    decoder3to8 DECODER (Input, Decoded);
    encoder8to3 ENCODER (Decoded, Output);

    always @ (Input or Decoded or Output)
        begin
        $display("time=%d: Input = %d, Decoded = %d, Output = %d",$time,Input,Decoded,Output);
        end
   
    initial
        begin
        #1000
        $finish;
        end

    initial
        begin
         Input = 0;
         #10
         $display("\n");
         Input = 1;
         #10
         $display("\n");
         Input = 2;
         #10
         $display("\n");
         Input = 3;
         #10
         $display("\n");
         Input = 4;
         #10
         $display("\n");
         Input = 5;
         #10
         $display("\n");
         Input = 6;
         #10
         $display("\n");
         Input = 7;
        end


endmodule
>>>>>>> 8aeae52f047563b70e4e3ffd1016595ce30fa0b0
