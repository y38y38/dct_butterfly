`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2021 02:35:12 PM
// Design Name: 
// Module Name: test_dct2
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


module test_dct2();

localparam STEP 	= 8;
localparam TEST_TIME = (8*20);

logic CLOCK;
logic RESET;
logic ENABLE;
logic signed [31:0] DATA[8][8];
logic OUT_ENABLE;
logic signed  [31:0] OUT_DATA[8][8];

always begin
	CLOCK = 0; #(STEP/2);
	CLOCK = 1; #(STEP/2);
end

array  dct_inst(
	.CLOCK(CLOCK),
	.RESET(RESET),
	.ENABLE(ENABLE),
	.DATA(DATA),
	.OUT_ENABLE(OUT_ENABLE),
	.OUT_DATA(OUT_DATA)
);

initial begin
	DATA[0][0] = 93;
	DATA[0][1] = 77;
	DATA[0][2] = 52;
	DATA[0][3] = 64;
	DATA[0][4] = 77;
	DATA[0][5] = 63;
	DATA[0][6] = 65;
	DATA[0][7] = 72;
	DATA[1][0] = 60;
	DATA[1][1] = 64;
	DATA[1][2] = 42;
	DATA[1][3] = 45;
	DATA[1][4] = 69;
	DATA[1][5] = 68;
	DATA[1][6] = 64;
	DATA[1][7] = 69;
	DATA[2][0] = -40;
	DATA[2][1] = -27;
	DATA[2][2] = -38;
	DATA[2][3] = -36;
	DATA[2][4] = -8;
	DATA[2][5] = 11;
	DATA[2][6] = 18;
	DATA[2][7] = 24;
	DATA[3][0] = 33;
	DATA[3][1] = 38;
	DATA[3][2] = 33;
	DATA[3][3] = 24;
	DATA[3][4] = 23;
	DATA[3][5] = 21;
	DATA[3][6] = 13;
	DATA[3][7] = 8;
	DATA[4][0] = 89;
	DATA[4][1] = 92;
	DATA[4][2] = 92;
	DATA[4][3] = 84;
	DATA[4][4] = 78;
	DATA[4][5] = 70;
	DATA[4][6] = 59;
	DATA[4][7] = 57;
	DATA[5][0] = 70;
	DATA[5][1] = 72;
	DATA[5][2] = 76;
	DATA[5][3] = 74;
	DATA[5][4] = 78;
	DATA[5][5] = 86;
	DATA[5][6] = 88;
	DATA[5][7] = 92;
	DATA[6][0] = 63;
	DATA[6][1] = 63;
	DATA[6][2] = 68;
	DATA[6][3] = 67;
	DATA[6][4] = 65;
	DATA[6][5] = 67;
	DATA[6][6] = 67;
	DATA[6][7] = 65;
	DATA[7][0] = 64;
	DATA[7][1] = 65;
	DATA[7][2] = 70;
	DATA[7][3] = 70;
	DATA[7][4] = 68;
	DATA[7][5] = 65;
	DATA[7][6] = 64;
	DATA[7][7] = 66;

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
