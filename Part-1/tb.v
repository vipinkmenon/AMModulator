`timescale 1ns/1ps


module tb();

reg clk_100;
reg clk_200;

initial
begin
	clk_100 = 0;
	forever
	begin
		clk_100 = ~clk_100;
		#5;
	end
end

initial
begin
	clk_200 = 0;
	forever
	begin
		clk_200 = ~clk_200;
		#2.5;
	end
end

wire [11:0] sine;

angleLUT sineInst(
	.i_clk(clk_100),
	.o_angle(sine)
);

wire [11:0] sineFast;
angleLUT sineFastInst(
	.i_clk(clk_200),
	.o_angle(sineFast)
);

wire [11:0] sineSub;
angleLUT #(.stepSize(4)) sineSubInst(
	.i_clk(clk_100),
	.o_angle(sineSub)
);

wire [11:0] sineScaled;
angleLUT #(.ampScale(2)) sineScaledInst(
	.i_clk(clk_100),
	.o_angle(sineScaled)
);

wire [11:0] cosine;
angleLUT #(.phase(90)) cosineInst(
.i_clk(clk_100),
.o_angle(cosine)
);




endmodule