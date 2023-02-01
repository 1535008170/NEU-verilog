module stop_watch(
    input clk,
    input rstn,
    input go,
    input up,
    output [3:0] d3,d2,d1,d0 
);

localparam COUNT_VALUE = 10000000;

reg [31:0] ms_reg;
reg [3:0] d3_reg, d2_reg, d1_reg, d0_reg;
wire ms_tick;
reg [3:0] d3_next, d2_next, d1_next, d0_next;

always @(posedge clk) begin
    if(!rstn) begin
        d1_next <= 0;
        d2_next <= 0;
        d3_next <= 0;
        d0_next <= 0;
        ms_reg <= 0;
    end
    else begin
        if(go) begin
            d3_reg <= d3_next;
            d2_reg <= d2_next;
            d1_reg <= d1_next;
            d0_reg <= d0_next;
            if(ms_reg < COUNT_VALUE)
                ms_reg <= ms_reg + 1;
            else 
                ms_reg <= 1;
        end
    end
end

assign ms_tick = (ms_reg == COUNT_VALUE)? 1'b1 : 1'b0;

always @(*) begin
    if(ms_tick) begin
        if(up) begin
            if(d0_reg != 9) 
                d0_next = d0_reg + 1;
            else begin
                d0_next = 4'b0;
                if(d1_reg != 9) 
                    d1_next = d1_reg + 1;
                else begin
                    d1_next = 4'b0;
                    if(d2_reg != 6) 
                        d2_next = d2_reg + 1;
                    else begin
                        d2_next = 4'b0;
                        d3_next = d3_reg + 1;
                    end
                end
            end
        end
        else begin
            if(d0_reg != 0) 
                d0_next = d0_reg - 1;
            else begin
                d0_next = 9;
                if(d1_reg != 0) 
                    d1_next = d1_reg - 1;
                else begin
                    d1_next = 9;
                    if(d2_reg != 0) 
                        d2_next = d2_reg - 1;
                    else begin
                        d2_next = 5;
                        d3_next = d3_reg - 1;
                    end
                end
            end
        end
    end 
end

assign d3 = d3_reg;
assign d2 = d2_reg;
assign d1 = d1_reg;
assign d0 = d0_reg;

endmodule
