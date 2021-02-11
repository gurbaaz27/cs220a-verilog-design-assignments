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
         Input = 0;
         #1
         $display("\n");
         Input = 1;
         #1
         $display("\n");
         Input = 2;
         #1
         $display("\n");
         Input = 32;
         #1
         $display("\n");
         Input = 40;
         #1
         $display("\n");
         Input = 64;
         #1
         $display("\n");
         Input = 60;
         #1
         $display("\n");
         Input = 200;
         #1
         $display("\n");
         Input = 12;
         #1
         $display("\n");
         Input = 36;
         #1
         $display("\n");
         Input = 128;
        end


endmodule
