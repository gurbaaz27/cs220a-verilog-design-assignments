module mod (clk, dividend, divisor,m,n, quotient, total_add_ops, total_sub_ops, done,abit,rem);
    input clk;
    input [31:0] dividend;
    input [31:0] divisor;
    input abit;
    input [4:0] m;
    input [4:0] n;

    output reg [31:0] quotient;
    output reg [5:0] total_add_ops;
    output reg[5:0] total_sub_ops;
    output reg done;

    output reg signed [31:0] rem;
    reg signed [31:0] div;
    reg [5:0] counter;
   


    initial begin
        counter <= 0;
        done <=0;
    end


   


   


    always @(posedge clk) begin
       
        done = 0;
        if(abit == 1)begin
            $display("%g",$time);
            quotient = 0;
            rem = dividend;
            div = divisor;
            total_add_ops = 0;
            total_sub_ops = 0;
            counter = 0;
        end
         $display("time=%g: dividend = %d, divisor= %d, quotient= %d, reminder= %d |||||| +: %d, -: %d",$time,dividend,div,quotient , rem,total_add_ops,total_sub_ops);   
        if(counter == 0)begin
            div = div << (m-n);
        end
        else begin

            if(rem < 0 )begin
                rem = rem + div;
                total_add_ops = total_add_ops + 1;
                quotient  =  quotient ^ 1;
            end
            else begin
                   rem = rem - div ;
                   total_sub_ops = total_sub_ops + 1 ;
            end
            quotient = (quotient << 1) | 1;
            div  = div >>1;
           
        end
        counter  <= #2 counter +1 ;
        
        if(counter == m-n+1 )begin
            if(rem < 0)begin
                
                rem = rem + divisor;
                quotient  =  quotient ^ 1;
            end
            done <= #2 1;
        end
    
    end


endmodule