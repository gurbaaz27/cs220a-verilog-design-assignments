module decoder3to8(de_in,de_out);
    input [2:0] de_in;
    output wire [7:0] de_out;

    assign de_out[0] = ~de_in[2] & ~de_in[1] & ~de_in[0];
    assign de_out[1] = ~de_in[2] & ~de_in[1] &  de_in[0];
    assign de_out[2] = ~de_in[2] &  de_in[1] & ~de_in[0];
    assign de_out[3] = ~de_in[2] &  de_in[1] & ~de_in[0];
    assign de_out[4] =  de_in[2] & ~de_in[1] & ~de_in[0];
    assign de_out[5] =  de_in[2] & ~de_in[1] &  de_in[0];
    assign de_out[6] =  de_in[2] &  de_in[1] & ~de_in[0];
    assign de_out[7] =  de_in[2] &  de_in[1] &  de_in[0];
endmodule