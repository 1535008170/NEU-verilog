`timescale 10ns/10ns
module tb();
    reg clk,rstn;
    reg en,r;
    wire [7:0] seg;
    wire [7:0] an;
    initial begin
        //$dumpfile("2.vcd");
        //$dumpvars(0,t);
        rstn = 0;
        #500 rstn = 1;
        en = 1;
        r = 1;
    end
    initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end
    top t(
        .clk(clk),
        .rstn(rstn),
        .go(en),
        .up(r),
        .seg(seg),
        .an(an)
    );
endmodule
