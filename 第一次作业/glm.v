module glm(	//格雷码转换
	input [3:0] a,
	output reg [3:0] g
);
integer i;

always @(*)
	begin
	for(i=0;i<3;i=i+1)
		begin
		g[i] = a[i] ^a[i+1];
	end
	g[3] = a[3];
	end

endmodule