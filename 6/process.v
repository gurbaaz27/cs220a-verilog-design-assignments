module process(clk,valid,read_adr1 ,read_adr2, write_adr ,data,done  ,read1, read2  );

    input [2:0] valid;
    input [4:0] read_adr1;
    input [4:0] read_adr2;
    input [4:0] write_adr;
    input [15:0] data;
    input clk;
    reg  read1_valid ;
    reg  read2_valid ;
    reg  write_valid ;
    output [15:0] read1;
    output [15:0] read2;
    wire [15:0] read1;
    wire [15:0] read2;
    reg [5:0] counter=1;

    wire [15:0] read1_from_reg;
    wire [15:0] read2_from_reg;

    output done;
    reg done;

    initial begin
        read1_valid <=0;
        read2_valid <=0;
        write_valid <=0;
    end

    registerfile M(clk,read_adr1 ,read_adr2, write_adr ,data , read1_valid, read2_valid , write_valid , read1_from_reg, read2_from_reg);
  

    always @(counter or valid )
    begin
        $display("time =%d counter = %d , valid = %b , ",$time,counter, valid);
        if(counter == 0) begin
           
        
            case (valid)
                3'b000 : begin
                    counter <= 2;
                    read1_valid <=0; read2_valid <=0;  write_valid <= 1;
                end
                3'b001 : begin
                    counter <= 2;
                    read1_valid <=1; read2_valid <=0;  write_valid <= 0;
                end
                3'b010 : begin
                    counter <= 2;
                    read1_valid <=1; read2_valid <=1;  write_valid <= 0;
                end
                3'b011 : begin
                    counter <= 2;
                    read1_valid <=1; read2_valid <=0;  write_valid <= 1;
                end
                3'b100 : begin
                    counter <= 2;
                    read1_valid <=1; read2_valid <=1;  write_valid <= 1;
                end
                3'b101 : begin
                
                end
                3'b110 : begin
                
                end
                3'b111 : begin
                
                end
            endcase
        end
        if(counter == 0) begin
            done <= `TICK 1;
        end
    end

    always @(posedge clk) begin
        done = 0;
        counter <= counter - 1;
    end

    assign  read1 = read1_from_reg;
    assign  read2 = read2_from_reg;

endmodule