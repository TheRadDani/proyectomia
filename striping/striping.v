module striping
(
    input clk_2f,
	input [31:0] data_in,
	input valid_in,
	input reset,
	output reg [31:0] lane_0,
	output reg [31:0] lane_1,
    output reg valid_0,
    output reg valid_1
);
reg selector;
always @(posedge clk_2f) 
begin
    if(reset == 1)
    begin
        selector<=0; //permanecer todas las salidas en bajo
        valid_0 <= 0;
        valid_1 <= 0;
        lane_1 <= 0;
        lane_0<= 0;
    end
    else 
    begin
        selector <= 0;
        if(valid_in == 1 && selector == 0 ) 
        begin
            lane_0 <= data_in;
            selector <= ~selector; //hacer toggle a selector para enviar datos por 2 canales en diferentes en cada ciclo siempre
            valid_0 <= 1; //enable lane 0
        end

        else if(valid_in == 1 && selector == 1) begin
            lane_1 <= data_in;
            selector <= ~selector;
            valid_1 <= 1; //enable lane 1
        end

        else if (valid_in == 0 && selector == 0) begin
            selector <= ~selector; //continuar haciendo toogle aunque valid este en 0
            lane_0 <= 32'h00000000;
            valid_0<=0;
        end
        else if (valid_in == 0 && selector == 1) 
        begin
            selector <= ~selector;
            lane_1 <= 32'h00000000;
            valid_1 <= 0;
        end
    end
end
endmodule