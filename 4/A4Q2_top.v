module top;

    reg clk;
    reg [1:0] Direction;
    reg [1:0] Steps;
    reg [4:0] X;
    reg [4:0] Y;
    wire [4:0] FX;
    wire [4:0] FY;
    reg [4:0] OutputX;
    reg [4:0] OutputY;

    compute_coordinates COMPUTE_COORDINATES (clk, Direction, Steps, X, Y, FX, FY);

    always @ ( negedge clk ) begin
        if($time > 0) begin
            $display("time=%g: dir = %d, steps = %d, old:(%d,%d), new:(%d,%d)",$time,Direction,Steps,X,Y,OutputX,OutputY);
        end
        X = OutputX;
        Y = OutputY;
    end
    
    always @( FX or FY ) begin
        if(FX[4] == 1) begin
            if(Direction == 0) begin
                OutputX <= 15;
            end 
            else begin
                OutputX <= 0;
            end
        end 
        else begin 
            OutputX <= FX;
        end

        if(FY[4] == 1) begin
            if(Direction == 2) begin
                OutputY <= 15;
            end 
            else begin
                OutputY <= 0;
            end
            end 
        else begin 
            OutputY <= FY;
        end
    end

    initial begin
        X <= 0; 
        Y <= 0;
    end

    initial begin
        $display("Direction =>\n\t0 : East\n\t1 : West\n\t2 : North\n\t3 : South\nSteps = {0,1,2,3}\nX = {0,....,15}(horizontal i.e. W-E)\nY = {0,....,15} (vertical i.e. N-S)");
        #110
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

    initial begin
         #3
         Direction = 0; Steps = 3;
         #10         
         Direction = 0; Steps = 3;
         #10
         Direction = 0; Steps = 2;
         #10
         Direction = 2; Steps = 2;
         #10
         Direction = 0; Steps = 1;
         #10
         Direction = 1; Steps = 2;
         #10         
         Direction = 3; Steps = 1;
         #10
         Direction = 3; Steps = 2;
         #10
         Direction = 1; Steps = 2;
         #10         
         Direction = 0; Steps = 1;         
    end

endmodule
