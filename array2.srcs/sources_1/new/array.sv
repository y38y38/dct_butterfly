`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2021 11:22:10 PM
// Design Name: 
// Module Name: array
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


module array(
	input CLOCK,
	input RESET,
	input ENABLE,
	input [12:0] DATA[64],
	output OUT_ENABLE,
	output [15:0] OUT_DATA[64]
    );

logic [15:0] s1_output[64];
logic sl_output_enable[8];

genvar i;
generate
	for(i=0;i<64;i=i+8) begin
		dct_butterfly butterfly1(
			.CLOCK(CLOCK),
			.RESET(RESET),
			.ENABLE(ENABLE),
			.DATA(DATA[i]),
			.OUT_ENABLE(sl_output_enable[i]),
			.OUT_DATA(s1_output[i])
		);
	end
endgenerate

logic tmp_data[64];

genvar  j,k;
for(j=0;j<8;j++) begin
	for(k=0;k<8;k++) begin
			assign tmp_data[j * 8 + k] = s1_output[k * 8 + j];
	end
end

logic [7:0] s2_enable;

/*
integer m;
for (m=0;m<8;m++) begin
	logic [7:0]	s1_output_bit;
end
*/

always @(posedge CLOCK) begin
	if (RESET)	begin
		s2_enable <= 8'b0;
	end else begin
		if (s1_output[0]) begin
			s2_enable |= 8'b1;
		end
		if (s1_output[1]) begin
			s2_enable |= 8'b10;
		end
		if (s1_output[2]) begin
			s2_enable |= 8'b100;
		end
		if (s1_output[3]) begin
			s2_enable |= 8'b1000;
		end
		if (s1_output[4]) begin
			s2_enable |= 8'b10000;
		end
		if (s1_output[5]) begin
			s2_enable |= 8'b100000;
		end
		if (s1_output[6]) begin
			s2_enable |= 8'b1000000;
		end
		if (s1_output[7]) begin
			s2_enable |= 8'b10000000;
		end

	end
end
logic s2_enable_all;

always @(posedge CLOCK) begin
	if (RESET) begin
		s2_enable_all <= 1'b0;
	end else begin
		if (s2_enable == 8'b11111111) begin
			s2_enable_all <= 1'b1;
		end else begin
//			s2_enable_all <= 1'b1;
		end

	end
end

logic s3_output_enable[8];
logic [15:0] s3_output[64];


genvar l;
generate
	for(l=0;l<64;l=l+8) begin
		dct_butterfly butterfly2(
			.CLOCK(CLOCK),
			.RESET(RESET),
			.ENABLE(s2_enable_all),
			.DATA(tmp_data[l]),
			.OUT_ENABLE(s3_output_enable[l]),
			.OUT_DATA(s3_output[l])
		);
	end
endgenerate


logic [7:0] s3_enable;

always @(posedge CLOCK) begin
	if (RESET)	begin
		s3_enable <= 8'b0;
	end else begin
		if (s3_output[0]) begin
			s3_enable |= 8'b1;
		end
		if (s3_output[1]) begin
			s3_enable |= 8'b10;
		end
		if (s3_output[2]) begin
			s3_enable |= 8'b100;
		end
		if (s3_output[3]) begin
			s3_enable |= 8'b1000;
		end
		if (s3_output[4]) begin
			s3_enable |= 8'b10000;
		end
		if (s3_output[5]) begin
			s3_enable |= 8'b100000;
		end
		if (s3_output[6]) begin
			s3_enable |= 8'b1000000;
		end
		if (s3_output[7]) begin
			s3_enable |= 8'b10000000;
		end

	end
end
logic s3_enable_all;

always @(posedge CLOCK) begin
	if (RESET) begin
		s3_enable_all <= 1'b0;
	end else begin
		if (s3_enable == 8'b11111111) begin
			s3_enable_all <= 1'b1;
		end else begin
//			s2_enable_all <= 1'b1;
		end

	end
end



genvar  o;
for(o=0;o<8;o++) begin
	assign OUT_DATA[o*8] = s3_output[o];
	assign OUT_DATA[(o*8) + 1] = s3_output[8+o];
	assign OUT_DATA[(o*8) + 2] = s3_output[16+o];
	assign OUT_DATA[(o*8) + 3] = s3_output[24+o];
	assign OUT_DATA[(o*8) + 4] = s3_output[32+o];
	assign OUT_DATA[(o*8) + 5] = s3_output[40+o];
	assign OUT_DATA[(o*8) + 6] = s3_output[48+o];
	assign OUT_DATA[(o*8) + 7] = s3_output[6+o];
end
assign OUT_ENABLE  = s3_enable_all;
endmodule
