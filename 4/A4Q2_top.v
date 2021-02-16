module top;
    reg clk;
    reg [4:0]x;
    reg [4:0]y;
    reg [1:0]steps;
    reg [1:0]dir;
    wire [4:0]fx;
    wire [4:0]fy;
    reg [4:0]outputx;
    reg [4:0]outputy;

    dir d(x, y, steps, dir, fx, fy ,clk);
    always @ ( negedge clk ) begin

        if ($time > 0) begin
            $display("time=%d: (x,y) = %d %d, (fx,fy) = %d %d , steps =%d , dir=%d",$time,x,y,outputx,outputy,steps,dir);
        end
    x = outputx;
    y = outputy;
    end

   always @(fx or fy) begin
        if(fx[4]==1) begin
        if(dir == 0) begin
           outputx <= 15;
        end else begin
           outputx <= 0;
        end
    end else begin 
        outputx <= fx;
    end


    if(fy[4]==1) begin  
        if(dir == 2) begin
             outputy <= 15;
        end else begin
            outputy <= 0;
        end
    end else begin 
        outputy <= fy;
    end
   end
   
    initial
        begin
        x <= 5'b00000; y <= 5'b00000;
        #150
        $finish;
        end

    initial begin
        forever begin
         clk = 0;
         #5        
         clk = 1;
         #5        
         clk = 0;
        end
    end

    initial
        begin
         #3
         steps = 0; dir = 0;
         #10
         steps = 2; dir = 0;
         #10
         steps = 3; dir = 0;
         #10
         steps = 3; dir = 0;
         #10
         steps = 3; dir = 0;
         #10
         steps = 3; dir = 0;
         #10
         steps = 3; dir = 0;
         #10
         steps = 3; dir = 0;
         #10
         steps = 3; dir = 1;
         #10
         steps = 2; dir = 2;
         #10
         steps = 3; dir = 3; 
         #10
         steps = 3; dir = 1;

        end

endmodule