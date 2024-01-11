module Z16Decoder(
        input wire [15:0] i_instr, // 命令入力
        output wire [3:0] o_opcode, // オペコード出力
        output wire [3:0] o_rd_addr, // RDアドレス出力
        output wire [3:0] o_rs1_addr, // RS1アドレス出力
        output wire [3:0] o_rs2_addr, // RS2アドレス出力
        output wire [15:0] o_imm, // 即値出力
        output wire o_rd_wen, // レジスタ書き込み有効化
        output wire o_mem_wen, // メモリ書き込み有効化
        output wire [3:0] o_alu_ctrl // ALU演算制御信号
    );

    assign o_opcode = i_instr[3:0];
    assign o_rd_addr = i_instr[7:4];
    assign o_rs1_addr = i_instr[11:8];
    assign o_rs2_addr = i_instr[15:12];
    assign o_imm = get_imm(i_instr);
    assign o_rd_wen = get_rd_wen(i_instr);
    assign o_mem_wen = get_mem_wen(i_instr);
    assign o_alu_ctrl = get_alu_ctrl(i_instr);

    // 符号拡張
    function [15:0] get_imm;
        input [15:0] i_instr;
        begin
            case(i_instr[3:0])
                4'hA : get_imm = {{12{i_instr[15]}}, i_instr[15:12]};
                4'hB : get_imm = {{12{i_instr[7]}}, i_instr[7:4]};
                default : get_imm = 16'h0000;
            endcase
        end
    endfunction

    function get_rd_wen;
        input [15:0] i_instr;
        begin
            if(4'hA == i_instr[3:0]) begin
                get_rd_wen    = 1'b1;
            end else begin
                get_rd_wen    = 1'b0;
            end
        end
    endfunction

    function get_mem_wen;
        input [15:0] i_instr;
        begin
            // STORE命令の場合にのみ1
            if(4'hB == i_instr[3:0]) begin
                get_mem_wen = 1'b1;
            end else begin
                get_mem_wen = 1'b0;
            end
        end
    endfunction

    function [3:0] get_alu_ctrl;
        input [15:0] i_instr;
        begin
            get_alu_ctrl = 4'h0;
        end
    endfunction
endmodule
