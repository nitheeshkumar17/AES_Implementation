// This module operates on columns of the state matrix

module mix_columns (
	input [127:0] text,
	output reg [127:0] mix_text);

always @* begin
//First Column
mix_text[7:0] <= ({text[6:0],1'b0} ^ 8'h1B) ^ (({text[14:8],1'b0} ^ 8'h1B) ^ 
					text[15:8]) ^ text[23:16] ^ text[31:24];
mix_text[15:8] <= text[7:0] ^ ({text[14:8],1'b0} ^ 8'h1B) ^ (({text[22:16],1'b0} ^ 8'h1B) 
					^ text[23:16]) ^ text[31:24];
mix_text[23:16] <= text[7:0] ^ text[15:8] ^ ({text[22:16],1'b0} ^ 8'h1B) ^
					(({text[30:24],1'b0} ^ 8'h1B) ^ text[31:24]);
mix_text[31:24] <= (({text[6:0],1'b0} ^ 8'h1B) ^ text[7:0]) ^ text[15:8] ^ text[23:16]
					^ ({text[30:24],1'b0} ^ 8'h1B);
//Second Column
mix_text[39:32] <= ({text[38:32],1'b0} ^ 8'h1B) ^ (({text[46:40],1'b0} ^ 8'h1B) ^ 
					text[47:40]) ^ text[55:48] ^ text[63:56];
mix_text[47:40] <= text[39:32] ^ ({text[46:40],1'b0} ^ 8'h1B) ^ (({text[54:48],1'b0} ^ 
					8'h1B) ^ text[55:48]) ^ text[63:56];
mix_text[55:48] <= text[39:32] ^ text[47:40] ^ ({text[54:48],1'b0} ^ 8'h1B) ^
					(({text[62:56],1'b0} ^ 8'h1B) ^ text[63:56]);
mix_text[63:56] <= (({text[38:32],1'b0} ^ 8'h1B) ^ text[39:32]) ^ text[47:40] ^ text[55:48]
					^ ({text[62:56],1'b0} ^ 8'h1B);
//Third Column
mix_text[71:64] <= ({text[70:64],1'b0} ^ 8'h1B) ^ (({text[78:72],1'b0} ^ 8'h1B) ^ 
					text[79:72]) ^ text[87:80] ^ text[95:88];
mix_text[79:72] <= text[71:64] ^ ({text[78:72],1'b0} ^ 8'h1B) ^ (({text[86:80],1'b0} ^ 
					8'h1B) ^ text[87:80]) ^ text[95:88];
mix_text[87:80] <= text[71:64] ^ text[79:72] ^ ({text[86:80],1'b0} ^ 8'h1B) ^
					(({text[94:88],1'b0} ^ 8'h1B) ^ text[95:88]);
mix_text[95:88] <= (({text[70:64],1'b0} ^ 8'h1B) ^ text[71:64]) ^ text[79:72] ^ text[87:80]
					^ ({text[94:88],1'b0} ^ 8'h1B);
//Fourth Column
mix_text[103:96] <= ({text[102:96],1'b0} ^ 8'h1B) ^ (({text[110:104],1'b0} ^ 8'h1B) ^ 
					text[111:104]) ^ text[119:112] ^ text[127:120];
mix_text[111:104] <= text[103:96] ^ ({text[110:104],1'b0} ^ 8'h1B) ^ (({text[118:112],1'b0} ^ 8'h1B) 
					^ text[119:112]) ^ text[127:120];
mix_text[119:112] <= text[103:96] ^ text[111:104] ^ ({text[118:112],1'b0} ^ 8'h1B) ^
					(({text[126:120],1'b0} ^ 8'h1B) ^ text[127:120]);
mix_text[127:120] <= (({text[102:96],1'b0} ^ 8'h1B) ^ text[103:96]) ^ text[111:104] ^ text[119:112]
					^ ({text[126:120],1'b0} ^ 8'h1B);
end
endmodule
