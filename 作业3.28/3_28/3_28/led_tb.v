module tb();
    reg clk,rstn;
    reg [63:0] signal;
    reg [2:0] n;
    wire [7:0] seg;
    wire [7:0] an;
    initial begin
        //$dumpfile("led.vcd");
        //$dumpvars(0,l);
        rstn = 0;
        #4000 rstn = 1;
        signal = 64'h432679736589abc2;
        n = 3'd4;
    end
    initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end
    led l(
        .clk(clk),
        .rstn(rstn),
        .signal(signal),
        .n(n),
        .seg(seg),
        .an(an)
    );
endmodule
