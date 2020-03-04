// This module is a Key Generation module
// Take a 128-bit key gives a total of 11 keys for 128-bit key length

module round (
	input [127:0] key,
	output [1407:0] round_key);


wire [31:0] r_int_key [1:44];
wire [31:0] r_int_text[1:10];
assign r_int_key[1]=key[127:96],r_int_key[2]=key[95:64],r_int_key[3]=key[63:32],r_int_key[4]=key[31:0];
genvar i;
wire [7:0] rc_i [1:10];
assign rc_i[1]=8'h01,rc_i[2]=8'h02,rc_i[3]=8'h04,rc_i[4]=8'h08,rc_i[5]=8'h10,
	rc_i[6]=8'h20,rc_i[7]=8'h40,rc_i[8]=8'h80,rc_i[9]=8'h1B,rc_i[10]=8'h36;
generate
	for (i=1;i<11;i=i+1) begin
		g_function M1 (.text(r_int_key[4*(i-1)+4]),.rc_i(rc_i[i]),.g_text(r_int_text[i]));
		assign r_int_key[4*(i-1)+5]= r_int_text[i] ^ r_int_key[4*(i-1)+1];
		assign r_int_key[4*(i-1)+6]= r_int_key[4*(i-1)+5] ^ r_int_key[4*(i-1)+2];
		assign r_int_key[4*(i-1)+7]= r_int_key[4*(i-1)+6] ^ r_int_key[4*(i-1)+3];
		assign r_int_key[4*(i-1)+8]= r_int_key[4*(i-1)+7] ^ r_int_key[4*(i-1)+4];
	end
endgenerate
assign round_key = {r_int_key[41],r_int_key[42],r_int_key[43],r_int_key[44],
		    r_int_key[37],r_int_key[38],r_int_key[39],r_int_key[40],
		    r_int_key[33],r_int_key[34],r_int_key[35],r_int_key[36],
		    r_int_key[29],r_int_key[30],r_int_key[31],r_int_key[32],
		    r_int_key[25],r_int_key[26],r_int_key[27],r_int_key[28],
		    r_int_key[21],r_int_key[22],r_int_key[23],r_int_key[24],
		    r_int_key[17],r_int_key[18],r_int_key[19],r_int_key[20],
		    r_int_key[13],r_int_key[14],r_int_key[15],r_int_key[16],
		    r_int_key[9],r_int_key[10],r_int_key[11],r_int_key[12],
		    r_int_key[5],r_int_key[6],r_int_key[7],r_int_key[8],
		    r_int_key[1],r_int_key[2],r_int_key[3],r_int_key[4]};
endmodule
