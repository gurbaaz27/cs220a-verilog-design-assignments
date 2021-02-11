module top;

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
