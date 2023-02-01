`timescale 10ns/10ns
module top(
    input rst,
    input clk,
    input [3:0] m,
    input [3:0] n,
    output reg out
    );
    reg [7:0] count_1;
    reg [7:0] count_2;
    wire [7:0] m_m;
    wire [7:0] n_n;
    assign m_m = m + (m << 2);
    assign n_n = n + (n << 2);
    always @(posedge clk) begin
        if(rst) begin
            count_1 <= 0;
            count_2 <= 0;
        end
        else begin
            if(count_1 < m_m) begin
                out <= 1;
                count_1 <= count_1 + 1;
            end
            else if(count_1 == m_m && count_2 < n_n) begin
                out <= 0;
                count_2 <= count_2 + 1;
            end
            else begin
                out <= 1;
                count_1 <= 1;
                count_2 <= 0;
            end
        end 
    end 
endmodule
