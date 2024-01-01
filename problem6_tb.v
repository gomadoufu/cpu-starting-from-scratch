module problem6_tb;
    reg [15:0] i_data;
    reg i_rst;
    reg i_clk;
    wire [2:0] o_data;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, DUT);
    end

    problem6 DUT(
                 .i_data(i_data),
                 .i_rst(i_rst),
                 .i_clk(i_clk),
                 .o_data(o_data)
             );

    always #1 begin
        i_clk <= ~i_clk;
    end

    initial begin
        i_data = 0;
        i_rst = 1;
        #10;
        i_rst = 1'b0;
        i_data = 16'b1010101010101010;
        #2
         $display("Time: %t, i_data: %b, o_data: %b", $time, i_data, o_data);
        i_data = 16'b0101010101010101;
        #2
         $display("Time: %t, i_data: %b, o_data: %b", $time, i_data, o_data);
        $finish;
    end
endmodule
