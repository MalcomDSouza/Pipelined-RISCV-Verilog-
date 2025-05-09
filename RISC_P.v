`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2025 02:51:13
// Design Name: 
// Module Name: RISC_P
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RISC_P(
input clk, 
input reset,
output [3:0]risc_out
    );
    
    wire clk_out;
    
    clk_div clkdivtest(clk,reset,clk_out);
    
    Top riscvtest(clk_out,reset,risc_out);
    
endmodule
