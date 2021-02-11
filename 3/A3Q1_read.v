`define TICK #2 
module read(clk, row_num ,input_valid, output_valid,out);
    input [3:0] row_num;
    input input_valid;
    input clk;

    reg [31:0] bank [15:0];
    output [31:0] out;
    output output_valid ;
    reg  [31:0] out;
    reg output_valid ;
    reg [4:0]open_row = 16 ;
    reg [1:0]counter = 3;

    initial begin
        output_valid=0;
        bank[0] = 0;
        bank[1] = 1;
        bank[2] = 2;
        bank[3] = 3;
        bank[4] = 4;
        bank[5] = 5;
        bank[6] = 6;
        bank[7] = 7;
        bank[8] = 8;
        bank[9] = 9;
        bank[10] = 10;
        bank[11] = 11;
        bank[12] = 12;
        bank[13] = 13;
        bank[14] = 14;
        bank[15] = 15;
    end 

    always @(posedge clk) begin
        output_valid <=  0;

        if(input_valid == 1) begin
            if(open_row == row_num) begin
                counter = 2;
            end
            else if (open_row == 16) begin
                counter = 1;
            end else begin
                counter = 0;   
            end
            open_row <= `TICK row_num;
        end
    
        if(counter < 3)begin 
            counter <= `TICK counter + 1;
            if(counter == 2)begin
               output_valid <= `TICK 1'b1;
               out <= `TICK  bank[open_row];
            end

        end
    end

endmodule