module buf128 (
	input [127:0] text,
	input [127:0] key,
	input clk,
	output reg [127:0] buf_text,
	output reg [127:0] buf_key);

always @(posedge clk) begin 
buf_text<=text;
buf_key<=key;
end
endmodule
