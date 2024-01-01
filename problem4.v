module problem4(i_rst, i_clk, o_p);
    input i_clk;
    input i_rst;
    output reg [15:0] o_p;

    parameter HEX_ONE = 16'h0001;
    parameter HEX_ZERO = 16'h0000;

    always @(posedge i_clk) begin
        o_p <= i_rst ? HEX_ZERO : o_p + HEX_ONE;
    end
endmodule
