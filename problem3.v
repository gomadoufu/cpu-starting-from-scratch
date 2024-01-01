module problem3(i_p0, i_p1, o_p);
    input [15:0] i_p0;
    input [15:0] i_p1;
    output [15:0] o_p;

    wire [15:0] w_p;

    assign w_p = ~i_p0;
    assign o_p = w_p & i_p1;
endmodule
