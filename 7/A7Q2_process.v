
`include "header.h"
module process(clk, memory , program_counter );

    input [31:0] memory;
    input clk;
    
    output [2:0] program_counter;
    reg [2:0] program_counter;
    reg [2:0] counter;
    //input [2:0] state;
    reg [2:0] state;
    reg [31:0] instruction;

    reg [4:0] read1Addr;
    reg [4:0] read2Addr;
    reg [4:0] writeAddr;
    reg signed [7:0] res;
    reg signed [7:0] operand1;
    reg signed [7:0] operand2;

    reg opcode ;  // set to one if addition ; 0 if subtraction 

    reg[7:0] writeValue;
    reg read1Valid;
    reg read2Valid;
    reg writeValid;
	
 
   reg instruction_valid ;
   wire [7:0] read1Value;
   wire [7:0] read2Value;

    initial begin
        program_counter=0;
        state=0;
        counter =0;
        read1Valid = 0;
        read2Valid = 0;
        writeValid = 0;
        instruction_valid=0;
    end

    register_file REG1(clk,  read1Addr, read2Addr, writeAddr, writeValue, read1Valid, read2Valid, writeValid, read1Value, read2Value);
    always @(posedge clk) begin
        //$display("%b, %d , %d", memory , state, program_counter );

      if(counter == 0)begin
            

        case (state) 
            0:begin

                instruction = memory;
                $display("%b", instruction );
                program_counter <= program_counter + 1;
                instruction_valid=0;
                writeValid = 0;
                read1Valid = 0;
                read2Valid = 0;
                state <= 1;
            end

            1:begin
                $display("%d", program_counter );
                counter = 2;
                if(instruction[31:26] == 6'h0) begin
                            instruction_valid=1;
                            read1Addr = instruction [25:21];
                            read2Addr = instruction [20:16];
                            writeAddr = instruction [15:11];
                            read1Valid = 1;
                            read2Valid = 1;
                            writeValid = 0;

                    if(instruction[5:0] == 6'h21 )begin
                            $display("addu");
                            
                            opcode =1;

                            //operand2  = instruction [7:0];


                    end
                    else if(instruction[5:0] == 6'h23 )begin
                            $display("subu");
                            opcode =0;
                    end
                
                    
                    /**
                    R_counter <= R_counter + 1;
                    case(memory[15:11])
                        3: reg_3_counter <= reg_3_counter + 1;
                        4: reg_4_counter <= reg_4_counter + 1;
                        5: reg_5_counter <= reg_5_counter + 1;
                        6: reg_6_counter <= reg_6_counter + 1;
                    endcase*/
                end
                else if(instruction[31:26] == 6'h9)begin
                        instruction_valid=1;
                        $display("addiu");
                        read1Addr = instruction [25:21];
                        writeAddr = instruction [20:16];
                        read1Valid = 1;
                        read2Valid = 0;
                        writeValid = 0;
                        opcode = 1 ;
                end

                $display("%d, %d , %d", read1Addr , read2Addr, writeAddr );
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
                $display("%d, %d", operand1 , operand2 );
                if(instruction_valid == 1 )begin
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
                $display("%d", res);
                if(instruction_valid ==1 && writeAddr != 0 )begin
                    counter = 2 ;
                    writeValid = 1;
                    read1Valid = 0;
                    read2Valid = 0;
                    writeValue = res;
                    $display("would write");
                end
                state <= 5;
            end
            5:begin
                state <= 0;
            end
        endcase

      end

        if(counter > 0 )begin
            counter <= counter - 1;
        end
         

    end

endmodule