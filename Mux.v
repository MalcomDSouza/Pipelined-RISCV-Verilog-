module mux2to1 #(parameter size = 32)
(
input signed [size-1:0]s0,
input signed [size-1:0]s1,
input sel,
output signed [size-1:0]out);

assign out = (sel == 0)?s0:s1;

endmodule