module probador_un_striping
( 
    input [31:0] data_out,
    input valid_out,
   // input [31:0] data_out_sintetizado,
   // input valid_out_sintetizado,
    output reg valid_0,  
    output reg valid_1,
    output reg clk_2f,
    output reg reset,
    output reg [31:0] lane_0,
    output reg [31:0] lane_1
);
	initial begin
	$dumpfile("unstriping.vcd");
	$dumpvars;
	{valid_0,valid_1,reset} <= 0;
	{lane_0,lane_1} <= 32'hzzzzzzzz;
	@(posedge clk_2f);
	valid_0 <= 1;
    valid_1 <= 1;
	lane_0 <= 32'hFFFFFFFF;
    lane_1 <= 32'hEEEEEEEE;

	@(posedge clk_2f);
	lane_0 <= 32'hDDDDDDDD;
    lane_1 <= 32'hCCCCCCCC;

	@(posedge clk_2f);
	reset <=1;


	@(posedge clk_2f);
    reset <=0;
	valid_0 <= 0;
    valid_1 <= 1;
    lane_0 <= 32'h00DDDDD;
	lane_1 <= 32'hAAAAAAAA;

	@(posedge clk_2f);
	valid_0 <= 1;
    valid_1 <= 0;
	lane_0 <= 32'h11111111;
    lane_1 <= 32'h00000002;

	@(posedge clk_2f);
    valid_1 <= 1;
	lane_1 <= 32'h99999999;
    lane_1 <= 32'h00000004;

	@(posedge clk_2f);
    valid_0 <= 1;
    valid_1 <= 0;
	lane_0 <= 32'h11001111;
    lane_1 <= 32'h00010002;

	@(posedge clk_2f);
    reset <= 1;

	@(posedge clk_2f);
    valid_0 <= 0;
    valid_1 <= 1;
	lane_0 <= 32'h11001111;
    lane_1 <= 32'h00010002;

	$finish;
	end
	
	initial clk_2f <= 0;
	always #2 clk_2f <= ~clk_2f;


endmodule