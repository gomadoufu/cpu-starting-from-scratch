module problem5_tb;
    reg [15:0] i_data_0 = 16'h00;
    reg [15:0] i_data_1 = 16'h00;
    reg [15:0] i_data_2 = 16'h00;
    reg [15:0] i_data_3 = 16'h00;
    reg [1:0] i_ctrl = 0;
    reg i_clk = 0;
    wire [15:0] o_data;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, DUT);
    end

    problem5 DUT(
                 .i_data_0(i_data_0),
                 .i_data_1(i_data_1),
                 .i_data_2(i_data_2),
                 .i_data_3(i_data_3),
                 .i_ctrl(i_ctrl),
                 .i_clk(i_clk),
                 .o_data(o_data)
             );

    always #1 begin
        i_clk <= ~i_clk;
    end

    initial begin
        i_data_0 = 16'h0a;
        i_data_1 = 16'h0b;
        i_data_2 = 16'h0c;
        i_data_3 = 16'h0d;
        i_ctrl = 2'd0;
        #2
         $display("o_data = %04x", o_data);
        i_data_0 = 16'h0a;
        i_data_1 = 16'h0b;
        i_data_2 = 16'h0c;
        i_data_3 = 16'h0d;
        i_ctrl = 2'd1;
        #2
         $display("o_data = %04x", o_data);
        i_data_0 = 16'h0a;
        i_data_1 = 16'h0b;
        i_data_2 = 16'h0c;
        i_data_3 = 16'h0d;
        i_ctrl = 2'd2;
        #2
         $display("o_data = %04x", o_data);
        i_data_0 = 16'h0a;
        i_data_1 = 16'h0b;
        i_data_2 = 16'h0c;
        i_data_3 = 16'h0d;
        i_ctrl = 2'd3;
        #2
         $display("o_data = %04x", o_data);

        $finish;
    end
endmodule
