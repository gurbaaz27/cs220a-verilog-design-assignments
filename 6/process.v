module process(clk,valid,read_adr1 ,read_adr2, write_adr ,data,done  ,read1, read2   );

    input [2:0] valid;
    input [4:0] read_adr1;
    input [4:0] read_adr2;
    input [4:0] write_adr;
    input signed [15:0] data;
    reg signed [15:0] reg_input_data;
    input clk;
    reg  read1_valid ;
    reg  read2_valid ;
    reg  write_valid ;
    //reg signed [15:0] input_data;
    //reg  adder_valid ;
    output signed [15:0] read1;
    output signed [15:0] read2;
    //output signed [15:0] write_out;
    wire signed [15:0] shift_output;
    wire signed [15:0] read1;
    wire signed [15:0] read2;
    reg [5:0] counter=1;

    reg signed [15:0] x_to_adder;
    reg signed [15:0] y_to_adder;
    reg signed [15:0] num_to_shift;
    reg signed [15:0] shift_amt;

    wire signed [15:0] read1_from_reg;
    wire signed [15:0] read2_from_reg;
    wire signed [15:0] res;
    wire carry_out;
    reg opcode;
    output done;
    reg done;

    initial begin
        read1_valid <=0;
        read2_valid <=0;
        write_valid <=0;
    end

    registerfile M(clk , read_adr1 , read_adr2 , write_adr , reg_input_data , read1_valid, read2_valid , write_valid , read1_from_reg, read2_from_reg);
    full_adder A(x_to_adder, y_to_adder , opcode , res, carry_out);
    shift S(num_to_shift , data , shift_output);

    always @( valid or read_adr1 or read_adr2 or  write_adr or data)
    begin
       // $display("time =%d counter = %d , valid = %b , ",$time ,counter, valid);
       // if(counter == 1) begin
            case (valid)
                3'b000 : begin
                    counter <=  2;
                    reg_input_data <= data;
                    read1_valid <=  0; read2_valid <= 0;  write_valid <= 1; 
                end
                3'b001 : begin
                    counter <= 2;
                    read1_valid <=1; read2_valid <=0;  write_valid <= 0;
                end
                3'b010 : begin
                    counter <=   2;
                    read1_valid <=   1; read2_valid <=   1;  write_valid <=  0;
                end
                3'b011 : begin
                    counter <= 2;
                    reg_input_data <= data;
                    read1_valid <=1; read2_valid <=0;  write_valid <= 1; 
                end
                3'b100 : begin
                    counter <= 2;
                    reg_input_data <=  data;
                    read1_valid <=  1; read2_valid <= 1;  write_valid <=   1; 
                end
                3'b101 : begin
                    counter <= 20; 
                    read1_valid <=1; read2_valid <=1;  write_valid <= 0;
                end
                3'b110 : begin
                    counter <= 20; 
                    read1_valid <=1; read2_valid <=1;  write_valid <= 0;
                end
                3'b111 : begin
                    counter <= 20; 
                    read1_valid <=1; read2_valid <=0;  write_valid <= 0;
                end
            endcase
    end

    always @(posedge clk) begin
        done <= 0;
        counter <=  counter - 1;
    end

    always @(counter)begin
        if(counter == 0) begin
            done <= #8 1;
        end
         if(counter == 17) begin
            if(valid == 3'b101 )begin
                opcode <= 0; x_to_adder <= read1_from_reg ; y_to_adder <= read2_from_reg ;
            end
            if(valid == 3'b110 )begin
                opcode <= 1; x_to_adder <= read1_from_reg ; y_to_adder <= read2_from_reg ;
            end
            if(valid == 3'b111 )begin
                num_to_shift <= read1_from_reg ; 
            end
        end
        if(counter == 1)begin
            if(valid == 3'b101 || valid == 3'b110  )begin
                reg_input_data <= res ;
                read1_valid <=0; read2_valid <=0;  write_valid <= 1;
            end
            if(valid == 3'b111 )begin
                reg_input_data <= shift_output ;
                read1_valid <=0; read2_valid <=0;  write_valid <= 1;
            end
        end
    end

   // assign write_out = res;
    assign  read1 = (valid == 3'b101 || valid == 3'b110)? res: read1_from_reg;
    assign  read2 = (valid == 3'b111)? shift_output : read2_from_reg;

endmodule