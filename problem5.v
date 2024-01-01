module problem5(i_data_0, i_data_1, i_data_2, i_data_3, i_ctrl, i_clk, o_data);
    input [15:0] i_data_0;
    input [15:0] i_data_1;
    input [15:0] i_data_2;
    input [15:0] i_data_3;
    input [1:0] i_ctrl;
    input i_clk;
    output reg [15:0] o_data;

    always @(posedge i_clk) begin
        case(i_ctrl)
            2'b01: o_data <= i_data_1;
            2'b10: o_data <= i_data_2;
            2'b11: o_data <= i_data_3;
            default: o_data <= i_data_0;
        endcase
    end

endmodule;
