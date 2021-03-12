`define TICK #2
module fsm (y, clk, state);

	input [1:0] y;
	input clk;
	output reg [3:0] state;

	reg [2:0] dispatchROM1 [2:0]; 
	reg [3:0] dispatchROM2 [1:0]; 
	reg [2:0] microcodeROM [12:0];

	initial begin
		state = 0;

		dispatchROM1[0] = 4;
		dispatchROM1[1] = 5;	
		dispatchROM1[2] = 6;

		dispatchROM2[0] = 11;
		dispatchROM2[1] = 12;

		microcodeROM[0] = 0;
		microcodeROM[1] = 0;
		microcodeROM[2] = 0;
		microcodeROM[3] = 1;
		microcodeROM[4] = 2;
		microcodeROM[5] = 2;
		microcodeROM[6] = 0;
		microcodeROM[7] = 0;
		microcodeROM[8] = 0;
		microcodeROM[9] = 0;
		microcodeROM[10] = 3;
		microcodeROM[11] = 4;
		microcodeROM[12] = 4;
	end
               
	always @(posedge clk) begin 
		case (microcodeROM[state])
			0: state <= `TICK state + 1;
			1: begin
				case (y)
					2'b00: state <= `TICK dispatchROM1[0];
					2'b01: state <= `TICK dispatchROM1[1];
					default: state <= `TICK dispatchROM1[2];					 
				endcase
			end 
			2: state <= `TICK 7;
			3: begin
				case (y)
					2'b00: state <= `TICK dispatchROM2[0];
					default: state <= `TICK dispatchROM2[1];					 
				endcase
			end
			4: state <= `TICK 0;
		endcase
    end

endmodule