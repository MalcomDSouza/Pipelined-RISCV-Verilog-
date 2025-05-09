`timescale 1ns / 1ps


module IF_ID(
input reset,
input clk,
input [31:0]IM_in,
input [31:0]PC_in,
output reg [31:0]IM_out,
output reg [31:0]PC_out
    );
    
    
    always@(posedge clk or negedge reset) begin
        
        if(reset == 0)begin
            IM_out <= 0;
            PC_out <= 0;end
    
        else begin
            IM_out <= IM_in;
            PC_out <= PC_in;end
     end
     
endmodule
