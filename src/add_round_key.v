// Tbis module adds the expanded keys to every round of the algorithm
module add_round_key (
		input [127:0] text,
		input [127:0] key,
		output [127:0] new_text);

assign new_text = text ^ key;

endmodule 
