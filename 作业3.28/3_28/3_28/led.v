module led(
    input clk,
    input rstn,
    input [63:0] signal,
    input [2:0] n,
    output reg[7:0] seg,
    output reg[7:0] an
);
    wire [8:0] set;
    reg [8:0] an_p;
    assign set = 1 << n;

    always @(posedge clk) begin
        if(!rstn) begin
            an_p <= 8'b0000_0001;
            seg <= 8'b1111_1111;
        end 
        else begin
            if(an_p < set) begin
                seg <= ( ({8{an_p[7]}} & signal[63:56]) | ({8{an_p[6]}} & signal[55:48]) | ({8{an_p[5]}} & signal[47:40]) | ({8{an_p[4]}} & signal[39:32]) | ({8{an_p[3]}} & signal[31:24]) | ({8{an_p[2]}} & signal[23:16]) | ({8{an_p[1]}} & signal[15:8]) | ({8{an_p[0]}} & signal[7:0]) );
                an_p <= an_p << 1;
                an <= ~an_p[7:0];
            end
            else begin
                an_p <= 8'b0000_0001;
            end
        end
    end

endmodule

