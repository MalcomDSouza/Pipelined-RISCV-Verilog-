`timescale 1ns / 1ps
module Fwd(
input reset,
input clk,
input [4:0]readReg1_ID_EX,
input [4:0]readReg2_ID_EX,
input [4:0]writeReg_EX_MEM,
input [4:0]writeReg_MEM_WB,
input branch_EX_MEM,
input MemRead_EX_MEM,
input MemWrite_EX_MEM,
input MemtoReg_EX_MEM,
input RegWrite_EX_MEM,
input MemtoReg_MEM_WB,
input RegWrite_MEM_WB,  
output reg [1:0]Fwd_A,
output reg [1:0]Fwd_B
);
    

always @(*) begin     
    if (reset == 0) begin
        Fwd_A <= 2'b00;
        Fwd_B <= 2'b00;
    end 
    
    else begin
        // Default case: No forwarding
        Fwd_A <= 2'b00;
        Fwd_B <= 2'b00;
        
        // EX Forwarding
        if ((RegWrite_EX_MEM) && (writeReg_EX_MEM != 0)) begin
            if (writeReg_EX_MEM == readReg1_ID_EX) 
                Fwd_A <= 2'b10;
            if (writeReg_EX_MEM == readReg2_ID_EX) 
                Fwd_B <= 2'b10;
        end
        
        // MEM Forwarding (only if EX Forwarding is not happening)
        if ((RegWrite_MEM_WB) && (writeReg_MEM_WB != 0)) begin
            if ((writeReg_MEM_WB == readReg1_ID_EX) && 
            !(RegWrite_EX_MEM && writeReg_EX_MEM != 0 && writeReg_EX_MEM == readReg1_ID_EX)) 
                Fwd_A <= 2'b01;
            if ((writeReg_MEM_WB == readReg2_ID_EX) && 
            !(RegWrite_EX_MEM && writeReg_EX_MEM != 0 && writeReg_EX_MEM == readReg2_ID_EX)) 
                Fwd_B <= 2'b01;
        end
    end
end



endmodule
