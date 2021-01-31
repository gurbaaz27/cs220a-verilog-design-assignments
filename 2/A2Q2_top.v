module top;

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
