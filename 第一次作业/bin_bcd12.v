module bin_bcd12(	//BCD
	input  [9:0] bin,
	output reg [11:0] bcd
);
 
	reg [21:0] x;
	integer i;
	always @(posedge bin or posedge bcd)
		begin
			for(i=0;i<22;i=i+1)
				x[i]=0;
			x[12:3]=bin;
			repeat(7)//10-3
			begin
				if(x[13:10]>4)
					x[13:10] = x[13:10]+3;
				if(x[17:14]>4)
					x[17:14] = x[17:14]+3;
				if(x[21:18]>4)
					x[21:18] = x[21:18]+3;
				x[21:1] = x[20:0];				
			end
			bcd[11:0] = x[21:10];
		end

endmodule