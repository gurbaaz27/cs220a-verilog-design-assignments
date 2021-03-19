`define TICK #2 
module top;

    reg clk;
    reg [4:0] input_adr1;
    reg [4:0] input_adr2;
    reg [4:0] write_adr;
    reg read1_valid;
    reg read2_valid;
    reg write_valid;
    reg [2:0] valid;
    wire [15:0] read1;
    wire [15:0] read2;   
    reg [15:0] data;


    process P(clk,valid,input_adr1 ,input_adr2, write_adr ,data,done ,read1, read2  );

    always @(posedge done)
    begin
         $display("time=%d: read_adr1 = %d, read1 = %d ------ read_adr2 => %d , read2 => %d",$time , input_adr1 , read1 ,  input_adr2 , read2);
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

    initial begin
        #5
        input_adr1 = 0 ;  input_adr2 = 1 ;  write_adr = 0 ; data = 1 ; valid = 3'b100;
        #20
        input_adr1 = 0 ;  input_adr2 = 1 ;  write_adr = 1 ; data = 2 ; valid = 3'b100;
        #20
        input_adr1 = 2 ;  input_adr2 = 1 ;  write_adr = 2 ; data = 3 ; valid = 3'b100;
        #20
        input_adr1 = 2 ;  input_adr2 = 3 ;  write_adr = 3 ; data = 4 ; valid = 3'b100;
        #20
        input_adr1 = 3 ;  input_adr2 = 4 ;  write_adr = 4 ; data = 5 ; valid = 3'b100;
        #20
        input_adr1 = 4 ;  input_adr2 = 5 ;  write_adr = 0 ; data = 6 ; valid = 3'b100;
        #20
        input_adr1 = 0 ;  input_adr2 = 1 ;  write_adr = 0 ; data = 0 ; valid = 3'b100;
        #20
        $finish;
    end
    
endmodule