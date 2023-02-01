module compare(
    input [1:0] a,
    input [1:0] b,
    output reg gt,eq,lt
);
    always @(*) begin
        case({a,b})
            4'b0000: {gt,eq,lt} = 3'b010;
            4'b0001: {gt,eq,lt} = 3'b001;
            4'b0010: {gt,eq,lt} = 3'b001;
            4'b0011: {gt,eq,lt} = 3'b001;
            4'b0100: {gt,eq,lt} = 3'b100;
            4'b0101: {gt,eq,lt} = 3'b010;
            4'b0110: {gt,eq,lt} = 3'b001;
            4'b0111: {gt,eq,lt} = 3'b001;
            4'b1000: {gt,eq,lt} = 3'b100;
            4'b1001: {gt,eq,lt} = 3'b100;
            4'b1010: {gt,eq,lt} = 3'b010;
            4'b1011: {gt,eq,lt} = 3'b001;
            4'b1100: {gt,eq,lt} = 3'b100;
            4'b1101: {gt,eq,lt} = 3'b100;
            4'b1110: {gt,eq,lt} = 3'b100;
            4'b1111: {gt,eq,lt} = 3'b010;
        endcase
    end
endmodule
