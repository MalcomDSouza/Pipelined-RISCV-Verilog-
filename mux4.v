`timescale 1ns / 1ps
module mux4to1 #(parameter size = 32)
(
input signed [size-1:0]s0,
input signed [size-1:0]s1,
input signed [size-1:0]s2,
input signed [size-1:0]s3,

input [1:0]sel,
output reg signed [size-1:0]out);


always@(*)begin
    
    case(sel)
    2'b00 : out <= s0;
    2'b01 : out <= s1;
    2'b10 : out <= s2;
    2'b11 : out <= s3;
    endcase
 end

endmodule
