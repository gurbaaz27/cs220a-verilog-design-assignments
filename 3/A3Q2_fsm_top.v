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
endmodule