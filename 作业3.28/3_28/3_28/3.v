module top(
    input clk,
    input rstn,
    input en,
    input r,
    output [7:0] seg,
    output [7:0] an
    );
    reg [2:0] n;
    reg [39:0] num;
    reg state;
    always @(posedge clk_div) begin
        if(!rstn) begin
            num <= 40'h0123456789;
            n <= 3'd4;
            state <= 0;
        end
        else begin
            if(en) begin
                state <= 1;
                if(!state) begin
                    if(r) 
                        num <= {num[3:0],num[39:4]};
                    else 
                        num <= {num[35:0],num[39:36]};
                end
            end
            else begin
                state <= 0;
            end
        end
    end

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
    led_decode d1(
        .hex(num[39:36]),
        .seg(signal[31:24])
    );
    led_decode d2(
        .hex(num[35:32]),
        .seg(signal[23:16])
    );
    led_decode d3(
        .hex(num[31:28]),
        .seg(signal[15:8])
    );

    led_decode d4(
        .hex(num[27:24]),
        .seg(signal[7:0])
    );

    led l(
        .clk(clk_div),
        .rstn(rstn),
        .signal({32'b0,signal[31:0]}),
        .n(n),
        .seg(seg),
        .an(an)
    );

endmodule

