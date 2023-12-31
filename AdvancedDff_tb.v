module AdvancedDff_tb;


    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, AD);
    end

    reg i_clk = 1'b0;
    reg i_data = 1'b0;
    reg i_en = 1'b0;
    wire o_data;

    always #1 begin
        i_clk <= ~i_clk;
    end

    AdvancedDff AD(.i_clk(i_clk), .i_data(i_data), .i_en(i_en), .o_data(o_data));

    initial begin
        // 初期状態
        i_data  = 1'b0;
        i_en    = 1'b0;
        #2
         // データ入力
         i_data  = 1'b1;
        i_en    = 1'b0;
        #6
         // 書き込みを有効化
         i_data  = 1'b1;
        i_en    = 1'b1;
        #2
         // 書き込みを無効化
         i_data  = 1'b1;
        i_en    = 1'b0;
        #4
         // データ0に
         i_data  = 1'b0;
        i_en    = 1'b0;
        #4
         $finish;
    end

endmodule
