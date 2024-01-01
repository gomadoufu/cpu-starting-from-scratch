module problem6(i_data, i_rst, i_clk, o_data);
    input [15:0] i_data;
    input i_rst;
    input i_clk;
    output reg [2:0] o_data;

    always @(posedge i_clk) begin
        if(i_rst) begin
            o_data <= 3'b000;
        end else begin
            case(i_data[1:0])
                2'b00 : o_data <= i_data[4:2];
                2'b01 : o_data <= i_data[7:5];
                2'b10 : o_data <= i_data[10:8];
                2'b11 : o_data <= i_data[13:11];
            endcase
        end
    end
endmodule
