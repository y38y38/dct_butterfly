`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2021 11:05:15 PM
// Design Name: 
// Module Name: test_butterfly
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


module test_butterfly( );

localparam STEP 	= 8;
localparam TEST_TIME = (8*20);

logic CLOCK;
logic RESET;
logic ENABLE;
logic signed [31:0] DATA[8];
logic OUT_ENABLE;
logic signed  [31:0] OUT_DATA[8];

always begin
	CLOCK = 0; #(STEP/2);
	CLOCK = 1; #(STEP/2);
end

dct_butterfly  dct_butterfly_inst(
	.CLOCK(CLOCK),
	.RESET(RESET),
	.ENABLE(ENABLE),
	.DATA(DATA),
	.OUT_ENABLE(OUT_ENABLE),
	.OUT_DATA(OUT_DATA)
);

initial begin
	DATA[0] = 93;
	DATA[1] = 77;
	DATA[2] = 52;
	DATA[3] = 64;
	DATA[4] = 77;
	DATA[5] = 63;
	DATA[6] = 65;
	DATA[7] = 72;

	RESET = 1'b1;
	#STEP;
	RESET = 1'b0;
	ENABLE = 1'b1;
	#STEP;
	ENABLE = 1'b0;
	#TEST_TIME;

	for (int i=0;i<64;i++) begin
		$display (OUT_DATA[i]);
	end
	$stop;
end

endmodule
