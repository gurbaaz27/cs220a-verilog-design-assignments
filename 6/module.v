`define TICK #2 
module registerfile(clk,read_adr1 ,read_adr2, write_adr ,data , read1_valid, read2_valid , write_valid ,read1 , read2 );

    input clk;
    input [4:0]read_adr1;
    input [4:0]read_adr2;
    input [4:0]write_adr;
    input signed [15:0]data;
    input  read1_valid;
    input read2_valid;
    input write_valid;

    reg signed [15:0] regfile [31:0];
    output signed [15:0] read1;
    output signed [15:0] read2;
    reg signed [15:0] read1;
    reg signed [15:0] read2;


    reg [5:0] i;

    initial begin
          for (i = 0; i < 32; i = i + 1) begin
            regfile [i] = 0; 
          end 
         // for (i = 0; i < 32; i = i + 1) begin
         //    $display("val=%d",regfile[i]);
         // end 
    end


    always @(posedge clk) begin
       //$display("read1=%d , read2=%d",regfile[read_adr1], regfile[read_adr2]);
      // $display("%d ,%d , %d , %d, %d , %d ",read1_valid, read2_valid,write_valid , read_adr1 ,read_adr2 ,write_adr );
        if(read1_valid == 1'b1) begin
            read1 <=   regfile[read_adr1] ; 
        end

        if(read2_valid == 1'b1) begin
            read2 <=    regfile[read_adr2]  ;
        end
        
        if(write_valid == 1'b1) begin
            regfile[write_adr] <= `TICK data;
        end
        
    //$monitor ("[$monitor] time=%d , %d , %d ", $time, read1, read2);
    
    end

    always @(read1 or read2) begin  
         //   $display("<<%d>> ,read1=%d , read2=%d", $time,read1,read2 );
    end


    


endmodule