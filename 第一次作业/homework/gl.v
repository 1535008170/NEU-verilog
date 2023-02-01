module top(
    input [3:0] num,
    output [3:0] gl
);
    assign gl = num ^ {0,num[3:1]};
endmodule
