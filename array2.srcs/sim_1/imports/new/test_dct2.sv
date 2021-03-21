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
logic signed [12:0] DATA[64];
logic OUT_ENABLE;
logic signed  [15:0] OUT_DATA[64];

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
	DATA[0] = 93;
	DATA[1] = 77;
	DATA[2] = 52;
	DATA[3] = 64;
	DATA[4] = 77;
	DATA[5] = 63;
	DATA[6] = 65;
	DATA[7] = 72;
	DATA[8] = 60;
	DATA[9] = 64;
	DATA[10] = 42;
	DATA[11] = 45;
	DATA[12] = 69;
	DATA[13] = 68;
	DATA[14] = 64;
	DATA[15] = 69;
	DATA[16] = -40;
	DATA[17] = -27;
	DATA[18] = -38;
	DATA[19] = -36;
	DATA[20] = -8;
	DATA[21] = 11;
	DATA[22] = 18;
	DATA[23] = 24;
	DATA[24] = 33;
	DATA[25] = 38;
	DATA[26] = 33;
	DATA[27] = 24;
	DATA[28] = 23;
	DATA[29] = 21;
	DATA[30] = 13;
	DATA[31] = 8;
	DATA[32] = 89;
	DATA[33] = 92;
	DATA[34] = 92;
	DATA[35] = 84;
	DATA[36] = 78;
	DATA[37] = 70;
	DATA[38] = 59;
	DATA[39] = 57;
	DATA[40] = 70;
	DATA[41] = 72;
	DATA[42] = 76;
	DATA[43] = 74;
	DATA[44] = 78;
	DATA[45] = 86;
	DATA[46] = 88;
	DATA[47] = 92;
	DATA[48] = 63;
	DATA[49] = 63;
	DATA[50] = 68;
	DATA[51] = 67;
	DATA[52] = 65;
	DATA[53] = 67;
	DATA[54] = 67;
	DATA[55] = 65;
	DATA[56] = 64;
	DATA[57] = 65;
	DATA[58] = 70;
	DATA[59] = 70;
	DATA[60] = 68;
	DATA[61] = 65;
	DATA[62] = 64;
	DATA[63] = 66;

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
