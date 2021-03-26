module decoder(clk, memory, R_counter, I_counter, J_counter, reg_3_counter, reg_4_counter, reg_5_counter, reg_6_counter);

    input [31:0] memory;
    input clk;

    output reg [2:0] R_counter;
    output reg [2:0] I_counter;
    output reg [2:0] J_counter;

    output reg [2:0] reg_3_counter;
    output reg [2:0] reg_4_counter;
    output reg [2:0] reg_5_counter;
    output reg [2:0] reg_6_counter; 

    initial begin
        R_counter = 0;
        I_counter = 0;
        J_counter = 0;
        
        reg_3_counter = 0;
        reg_4_counter = 0;
        reg_5_counter = 0;
        reg_6_counter = 0;
    end

    always @(posedge clk) begin
        if(memory[31:26] == 6'b0) begin
            R_counter <= R_counter + 1;
            case(memory[15:11])
                3: reg_3_counter <= reg_3_counter + 1;
                4: reg_4_counter <= reg_4_counter + 1;
                5: reg_5_counter <= reg_5_counter + 1;
                6: reg_6_counter <= reg_6_counter + 1;
            endcase
        end
        else if (memory[31:26] == 6'h2 || memory[31:26] == 6'h3) begin
            J_counter <= J_counter + 1;
        end
        else begin
            I_counter <= I_counter + 1;
            case(memory[20:16])
                3: reg_3_counter <= reg_3_counter + 1;
                4: reg_4_counter <= reg_4_counter + 1;
                5: reg_5_counter <= reg_5_counter + 1;
                6: reg_6_counter <= reg_6_counter + 1;
            endcase
        end
    end

endmodule