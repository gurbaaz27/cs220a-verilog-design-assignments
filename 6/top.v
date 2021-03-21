`define TICK #2 
module top;

    reg clk;
    reg [4:0] input_adr1;
    reg [4:0] input_adr2;
    reg [4:0] write_adr;
    reg [2:0] instruction;
    
    wire signed [15:0] read1;
    wire signed [15:0] read2;  
    reg signed [15:0] data;

    reg [2:0] instruction_array [8:0];
    reg [4:0] input_adr1_array [8:0];
    reg [4:0] input_adr2_array [8:0];
    reg [4:0] write_adr_array [8:0];
    reg signed [15:0] data_array [8:0];
    reg [4:0] done_counter; 
    reg [5:0] num_instructions;

    initial begin
      done_counter = 0;

       instruction_array[0] = 3'b000;  write_adr_array[0] = 1; data_array[0] = 17 ;
       instruction_array[1] = 3'b011; input_adr1_array[1] = 1;write_adr_array[1] = 2 ; data_array[1] = -9;
       instruction_array[2] = 3'b100; input_adr1_array[2] = 1; input_adr2_array[2] = 2 ; write_adr_array[2]  = 3 ; data_array[2] = 65;
       instruction_array[3] = 3'b010; input_adr1_array[3] = 2;input_adr2_array[3] = 3 ;
       instruction_array[4] = 3'b111; input_adr1_array[4] = 3;write_adr_array[4] = 5; data_array[4] = 3;
       instruction_array[5] = 3'b101; input_adr1_array[5] = 1; input_adr2_array[5] =2; write_adr_array[5]=4; 
       instruction_array[6] = 3'b111; input_adr1_array[6] = 4 ; write_adr_array[6]=4; data_array[6]=9;
       instruction_array[7] = 3'b110; input_adr1_array[7] = 5; input_adr2_array[7]=4; write_adr_array[7]=6; 
       instruction_array[8] = 3'b001; input_adr1_array[8] = 6; 
       #1
       instruction = instruction_array[0] ; input_adr1 = input_adr1_array[0] ; input_adr2 =input_adr2_array[0]; write_adr=write_adr_array[0] ; data = data_array[0];
       num_instructions = 9;
    end



    process P(clk,instruction,input_adr1 ,input_adr2, write_adr ,data,done ,read1, read2  );

    always @(posedge done)
    begin
         case (instruction)
                3'b000 : begin
                    //Nothing
                end
                3'b001 : begin
                  $display("<read_adr,value> = (%d,%d) ", input_adr1 , read1 );
                end
                3'b010 : begin
                  $display("<read_adr1,value> = (%d,%d) <read_adr2,value> = (%d,%d)", input_adr1 ,read1 , input_adr2 , read2);
                end
                3'b011 : begin
                  $display("<read_adr,value> = (%d,%d) ", input_adr1 , read1 );
                end
                3'b100 : begin
                  $display("<read_adr1,value> = (%d,%d) <read_adr2,value> = (%d,%d)", input_adr1 ,read1 , input_adr2 , read2);
                end
                3'b101 : begin
                  $display("<write_adr1,value> = (%d,%d) ", write_adr , read1 );
                end
                3'b110 : begin
                  $display("<write_adr1,value> = (%d,%d) ", write_adr  , read1 );
                end
                3'b111 : begin
                  $display("<write_adr1,value> = (%d,%d) ", write_adr  , read2 );
                end
            endcase


            done_counter = done_counter +1 ;
            instruction = instruction_array[done_counter] ; input_adr1 = input_adr1_array[done_counter] ; input_adr2 =input_adr2_array[done_counter]; write_adr=write_adr_array[done_counter] ; data = data_array[done_counter];
           // $display("time => %d",$time);

            if(done_counter == num_instructions)begin
              $finish;  //this code finishes when the predefined number of instructions have been completed.
            end
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
    
endmodule