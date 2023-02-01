`timescale 1ns/100ps //比较器tb
module compare_tb;

reg [1:0] a;
reg [1:0] b;
wire [2:0] out;

compare_case UI(
	.a(a),
	.b(b),
	.out(out)
);

initial
begin

a=2'b00;b=2'b00;#10;
a=2'b00;b=2'b01;#10;
a=2'b00;b=2'b10;#10;
a=2'b00;b=2'b11;#10;
a=2'b01;b=2'b00;#10;
a=2'b01;b=2'b01;#10;
a=2'b01;b=2'b10;#10;
a=2'b01;b=2'b11;#10;
a=2'b10;b=2'b00;#10;
a=2'b10;b=2'b01;#10;
a=2'b10;b=2'b10;#10;
a=2'b10;b=2'b11;#10;
a=2'b11;b=2'b00;#10;
a=2'b11;b=2'b01;#10;
a=2'b11;b=2'b10;#10;
a=2'b11;b=2'b11;#10;


			
end


endmodule