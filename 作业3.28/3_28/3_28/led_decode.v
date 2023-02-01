`define SEG_0 8'hc0
`define SEG_1 8'hf9
`define SEG_2 8'ha4
`define SEG_3 8'hb0 
`define SEG_4 8'h99 
`define SEG_5 8'h92 
`define SEG_6 8'h82 
`define SEG_7 8'hf8 
`define SEG_8 8'h80 
`define SEG_9 8'h90 
`define SEG_A 8'h88 
`define SEG_B 8'h83 
`define SEG_C 8'hc6
`define SEG_D 8'hA1
`define SEG_E 8'h86 
`define SEG_F 8'h89
`define SEG 8'hff
module led_decode(
    input [3:0] hex,
    output reg[7:0] seg
);
    always @(*) begin
        case(hex)
            4'h0: seg = `SEG_0;
            4'h1: seg = `SEG_1;
            4'h2: seg = `SEG_2;
            4'h3: seg = `SEG_3;
            4'h4: seg = `SEG_4;
            4'h5: seg = `SEG_5;
            4'h6: seg = `SEG_6;
            4'h7: seg = `SEG_7;
            4'h8: seg = `SEG_8;
            4'h9: seg = `SEG_9;
           // 4'ha: seg = `SEG_A;
            //4'hb: seg = `SEG_B;
            //4'hc: seg = `SEG_C;
            //4'hd: seg = `SEG_D;
            //4'he: seg = `SEG_E;
            //4'hf: seg = `SEG_F;
            default:seg = `SEG;
        endcase 
    end 
endmodule
