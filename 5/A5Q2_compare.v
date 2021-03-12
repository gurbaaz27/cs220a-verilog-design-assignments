module compare (a, b, min);

	input [2:0] a;
    input [2:0] b;
    output wire [2:0] min;

    assign min = (a > b) ? b : a;

endmodule