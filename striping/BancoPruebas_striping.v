`timescale 1ns/1ns
`include "Probador_striping.v"
`include "striping.v"
//`include "striping_synth.v" 

module BancoPruebas_striping;
    wire clk_2f, valid_0, valid_1,valid_in, reset;//,valid_0_synth,valid_1_synth;//entradas de 1 bit 
	wire [31:0] data_in;   //buses de 32 bits
	wire [31:0] lane_0;
    wire [31:0] lane_1;
    wire [31:0] lane_0_synth;
    wire [31:0] lane_1_synth;
	striping stripingbp(/*AUTOINST*/
			      // Outputs
			      .lane_0		(lane_0[31:0]),
			      .lane_1		(lane_1[31:0]),
			      .valid_0	(valid_0),
			      .valid_1	(valid_1),
			      // Inputs
			      .clk_2f		(clk_2f),
			      .data_in	(data_in[31:0]),
			      .valid_in		(valid_in),
				  .reset 		(reset));
	//striping_synth striping_synthbp (/*AUTOINST*/
	//					// Outputs
	//					.lane_0		(lane_0_synth[31:0]),
	//					.lane_1		(lane_1_synth[31:0]),
	//					.valid_0	(valid_0_synth),
	//					.valid_1	(valid_1_synth),
						// Inputs
	//					.clk_2f		(clk_2f),
	//					.data_in	(data_in[31:0]),
	//					.valid_in	(valid_in),
	//					.reset		(reset)); 



        

	Probador_striping Probador_stripingbp(/*AUTOINST*/
					 // Outputs
					 .valid_in		(valid_in),
					 .clk_2f		(clk_2f),
					 .data_in		(data_in[31:0]),
					 // Inputs
					 .lane_0		(lane_0[31:0]),
					 .lane_1		(lane_1[31:0]),
			//		 .lane_0_synth	(lane_0_synth[31:0]),
			//		 .lane_1_synth	(lane_1_synth[31:0]),
					 .valid_0		(valid_0),
					 .valid_1		(valid_1),
	//				 .valid_0_synth (valid_0_synth),
//					 .valid_1_synth (valid_1_synth),
					 .reset (reset));


endmodule