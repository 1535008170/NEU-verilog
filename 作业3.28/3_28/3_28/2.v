
module top(
    input clk,
    input rstn,
    input go,
    input up,
    output [7:0]seg,
    output [7:0]an
);
reg [31:0] count;
reg clk_div;
always @(posedge clk) begin
    if(!rstn) begin
        count <= 32'd0;
        clk_div <= 0;
    end 
    else begin
        if(count < 32'd999) begin
            count <= count + 1;
        end 
        else begin
            clk_div = ~clk_div;
            count <= 0;
        end
    end
end

wire [63:0] signal;
wire [3:0] hex1;
wire [3:0] hex2;
wire [3:0] hex3;
wire [3:0] hex4;
wire [7:0] seg1;
wire [7:0] seg2;
wire [7:0] seg3;
wire [7:0] seg4;
stop_watch watch(
    .clk(clk),
    .rstn(rstn),
    .go(go),
    .up(up),
    .d3(hex1),
    .d2(hex2),
    .d1(hex3),
    .d0(hex4)
);

led_decode ld1(
    .hex(hex1),
    .seg(seg1)
);

led_decode ld2(
    .hex(hex2),
    .seg(seg2)
);

led_decode ld3(
    .hex(hex3),
    .seg(seg3)
);

led_decode ld4(
    .hex(hex4),
    .seg(seg4)
);

assign signal = {32'hffff,1'b0,seg1[6:0],1'b1,seg2[6:0],1'b0,seg3[6:0],1'b1,seg4[6:0]};

led l(
    .clk(clk_div),
    .rstn(rstn),
    .signal(signal),
    .n(3'd4),
    .seg(seg),
    .an(an)
);
endmodule
