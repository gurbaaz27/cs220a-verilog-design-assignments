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
    reg new_bit;
    wire signed [31:0] rem;
    reg [31:0] dividend_mem [0:9];
    reg [31:0] divisor_mem [0:9];
    reg [4:0] m_mem [0:9];
    reg [4:0] n_mem [0:9];
    reg [3:0] counter;
    
    mod M(clk, dividend, divisor,m,n, quotient, total_add_ops, total_sub_ops, done,new_bit,rem);
    always @ ( negedge clk ) begin
        if (done == 1) begin
            $display("time=%g: dividend = %d, divisor= %d, quotient= %d, reminder= %d \t +: %d, -: %d",$time,dividend,divisor,quotient , rem,total_add_ops,total_sub_ops);   
            new_bit <= #2 1; 
            counter = counter+1;
            if(counter < 10) begin
                dividend = dividend_mem[counter]  ; divisor = divisor_mem[counter] ; m =  m_mem[counter] ; n =n_mem[counter];
            end else begin
                $finish;
            end            
        end
    end
    
    always @(negedge clk)begin
        new_bit <= 0;
    end

    initial begin
        counter = 0;
        new_bit <= #2 1;
        dividend_mem[0] =  153  ; divisor_mem[0] = 10;  m_mem[0] = 8 ; n_mem[0] =4;
        dividend_mem[1] =  70  ; divisor_mem[1] = 10;  m_mem[1] = 7 ; n_mem[1] =4;
        dividend_mem[2] =  1  ; divisor_mem[2] = 1;  m_mem[2] = 1 ; n_mem[2] =1;
        dividend_mem[3] =  128  ; divisor_mem[3] = 2;  m_mem[3] = 8 ; n_mem[3] =2;
        dividend_mem[4] =  32  ; divisor_mem[4] = 4;  m_mem[4] = 6 ; n_mem[4] =3;
        dividend_mem[5] =  11  ; divisor_mem[5] = 4;  m_mem[5] = 4 ; n_mem[5] =3;
        dividend_mem[6] =  77  ; divisor_mem[6] = 11;  m_mem[6] = 7 ; n_mem[6] =4;
        dividend_mem[7] =  153  ; divisor_mem[7] = 15;  m_mem[7] = 8 ; n_mem[7] =4;
        dividend_mem[8] =  203  ; divisor_mem[8] = 13;  m_mem[8] = 8 ; n_mem[8] =4;
        dividend_mem[9] =  150  ; divisor_mem[9] = 9;  m_mem[9] = 8 ; n_mem[9] =4;

        dividend = dividend_mem[counter]  ; divisor = divisor_mem[counter] ; m =  m_mem[counter] ; n =n_mem[counter];
    end

    initial begin
        $display("CS220: Assignment#11 Group#9 Q2\n-------------------------------");
        forever begin
            clk = 0;
            #5
            clk = 1;
            #5
            clk = 0;
        end
    end
     
endmodule