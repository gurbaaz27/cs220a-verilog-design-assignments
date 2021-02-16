module dir (x, y, steps, dir, fx, fy ,clk);

   input [4:0] x;
   input [4:0] y;
   input [1:0] steps;
   input [1:0] dir;
   input clk;

   output [4:0] fx;
   wire [4:0] fx;
   output [4:0] fy;
   wire [4:0] fy;

    
   reg [1:0] addx;
   reg [1:0] addy;
   reg dirx;
   reg diry;
   

   five_bit Fx (x, addx, dirx , dirx, fx);
   five_bit Fy (y, addy, diry,  diry, fy);

   always @(posedge clk)
    begin 
         //$display("%d %d %d %d %d ",x, addx, dirx , dirx, fx)
		case(dir)
            2'b00 : begin
                dirx <= 0;
                diry <= 0;
                addx <= steps;
                addy <= 0; 
            end
            2'b01 : begin
                dirx <= 1;
                diry <= 0;
                addx <= steps;
                addy <= 0;
            end
            2'b10 : begin
                dirx <= 0;
                diry <= 0;
                addx <= 0;
                addy <= steps; 
            end
            2'b11 : begin
                dirx <= 0;
                diry <= 1;
                addx <= 0;
                addy <= steps; 
            end
        endcase
   end
  
  /**always @(fx or fy)
    begin
         $display("%d , %d" ,fx,fy );
    end*/
   // assign fx = (fx[4]==1)  ? ((dirx == 1'b0)? 15:0)  : fx;
  // assign fy = (fy[4]==1)  ? ((diry == 1'b0)? 15:0)  : fy;


endmodule