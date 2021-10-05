`timescale 1ns/1ns

`include "probador_un_striping.v"
`include "un_stripring.v"
//`include "mux_striping_synth.v"
module BancoPruebas_unstriping;
	wire clk_2f, valid_out, valid_0, valid_1, reset;// valid_out_sintetizado
	wire [31:0] data_out;
	wire [31:0] lane_0;
	wire [31:0] lane_1;
	//wire [31:0] data_out_synth;

	un_stripring un_stripringbp(/*AUTOINST*/
			  // Outputs
			  .data_out		(data_out[31:0]),
			  .valid_out		(valid_out),
			  // Inputs
			  .clk_2f		(clk_2f),
			  .lane_0		(lane_0[31:0]),
			  .lane_1		(lane_1[31:0]),
			  .valid_0		(valid_0),
			  .valid_1		(valid_1),
			  .reset 		(reset));
	
//	mux_striping_synth mux_striping_synthbp(/*AUTOINST*/
			  // Outputs
//			  .data_out	(data_out_synth[31:0]),
//			  .valid_out	(valid_out_sintetizado),
			  // Inputs
//			  .clk_2f		(clk_2f),
//			  .lane_0		(lane_0[31:0]),
//			  .lane_1		(lane_1[31:0]),
//			  .valid_0		(valid_0),
//			  .valid_1		(valid_1),
//			  .reset		(reset));


	probador_un_striping probador_un_striping(/*AUTOINST*/
				       // Outputs
				       .valid_0		(valid_0),
				       .valid_1		(valid_1),
				       .clk_2f		(clk_2f),
				       .lane_0		(lane_0[31:0]),
				       .lane_1		(lane_1[31:0]),
				       // Inputs
				       .data_out	(data_out[31:0]),
				       .valid_out	(valid_out),
					  // .data_out_synth	(data_out_synth[31:0]),
				     //  .valid_out_sintetizado	(valid_out_sintetizado),
					   .reset 					(reset));
endmodule
