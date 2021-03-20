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
    end


    initial begin
        #1000
        $finish;
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
/**
    initial begin
        #4
        input_adr1 = 0 ;  input_adr2 = 1 ;  write_adr = 0 ; data = 1 ; valid = 3'b100;
        #20
        input_adr1 = 0 ;  input_adr2 = 1 ;  write_adr = 1 ; data = 1 ; valid = 3'b100;
        #20
        input_adr1 = 1 ;  input_adr2 = 2 ;  write_adr = 2 ; data = 2 ; valid = 3'b100;
        #20
        input_adr1 = 2 ;  input_adr2 = 3 ;  write_adr = 3 ; data = 3 ; valid = 3'b100;
        #20
        input_adr1 = 3 ;  input_adr2 = 4 ;  write_adr = 4 ; data = 4 ; valid = 3'b100;
        #20
        input_adr1 = 4 ;  input_adr2 = 5 ;  write_adr = 5 ; data = 5 ; valid = 3'b100;
        #20
        input_adr1 = 0 ;  input_adr2 = 1 ;  write_adr = 0 ; data = 0 ; valid = 3'b100;
        #20
        input_adr1 = 0 ;  input_adr2 = 1 ;  write_adr = 0 ; data = 0 ; valid = 3'b010;
        #20
        input_adr1 = 2 ;  input_adr2 = 3 ;  write_adr = 0 ; data = 0 ; valid = 3'b010;
        #20
        input_adr1 = 4 ;  input_adr2 = 5 ;  write_adr = 0 ; data = 0 ; valid = 3'b010;
        #20
        input_adr1 = 4 ;  input_adr2 = 5 ;  write_adr = 0 ; valid = 3'b101;
        #200
        input_adr1 = 0 ;  input_adr2 = 1 ;  write_adr = 0 ; data = 0 ; valid = 3'b010;
        #20
        input_adr1 = 0 ;  input_adr2 = 1 ;  write_adr = 1 ; data = 5 ; valid = 3'b111;
        #200
        input_adr1 = 0 ;  input_adr2 = 1 ;  write_adr = 0 ; data = 0 ; valid = 3'b010;
        #30
        $finish;
    end*/

    initial begin
        #4
        instruction = 3'b000; write_adr = 1 ;  data = 17 ; 
        #20
        instruction = 3'b011;input_adr1 = 1 ;  write_adr = 2 ;  data = -9 ; 
        #20
        instruction = 3'b100;input_adr1 = 1 ;  input_adr2 = 2 ;  write_adr = 3 ; data = 65 ; 
        #20
        instruction = 3'b010;input_adr1 = 2 ;  input_adr2 = 3 ;
        #20
        instruction = 3'b111;input_adr1 = 3 ;   write_adr = 5 ; data = 3 ; 
        #200
        instruction = 3'b101;input_adr1 = 1 ;  input_adr2 = 2 ;  write_adr = 4 ; 
        #200
        instruction = 3'b111;input_adr1 = 4 ;   write_adr = 4 ; data = 9 ; 
        #200
        instruction = 3'b110;input_adr1 = 5 ;  input_adr2 = 4 ;  write_adr = 6; 
        #200
        instruction = 3'b001;input_adr1 = 6 ; 

    end
    
endmodule