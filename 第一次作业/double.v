module double( //双优先编码器
	input [7:0] in,
	output reg [2:0] a,b
);

integer i,t;

always @*
	begin
		for(i=0;i<8;i=i+1) 
			begin
				if(in[i])
					a=i;
			end
		t = a;
		
		if(t>0)
			begin
				for(i=0;i<t;i=i+1)
					begin
						if(in[i])
							b=i;
					end
			end
	end
	
endmodule