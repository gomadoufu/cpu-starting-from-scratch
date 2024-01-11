module Z16InstrMemory(i_addr, o_instr);
    input wire [15:0] i_addr;
    output wire [15:0] o_instr;

    // 命令メモリ: 命令長5
    wire [15:0] mem[4:0];

    assign o_instr = mem[i_addr[15:1]];

    // 命令書き込み
    assign mem[0] = 16'h004B; // STORE ZR ZR 4
    assign mem[1] = 16'h405A; // LOAD 4 ZR G1
    assign mem[2] = 16'h0000;
    assign mem[3] = 16'h0000;
    assign mem[4] = 16'h0000;
endmodule
