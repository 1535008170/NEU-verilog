`timescale 10ns/10ns
module top_tb();
    reg rst,clk;
    reg [3:0] m;
    reg [3:0] n;
    wire out;
    initial begin
        rst = 1'b1;
        clk = 0;
        m = 4'b0101;
        n = 4'b0011;
        #5 rst = 1'b0;
    end 
    initial begin
        $dumpfile("1.vcd");
        $dumpvars(0,t);
        clk = 0;
        forever
            #1 clk = ~clk;

        #10000 $finish;
    end
    top t(
        .rst(rst),
        .clk(clk),
        .m(m),
        .n(n),
        .out(out)
    );
endmodule
        
