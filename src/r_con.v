module r_con (
	input [3:0] i,
	output reg [7:0] rc_i);

always @* begin
case(i) 
4'h1 : rc_i <= 8'h01;
4'h2 : rc_i <= 8'h02;
4'h3 : rc_i <= 8'h04;
4'h4 : rc_i <= 8'h08;
4'h5 : rc_i <= 8'h10;
4'h6 : rc_i <= 8'h20;
4'h7 : rc_i <= 8'h40;
4'h8 : rc_i <= 8'h80;
4'h9 : rc_i <= 8'h1B;
4'hA : rc_i <= 8'h36;
endcase
end
endmodule
