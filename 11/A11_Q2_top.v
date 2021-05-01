module top;

    reg clk;
    reg [31:0] dividend;
    reg [31:0] divisor;
    wire [31:0] quotient;
    wire [5:0] total_add_ops;
    wire [5:0] total_sub_ops;
    reg [4:0] m;
    reg [4:0] n;
    wire done;
    reg abit;
    wire signed [31:0] rem;
    
    
    mod M(clk, dividend, divisor,m,n, quotient, total_add_ops, total_sub_ops, done,abit,rem);
    always @ ( negedge clk ) begin
        if (done == 1) begin
            $display("     time=%g: dividend = %d, divisor= %d, quotient= %d, reminder= %d |||||| +: %d, -: %d",$time,dividend,divisor,quotient , rem,total_add_ops,total_sub_ops);   
            abit <= #2 1; dividend = 153  ; divisor = 10 ; m = 8 ; n =4;
        end
        
    end
     always @(negedge clk)begin
        abit <= 0;
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
         #1
      abit <= #2 1; dividend = 32  ; divisor = 4 ; m = 6 ; n =3;
       #500
       $finish;

     end 


endmodule