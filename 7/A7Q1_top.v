module top;

    reg clk;
    reg [31:0] memory [0:7];
    
    reg [2:0] program_counter;

    wire [2:0] R_counter;
    wire [2:0] I_counter;
    wire [2:0] J_counter;

    wire [2:0] reg_3_counter;
    wire [2:0] reg_4_counter;
    wire [2:0] reg_5_counter;
    wire [2:0] reg_6_counter;

    decoder DECODER(clk, memory[program_counter], R_counter, I_counter, J_counter, reg_3_counter, reg_4_counter, reg_5_counter, reg_6_counter);
    
    initial begin
        program_counter = 0;

        memory[0] = {6'h8,5'b00000,5'b00100,16'h3456};                  // I
        memory[1] = {6'h8,5'b00000,5'b00101,16'hffff};                  // I
        memory[2] = {6'h0,5'b00100,5'b00101,5'b00110,5'b0,6'h20};       // R
        memory[3] = {6'h8,5'b00000,5'b00011,16'h7};                     // I    
        memory[4] = {6'h0,5'b00110,5'b00011,5'b00110,5'h0,6'h4};        // R          
        memory[5] = {6'h0,5'b00011,5'b00000,5'b00011,5'h1,6'h2};        // R               
        memory[6] = {6'h23,5'b00100,5'b00101,16'h9abc};                 // I
        memory[7] = {6'h2,26'h123456};                                  // J
    end  

    initial begin
        forever begin
        clk=0;
        #5
        clk=1;
        program_counter <= program_counter + 1;
        #5
        clk=0;
        end
    end 

    initial begin
        #76
        $display("Program terminated...\nNumber of\nR-format instructions: %d\nI-format instructions: %d\nJ-format instructions: %d\nNumber of instructions that write to\n$3: %d\n$4: %d\n$5: %d\n$6: %d",R_counter,I_counter,J_counter,reg_3_counter,reg_4_counter,reg_5_counter,reg_6_counter);
        $finish;
    end
    
endmodule