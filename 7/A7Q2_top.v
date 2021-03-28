module top;

    reg clk;
    reg [31:0] memory [0:6];
    wire [2:0] program_counter;
    
    initial begin
        $display("*************\n**DEBUGGING**\n*************");

        memory[0] = {6'h9,5'd0,5'd1,16'd45};                 // I
        memory[1] = {6'h9,5'd0,5'd2,-16'd20};                // I
        memory[2] = {6'h9,5'd0,5'd3,-16'd60};                // I
        memory[3] = {6'h9,5'd0,5'd4,16'd30};                 // I    
        memory[4] = {6'h0,5'd1,5'd2,5'd5,5'd0,6'h21};        // R          
        memory[5] = {6'h0,5'd3,5'd4,5'd6,5'd0,6'h21};        // R              
        memory[6] = {6'h0,5'd5,5'd6,5'd5,5'd0,6'h23};        // R  
    end  

    initial begin
        forever begin
        clk=0;
        #5
        clk=1;
        #5
        clk=0;
        end
    end

    process PROCESS(clk, memory[program_counter], program_counter);
    
endmodule