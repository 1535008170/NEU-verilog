`timescale 1ns/1ns
`define clock_period 20

module lab5_1_3_tb;
  reg D;
  wire Q;
  wire Qbar;
  reg Enable;

  D_latch_behavior D_latch_behavior0(.D(D),.Enable(Enable),.Q(Q),.Qbar(Qbar));
  always # (`clock_period/2) Enable = ~Enable;

  initial
  begin
	 D = 1'b0;
	 Enable = 1'b0;
	 #(`clock_period)
	 D = 1'b1;
	 #(`clock_period*2)
	 D = 1'b0;
	 #(`clock_period*4)
	 D = 1'b1;
	 #(`clock_period*10)
    $stop;
  end

endmodule