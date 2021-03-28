`define TICK #2 
module top;

    reg clk;
    reg [31:0] memory [0:6];
    //reg [2:0] state;
    wire [2:0] program_counter;
    
    // wire signed [15:0] read1;
    // wire signed [15:0] read2;  
    // reg signed [15:0] data;
    // reg [2:0] instruction_array [8:0];
    // reg [4:0] input_adr1_array [8:0];
    // reg [4:0] input_adr2_array [8:0];
    // reg [4:0] write_adr_array [8:0];
    // reg signed [15:0] data_array [8:0];
    // reg [4:0] done_counter; 
    // reg [5:0] num_instructions;
    
    initial begin
        //program_counter = 0;
        //state = 0;
        memory[0] = {6'h9,5'b0,5'b00001,16'd45};                             // I
        memory[1] = {6'h9,5'b0,5'b00010,-16'd20};                            // I
        memory[2] = {6'h9,5'b0,5'b00011,-16'd60};                            // I
        memory[3] = {6'h9,5'b0,5'b00100,16'd30};                             // I    
        memory[4] = {6'h0,5'b00001,5'b00010,5'b00101,5'b0,6'h21};        // R          
        memory[5] = {6'h0,5'b00011,5'b00100,5'b00110,5'b0,6'h21};        // R              
        memory[6] = {6'h0,5'b00101,5'b00110,5'b00101,5'b0,6'h23};        // R  
    end  

    initial begin
        forever begin
        clk=0;
        #5
        clk=1;
        //program_counter <= program_counter + 1;
        #5
        clk=0;
        end
    end

    process PROCESS(clk, memory[program_counter] , program_counter );
    

    // always @(posedge done)
    // begin
    //      case (instruction)
    //             3'b000 : begin
    //                 //Nothing
    //             end
    //             3'b001 : begin
    //               $display("<read_adr,value> = (%d,%d) ", input_adr1 , read1 );
    //             end
    //             3'b010 : begin
    //               $display("<read_adr1,value> = (%d,%d) <read_adr2,value> = (%d,%d)", input_adr1 ,read1 , input_adr2 , read2);
    //             end
    //             3'b011 : begin
    //               $display("<read_adr,value> = (%d,%d) ", input_adr1 , read1 );
    //             end
    //             3'b100 : begin
    //               $display("<read_adr1,value> = (%d,%d) <read_adr2,value> = (%d,%d)", input_adr1 ,read1 , input_adr2 , read2);
    //             end
    //             3'b101 : begin
    //               $display("<write_adr1,value> = (%d,%d) ", write_adr , read1 );
    //             end
    //             3'b110 : begin
    //               $display("<write_adr1,value> = (%d,%d) ", write_adr  , read1 );
    //             end
    //             3'b111 : begin
    //               $display("<write_adr1,value> = (%d,%d) ", write_adr  , read2 );
    //             end
    //         endcase


    //         done_counter = done_counter +1 ;
    //         instruction = instruction_array[done_counter] ; input_adr1 = input_adr1_array[done_counter] ; input_adr2 =input_adr2_array[done_counter]; write_adr=write_adr_array[done_counter] ; data = data_array[done_counter];
    //        // $display("time => %d",$time);

    //         if(done_counter == num_instructions)begin
    //           $finish;  //this code finishes when the predefined number of instructions have been completed.
    //         end
    // end

    always @(posedge clk)begin
       // $display("%b",memory[program_counter]);
    end

   initial begin
       #1200
       $finish;
   end
    
    
endmodule