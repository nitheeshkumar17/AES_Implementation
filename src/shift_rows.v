module shift_rows (
	input [127:0] text,
	output reg [127:0] shift_text);

always @* begin
shift_text[7:0]<=text[7:0];
shift_text[15:8]<=text[47:40];
shift_text[23:16]<=text[87:80];
shift_text[31:24]<=text[127:120];
shift_text[39:32]<=text[39:32];
shift_text[47:40]<=text[79:72];
shift_text[55:48]<=text[119:112];
shift_text[63:56]<=text[31:24];
shift_text[71:64]<=text[71:64];
shift_text[79:72]<=text[111:104];
shift_text[87:80]<=text[23:16];
shift_text[95:88]<=text[63:56];
shift_text[103:96]<=text[103:96];
shift_text[111:104]<=text[15:8];
shift_text[119:112]<=text[55:48];
shift_text[127:120]<=text[95:88];
end
endmodule
