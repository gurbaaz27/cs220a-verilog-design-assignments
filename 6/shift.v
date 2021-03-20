module shift(num, shift_amt,out);
        input [15:0]num;
        input [15:0]shift_amt;
        output wire [15:0]out;

        assign out = num << shift_amt;
endmodule