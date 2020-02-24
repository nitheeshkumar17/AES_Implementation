module buf_128 (
	input [127:0] text,
	input clk,
	output reg [127:0] buf_text);

always @(posedge clk) begin
buf_text<=text;
end
endmodule
