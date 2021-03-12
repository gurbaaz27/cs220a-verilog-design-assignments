module top;
	reg [2:0] Input1;
    reg [2:0] Input2;
    reg [2:0] Input3;
    reg [2:0] Input4;
    wire [1:0] Output;

    compute_index COMPUTE_INDEX (Input1, Input2, Input3, Input4, Output);

    always @ ( Input1 or Input2 or Input3 or Input4 or Output) begin
        $display("time=%g: Input1 = %b, Input2 = %b, Input3 = %b, Input4 = %b, Output = %d",$time,Input1,Input2,Input3,Input4,Output);
    end
   
    initial
        begin
        #10
        $finish;
        end

    initial
        begin
         Input1 = 3'b110; Input2 = 3'b001; Input3 = 3'b001; Input4 = 3'b001;
         #1
         $display("\n");
         Input1 = 3'b110; Input2 = 3'b001; Input3 = 3'b111; Input4 = 3'b010;
         #1
         $display("\n");
         Input1 = 3'b111; Input2 = 3'b011; Input3 = 3'b010; Input4 = 3'b110;
         #1
         $display("\n");
         Input1 = 3'b110; Input2 = 3'b001; Input3 = 3'b111; Input4 = 3'b010;
         #1
         $display("\n");
         Input1 = 3'b001; Input2 = 3'b111; Input3 = 3'b010; Input4 = 3'b110;
         #1
         $display("\n");
         Input1 = 3'b110; Input2 = 3'b001; Input3 = 3'b111; Input4 = 3'b010;
         #1
         $display("\n");
         Input1 = 3'b110; Input2 = 3'b111; Input3 = 3'b010; Input4 = 3'b000;
         #1
         $display("\n");
         Input1 = 3'b000; Input2 = 3'b001; Input3 = 3'b111; Input4 = 3'b010;
         #1
         $display("\n");
         Input1 = 3'b001; Input2 = 3'b111; Input3 = 3'b000; Input4 = 3'b110;
         #1
         $display("\n");
         Input1 = 3'b101; Input2 = 3'b001; Input3 = 3'b111; Input4 = 3'b010;
        end

endmodule