module top;
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