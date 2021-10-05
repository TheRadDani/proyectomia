module un_stripring
(
	input clk_2f,
	input [31:0] lane_0,
	input [31:0] lane_1,
	input valid_0,
    input valid_1,
	input reset,
	output reg [31:0] data_out,
    output reg  valid_out
);
reg selector;
always @(posedge clk_2f) 
begin
    if(reset == 1)
    begin
        selector <=0 ;
        valid_0 <= 0;
        valid_1 <= 0;
        //valid_out <= 0;
        data_out<=0;
    end
    else 
    begin
        selector <= 0;
        if(valid_0 == 1 && selector == 0 && valid_out!=0) 
        begin
            data_out <= lane_0 ;
            selector <= ~selector;
            valid_out <= 1;
        end

        else if(valid_1 == 1 && selector == 1 && valid_out!=0) begin
            data_out<=lane_1 ;
            selector <= ~selector;
            valid_out <= 1;
        end

        else if (valid_0 == 0 && selector == 0 && valid_out!=0) begin
            selector <= ~selector; //continuar haciendo toogle aunque valid este en 0
            lane_0 <= 32'hzzzzzzzz;
            valid_0 <= 0;
        end

        else if (valid_1 == 0 && selector == 1 && valid_out!=0) 
        begin
            selector <= ~selector;
            lane_1 <= 32'hzzzzzzzz;
            valid_1 <= 0;
        end

        else if (valid_out==0) 
        begin
            data_out <= 32'hzzzzzzzz;
        end
    end
end

endmodule