module g_function (
	input [31:0] text,
	input [7:0] rc_i,
	output [31:0] g_text);

wire [7:0] g_int_text;
sub_bytes M0 (.text(text[23:16]),.sub_text(g_int_text));
sub_bytes M1 (.text(text[15:8]),.sub_text(g_text[23:16]));
sub_bytes M2 (.text(text[7:0]),.sub_text(g_text[15:8]));
sub_bytes M3 (.text(text[31:24]),.sub_text(g_text[7:0]));
assign g_text[31:24] = g_int_text ^ rc_i;
endmodule
