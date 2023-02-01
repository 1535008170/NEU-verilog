`timescale 1ns/10ps		//BCD Testbench
module bin_bcd10_tb;

reg [9:0] bin;
wire [11:0] bcd;

bin_bcd12 UI(.bin(bin),
	.bcd(bcd)
);

initial
begin

bin=10'b0000000001;#10;
bin=10'b0000000010;#10;
bin=10'b0000000011;#10;
bin=10'b0000000100;#10;
bin=10'b0000001000;#10;
bin=10'b0000010000;#10;
bin=10'b0000100000;#10;
bin=10'b0001000000;#10;
bin=10'b0010000000;#10;
bin=10'b0100000000;#10;
bin=10'b1000000111;#10;
bin=10'b0000001110;#10;
bin=10'b0001001001;#10;
bin=10'b0100100010;#10;
bin=10'b0010001001;#10;
bin=10'b0111100000;#10;
bin=10'b1111111111;#10;

end
endmodule