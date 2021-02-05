module top;
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