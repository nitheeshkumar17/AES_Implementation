// Tbis module adds the expanded keys to every round of the algorithm
module add_round_key (
		input [127:0] text,
		input [127:0] key,
		input clk,
		output [127:0] new_text);

always @(posedge clk) begin
new_text<=text xor key;
end
endmodule 
