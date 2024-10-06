`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2022 07:04:42 PM
// Design Name: 
// Module Name: angleLUT
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module angleLUT #(parameter ampScale=1,stepSize=1,phase=0)(
input i_clk,
output [11:0] o_angle
);


reg[11:0] mem [0:1023];
reg [9:0] rdAddr;

assign o_angle = $signed(mem[rdAddr])/$signed(ampScale);

//LUT memory contains sine values in fixed
//point representation format.
//2 bit integer, 10 bit frac in 2's complement format 
//1024 samples for 2*pi radians  
initial
begin  
	rdAddr = (1024*phase)/360;  
	$readmemb("lutData.mif", mem);
end

always @(posedge i_clk)
begin
    if(rdAddr + stepSize > 1023)
        rdAddr <= 0;
    else
        rdAddr <= rdAddr + stepSize;
end
  
endmodule