module probador_un_striping
( 
    input [31:0] data_out,
    input valid_out,
    input [31:0] data_out_synth,
    input valid_out_synth,
    output reg valid_0,  
    output reg valid_1,
	output reg clk_f,
    output reg clk_2f,
    output reg reset,
    output reg [31:0] lane_0,
    output reg [31:0] lane_1
);
	initial begin
	$dumpfile("unstriping.vcd");
	$dumpvars;
	valid_0 <= 0;
	valid_1 <= 0;
	reset <= 0;
	//valid_out <= 0;
	{lane_0,lane_1} <= 32'h00000000;
	@(posedge clk_2f);
	//valid_out <= 1;
	valid_0 <= 1;
	lane_0 <= 32'hFFFFFFFF;
	lane_1 <= 32'hFFFFFFFF;

	@(posedge clk_2f);
	valid_1 <= 1;
	lane_1 <= 32'hEEEEEEEE;

	@(posedge clk_2f);
	lane_0 <= 32'hDDDDDDDD;

	@(posedge clk_2f);
	lane_1 <= 32'hCCCCCCCC;

	@(posedge clk_2f);
	valid_0 <= 0;
	//valid_out <= 0;
	lane_0 <= 32'h00000000;

	@(posedge clk_2f);
	valid_1 <= 0;
	lane_1 <= 32'h00000000;

	@(posedge clk_2f);
	valid_0 <= 1;
	//valid_out <= 1;
	lane_0 <= 32'h00000003;

	@(posedge clk_2f);
	valid_1 <= 1;
	lane_1 <= 32'h00000004;

	@(posedge clk_2f);
	//valid_out <= 0;

	@(posedge clk_2f);
	reset <= 1;
	valid_0 <= 1;
	//valid_out <= 1;
	lane_0 <= 32'h00000003;

	$finish;
	end

	initial clk_f <= 0;
	always #1 clk_f <= ~clk_f;
	
	initial clk_2f <= 0;
	always #2 clk_2f <= ~clk_2f;


endmodule