`define SEG_0 7'b0000_001
`define SEG_1 7'b1001_111
`define SEG_2 7'b0010_010
`define SEG_3 7'b0000_110
`define SEG_4 7'b1001_100
`define SEG_5 7'b0100_100
`define SEG_6 7'b0100_000
`define SEG_7 7'b0001_111
`define SEG_8 7'b0000_000
`define SEG_9 7'b0000_100
`define SEG 7'h1111111


module bcd(
    input clk,
    input rst,
    input [11:0]sw,
    output reg [7:0] an,
    output reg [6:0] seg
);
    reg div_clk_10;
    reg [31:0] cnt;
    always @(posedge clk) begin
        if(!rst) begin
            cnt <= 0;
            div_clk_10 <= 0;
        end
        else begin
            cnt <= cnt + 1;
            if(cnt == 32'd99) begin
                cnt <= 0;
                div_clk_10 <= ~div_clk_10;
            end
        end
     end

    reg [1:0] state;
    reg [1:0] next_state;
    parameter A = 0, B = 1, C = 2, D = 3;
    reg [6:0] seg_0;
    reg [6:0] seg_1;
    reg [6:0] seg_2;

    always @(*) begin
        case(sw[3:0])
            4'b0000: seg_0 = `SEG_0;
            4'b0001: seg_0 = `SEG_1;
            4'b0010: seg_0 = `SEG_2;
            4'b0011: seg_0 = `SEG_3;
            4'b0100: seg_0 = `SEG_4;
            4'b0101: seg_0 = `SEG_5;
            4'b0110: seg_0 = `SEG_6;
            4'b0111: seg_0 = `SEG_7;
            4'b1000: seg_0 = `SEG_8;
            4'b1001: seg_0 = `SEG_9;
            default: seg_0 = `SEG;
        endcase

        case(sw[7:4])
            4'b0000: seg_1 = `SEG_0;
            4'b0001: seg_1 = `SEG_1;
            4'b0010: seg_1 = `SEG_2;
            4'b0011: seg_1 = `SEG_3;
            4'b0100: seg_1 = `SEG_4;
            4'b0101: seg_1 = `SEG_5;
            4'b0110: seg_1 = `SEG_6;
            4'b0111: seg_1 = `SEG_7;
            4'b1000: seg_1 = `SEG_8;
            4'b1001: seg_1 = `SEG_9;
            default: seg_1 = `SEG;
        endcase

        case(sw[11:8])
            4'b0000: seg_2 = `SEG_0;
            4'b0001: seg_2 = `SEG_1;
            4'b0010: seg_2 = `SEG_2;
            4'b0011: seg_2 = `SEG_3;
            4'b0100: seg_2 = `SEG_4;
            4'b0101: seg_2 = `SEG_5;
            4'b0110: seg_2 = `SEG_6;
            4'b0111: seg_2 = `SEG_7;
            4'b1000: seg_2 = `SEG_8;
            4'b1001: seg_2 = `SEG_9;
            default: seg_2 = `SEG;
        endcase
    end

    always @(posedge div_clk_10) begin
        if(!rst) begin
            an <= 8'b1111_1111;
            state <= A;
        end
        else begin
            if(state == A) begin
                an <= 8'b1111_1110;
                seg <= seg_0;
            end 
            if(state == B) begin
                an <= 8'b1111_1101;  
                seg <= seg_1;
            end 
            if(state == C) begin
                an <= 8'b1111_1011;
                seg <= seg_2;
            end
            state <= next_state;
        end
    end

    always @(*) begin
        case(state)
            A: next_state = B;
            B: next_state = C;
            C: next_state = A;
            default: next_state = A;
        endcase 
    end

endmodule
