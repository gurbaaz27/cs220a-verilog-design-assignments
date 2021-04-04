`include "A7Q2_header.h"
module process(clk);

    input clk;

    reg [31:0] memory [0:6];
    reg [2:0] program_counter;

    reg [2:0] counter;
    reg [2:0] state;
    reg [31:0] instruction;

    reg [4:0] read1Addr;
    reg [4:0] read2Addr;
    reg [4:0] writeAddr;
    reg signed [7:0] res;
    reg signed [7:0] operand1;
    reg signed [7:0] operand2;

    reg opcode ;  // set to one if addition ; 0 if subtraction 

    reg [7:0] writeValue;
    reg read1Valid;
    reg read2Valid;
    reg writeValid;	
 
    reg instruction_valid ;
    wire [7:0] read1Value;
    wire [7:0] read2Value;
    
    initial begin
        $display("*************\n**DEBUGGING**\n*************");

        memory[0] = {6'h9,5'd0,5'd1,16'd45};                 // I
        memory[1] = {6'h9,5'd0,5'd2,-16'd20};                // I
        memory[2] = {6'h9,5'd0,5'd3,-16'd60};                // I
        memory[3] = {6'h9,5'd0,5'd4,16'd30};                 // I    
        memory[4] = {6'h0,5'd1,5'd2,5'd5,5'd0,6'h21};        // R          
        memory[5] = {6'h0,5'd3,5'd4,5'd6,5'd0,6'h21};        // R              
        memory[6] = {6'h0,5'd5,5'd6,5'd5,5'd0,6'h23};        // R  

        program_counter = 0;
        state = 0;
        counter = 0;
        read1Valid = 0;
        read2Valid = 0;
        writeValid = 0;
        instruction_valid = 0;
    end

    register_file REG1(clk, read1Addr, read2Addr, writeAddr, writeValue, read1Valid, read2Valid, writeValid, read1Value, read2Value);
    
    always @(posedge clk) begin

      if(counter == 0)begin            

        case (state) 
            0:begin
                instruction = memory[program_counter];
                $display("instruction: %b", instruction);
                program_counter <= program_counter + 1;
                instruction_valid = 0;
                writeValid = 0;
                read1Valid = 0;
                read2Valid = 0;
                state <= 1;
            end

            1:begin
                $display("program counter: %d", program_counter);
                counter = 2;
                if(instruction[31:26] == 6'h0) begin
                    read1Addr = instruction [25:21];
                    read2Addr = instruction [20:16];
                    writeAddr = instruction [15:11];
                    read1Valid = 1;
                    read2Valid = 1;
                    writeValid = 0;

                    if(instruction[5:0] == 6'h21 )begin
                        $display("operation: addu");                                
                        opcode = 1;
                    end
                    else if(instruction[5:0] == 6'h23 )begin
                        $display("operation: subu");
                        opcode =0;
                    end
                end
                else if(instruction[31:26] == 6'h9)begin
                    $display("Operation: addiu");
                    read1Addr = instruction [25:21];
                    writeAddr = instruction [20:16];
                    read1Valid = 1;
                    read2Valid = 0;
                    writeValid = 0;
                    opcode = 1 ;
                end

                $display("readadr1, readadr2, writeadr: %d, %d , %d", read1Addr, read2Addr, writeAddr);
                state <= 2;
            end

            2:begin
                if(instruction[31:26] == 6'h0) begin
                    operand1 <= read1Value;
                    operand2 <= read2Value;
                end
                else if(instruction[31:26] == 6'h9)begin
                    operand1 <= read1Value;
                    operand2 <= instruction [7:0];
                end
                read1Valid = 0;
                read2Valid = 0;
                writeValid = 0;
                
                state <= 3;
            end
            3:begin
                if(instruction[31:26] == 6'h0) begin
                    if(instruction[5:0] == 6'h21 )begin
                        instruction_valid = 1;
                    end
                    else if(instruction[5:0] == 6'h23 )begin
                        instruction_valid = 1;
                    end
                end
                else if(instruction[31:26] == 6'h9)begin
                    instruction_valid = 1;
                end
                $display("operand1, operand2: %d, %d", operand1 , operand2 );
                if(instruction_valid == 1)begin
                    if(opcode==1)begin
                        res <= operand1 + operand2;
                    end
                    else begin
                        res <= operand1 - operand2;
                    end
                end
                state <= 4;
            end
            4:begin
                $display("result: %d", res);
                if(instruction_valid == 1 && writeAddr != 0)begin
                    counter = 2 ;
                    writeValid = 1;
                    read1Valid = 0;
                    read2Valid = 0;
                    writeValue = res;
                    $display("would write to destination register");
                end
                if(program_counter < `MAX_PC)begin
                    state <= 0;
                end
                else begin
                    state <= 5;
                end
                $display("-----------------");
            end
            5:begin
                $display("**********\n**FINISH**\n**********");                
                $display("contents of OUTPUT_REG: %d", res);
                $finish;
            end
        endcase

      end

        if(counter > 0 )begin
            counter <= counter - 1;
        end       

    end

endmodule