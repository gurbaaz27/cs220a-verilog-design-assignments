module compute_index (in1, in2, in3, in4, idx);

	input [2:0] in1;
    input [2:0] in2;
    input [2:0] in3;
    input [2:0] in4;
    output wire [1:0] idx;

    wire [2:0] min1;
    wire [2:0] min2;
    wire [2:0] min;

    compare COMPARE1(in1, in2, min1);
    compare COMPARE2(in3, in4, min2);
    compare COMPARE3(min1, min2, min);

    assign idx = (min == in1) ? 0 :
                 (min == in2) ? 1 :
                 (min == in3) ? 2 : 3;

endmodule