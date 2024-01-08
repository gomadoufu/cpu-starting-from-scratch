module Z16ALU(i_data_a, i_data_b, i_ctrl, o_data);
    input wire [15:0] i_data_a; // データ入力1
    input wire [15:0] i_data_b; // データ入力2
    input wire [3:0] i_ctrl; // 制御信号入力
    output wire [15:0] o_data; // データ出力

    assign o_data = alu(i_data_a, i_data_b, i_ctrl);

    function [15:0] alu;
        input [15:0]    i_data_a;
        input [15:0]    i_data_b;
        input [3:0]     i_ctrl;

        begin
            case(i_ctrl)
                4'h0 : alu  = i_data_b + i_data_a;
                4'h1 : alu  = i_data_b - i_data_a;
                4'h2 : alu  = i_data_b * i_data_a;
                4'h3 : alu  = i_data_b / i_data_a;
                4'h4 : alu  = i_data_b | i_data_a;
                4'h5 : alu  = i_data_b & i_data_a;
                4'h6 : alu  = i_data_b ^ i_data_a;
                4'h7 : alu  = i_data_a << i_data_a;
                4'h8 : alu  = i_data_a >> i_data_a;
                // 演算命令以外はアドレス操作なので、加算で対応
                default: alu = i_data_b + i_data_a;
            endcase
        end
    endfunction

endmodule
