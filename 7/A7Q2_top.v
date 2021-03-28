module top;

    reg clk;

    initial begin
        forever begin
        clk=0;
        #5
        clk=1;
        #5
        clk=0;
        end
    end

    process PROCESS(clk);
    
endmodule