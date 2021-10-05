module Probador_striping
( 
    input [31:0] lane_0,
    input [31:0] lane_1,
 //   input [31:0] lane_0_synth,
 //   input [31:0] lane_1_synth,
    input valid_0,
    input valid_1,
 //   input valid_out_sintetizado0,
 //   input valid_out_sintetizado1,  
    output reg valid_in,
    output reg clk_2f,
    output reg reset,
    output reg [31:0] data_in
);
	/*always @(posedge clk_2f)
	begin
    	if(valid_in <= 0) data_in <= 32'h00000000;
	end*/

	initial begin
	$dumpfile("striping.vcd");
	$dumpvars;

	


	valid_in <= 0;
    reset <= 0;
	data_in <= 32'h00000000;

	@(posedge clk_2f);
    valid_in <= 1;
	data_in <= 32'hFFFFFFFF;

	@(posedge clk_2f);
	data_in <= 32'hEEEEEEEE;

	@(posedge clk_2f);
	data_in <= 32'hDDDDDDDD;

	@(posedge clk_2f);
	data_in <= 32'hCCCCCCCC;

	@(posedge clk_2f);
    valid_in <= 0;
	data_in <= 32'h00000000;

    @(posedge clk_2f);
	data_in <= 32'h00000200;

	@(posedge clk_2f);
	valid_in <= 0;
	data_in <= 32'h00000000;

	@(posedge clk_2f);
	valid_in <= 1;
	data_in <= 32'h00000003;

	@(posedge clk_2f);
    valid_in <= 1;
	data_in <= 32'h00000004;

	@(posedge clk_2f);
    valid_in <= 1;
	data_in <= 32'hAAAAAAAA;

    @(posedge clk_2f);
    reset=1;
	valid_in <= 1;
	data_in <= 32'hAAAAAAAA;

	@(posedge clk_2f);
	reset=~reset;
    valid_in <= 1;
	data_in <= 32'h00000005;

	$finish;
	end


	initial clk_2f <= 0;
	always #2 clk_2f <= ~clk_2f;

endmodule