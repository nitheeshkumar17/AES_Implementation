// This is the top module of the design 

module aes_top (
	input [127:0] plain_text,
	input [127:0] key,
	input clk,
	output [127:0] cipher);

wire [1407:0] round_key;
wire [127:0] r_key [0:10];
wire [127:0] int_text [1:65];
wire [127:0] text0,text1,text2,text3,text4,key0;

buf128 M0 (.text(plain_text),.key(key),.clk(clk),.buf_text(text0),.buf_key(key0));
round M1 (.key(key0),.round_key(round_key));
assign r_key[0]=round_key[127:0],r_key[1]=round_key[255:128],r_key[2]=round_key[383:256],
       r_key[3]=round_key[511:384],r_key[4]=round_key[639:512],r_key[5]=round_key[767:640],
       r_key[6]=round_key[895:767],r_key[7]=round_key[1023:896],r_key[8]=round_key[1151:1024],
       r_key[9]=round_key[1279:1152],r_key[10]=round_key[1407:1280];
add_round_key M2 (.text(text0),.key(r_key[0]),.new_text(text1));
assign int_text[1]=text1;

genvar i,j;

// Round 1-9 are generated using generate for block

generate 
	for (i=1;i<10;i=i+1) begin
		buf_128 M3 (.text(int_text[1+7*(i-1)]),.clk(clk),.buf_text(int_text[2+7*(i-1)]));
		for (j=1;j<17;j=j+1) begin
			sub_bytes M14 (.text(int_text[1+7*(i-1)][7+(j-1)*8:(j-1)*8]),
				.sub_text(int_text[3+7*(i-1)][7+(j-1)*8:(j-1)*8]));
		end
		shift_rows M4 (.text(int_text[3+7*(i-1)]),.shift_text(int_text[4+7*(i-1)]));
		buf_128 M5 (.text(int_text[4+7*(i-1)]),.clk(clk),.buf_text(int_text[5+7*(i-1)]));
		mix_columns M6 (.text(int_text[5+7*(i-1)]),.mix_text(int_text[6+7*(i-1)]));
		add_round_key M7 (.text(int_text[6+7*(i-1)]),.key(r_key[i]),.new_text(int_text[7+7*(i-1)]));
		buf_128 M8 (.text(int_text[7+7*(i-1)]),.clk(clk),.buf_text(int_text[8+7*(i-1)]));
	end
endgenerate

//Round 10

genvar k,l;
generate 
	for (l=1;l<2;l=l+1) begin
		for (k=1;k<17;k=k+1) begin
			sub_bytes M3 (.text(int_text[64+8*(l-1)][7+(k-1)*8:(k-1)*8]),
				.sub_text(int_text[65+8*(l-1)][7+(k-1)*8:(k-1)*8]));
		end
	end
endgenerate
shift_rows M10 (.text(int_text[65]),.shift_text(text2));
buf_128 M11 (.text(text2),.clk(clk),.buf_text(text3));
add_round_key M12 (.text(text3),.key(r_key[10]),.new_text(text4));
buf_128 M13 (.text(text4),.clk(clk),.buf_text(cipher));

endmodule


