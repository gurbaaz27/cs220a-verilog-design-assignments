module encoder8to3( en_in , en_out);
    input [7:0] en_in;
    output wire [2:0] en_out;
    assign en_out[0] =  en_in[7] | en_in[5] |  en_in[3] |  en_in[1] ;
    assign en_out[1] =  en_in[7] | en_in[6] |  en_in[3] |  en_in[2] ;
    assign en_out[2] =  en_in[7] | en_in[6] |  en_in[5] |  en_in[4] ;
endmodule