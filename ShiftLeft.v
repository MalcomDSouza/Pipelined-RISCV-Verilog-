module shiftleft(
input signed [31:0]in,
output signed [31:0]out);

assign out = in <<1;

endmodule
