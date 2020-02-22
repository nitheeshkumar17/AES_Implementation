module round (
	input [127:0] key,
	output [1407:0] round_key);

wire [7:0] rc_i;
wire [31:0] r_int_key [1:44];
wire [31:0] r_int_text[1:10];
assign r_int_key[1]=key[127:96],r_int_key[2]=key[95:64],r_int_key[3]=key[63:32],r_int_key[4]=key[31:0];
genvar i;

generate
	for (i=1;i<11;i=i+1) begin
		r_con M0 (.i(i),.rc_i(rc_i));
		g_function M1 (.text(r_int_key[4*(i-1)+4]),.rc_i(rc_i),.g_text(r_int_text[i]));
		assign r_int_key[4*(i-1)+5]= r_int_text[i] ^ r_int_key[4*(i-1)+1];
		assign r_int_key[4*(i-1)+6]= r_int_key[4*(i-1)+5] ^ r_int_key[4*(i-1)+2];
		assign r_int_key[4*(i-1)+7]= r_int_key[4*(i-1)+6] ^ r_int_key[4*(i-1)+3];
		assign r_int_key[4*(i-1)+8]= r_int_key[4*(i-1)+7] ^ r_int_key[4*(i-1)+4];
	end
endgenerate
assign round_key = r_int_key[1:44];
endmodule
