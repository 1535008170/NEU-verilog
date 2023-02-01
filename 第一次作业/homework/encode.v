module encode(
    input [7:0] req,
    output [2:0] out_1,
    output [2:0] out_2
);

always @(*) begin
    casex (req)
        8'bxxxxxx11: {out_1,out_2} = 6'b111110;
        8'bxxxxx101: {out_1,out_2} = 6'b111101;
        8'bxxxx1001: {out_1,out_2} = 6'b111100;
        8'bxxx10001: {out_1,out_2} = 6'b111011;
        8'bxx100001: {out_1,out_2} = 6'b111010;
        8'bx1000001: {out_1,out_2} = 6'b111001;
        8'b10000001: {out_1,out_2} = 6'b111000;
        8'bxxxxx110: {out_1,out_2} = 6'b110101;
        8'bxxxx1010: {out_1,out_2} = 6'b110100;
        8'bxxx10010: {out_1,out_2} = 6'b110011;
        8'bxx100010: {out_1,out_2} = 6'b110010;
        8'bx1000010: {out_1,out_2} = 6'b110001;
        8'b10000010: {out_1,out_2} = 6'b110000;
        8'bxxxx1100: {out_1,out_2} = 6'b101100;
        8'bxxx10100: {out_1,out_2} = 6'b101011;
        8'bxx100100: {out_1,out_2} = 6'b101010;
        8'bx1000100: {out_1,out_2} = 6'b101001;
        8'b10000100: {out_1,out_2} = 6'b101000;
        8'bxxx11000: {out_1,out_2} = 6'b100011;
        8'bxx101000: {out_1,out_2} = 6'b100010;
        8'bx1001000: {out_1,out_2} = 6'b100001;
        8'b10001000: {out_1,out_2} = 6'b100000;
        8'bxx110000: {out_1,out_2} = 6'b011010;
        8'bx1010000: {out_1,out_2} = 6'b011001;
        8'b10010000: {out_1,out_2} = 6'b011000;
        8'bx1100000: {out_1,out_2} = 6'b010001;
        8'b10100000: {out_1,out_2} = 6'b010000;
        8'b11000000: {out_1,out_2} = 6'b001000;
        default: {out_1,out_2} = 6'bxxxxxx;
    endcase
end 
endmodule

