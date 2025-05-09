`timescale 1ns / 1ps
module ID_EX(
input reset,
input clk,
input branch,
input MemRead,
input MemtoReg,
input [1:0]ALUop,
input MemWrite,
input ALUsrc,
input RegWrite,
input [31:0]PC_out,
input [31:0]Regdata1,
input [31:0]Regdata2,
input [31:0]imm,
input funct7,
input [2:0]funct3,
input [4:0]writeReg,
input [4:0]readReg1,
input [4:0]readReg2,
output reg branch_O,
output reg MemRead_O,
output reg MemtoReg_O,
output reg [1:0]ALUop_O,
output reg MemWrite_O,
output reg ALUsrc_O,
output reg RegWrite_O,
output reg PC_out_O,
output reg [31:0]Regdata1_O,
output reg [31:0]Regdata2_O,
output reg [31:0]imm_O,
output reg funct7_O,
output reg [2:0]funct3_O,
output reg [4:0]writeReg_O,
output reg[4:0]readReg1_O,
output reg[4:0]readReg2_O
    );
    
    
    always@(posedge clk or negedge reset) begin
        
        if(reset == 0)begin
            branch_O <= 0 ;
            MemRead_O <= 0 ;
            MemtoReg_O <= 0 ;
            ALUop_O <= 0 ;
            MemWrite_O <= 0 ;
            ALUsrc_O <= 0 ;
            RegWrite_O <= 0 ;
            PC_out_O <= 0 ;
            Regdata1_O <= 0 ;
            Regdata2_O <= 0 ;
            imm_O <= 0 ;
            funct7_O <= 0 ;
            funct3_O <= 0 ;
            writeReg_O <= 0 ;
            readReg1_O <= 0;
            readReg2_O <= 0; end 
    
        else begin
            branch_O <= branch ;
            MemRead_O <= MemRead ;
            MemtoReg_O <= MemtoReg ;
            ALUop_O <= ALUop ;
            MemWrite_O <= MemWrite ;
            ALUsrc_O <= ALUsrc ;
            RegWrite_O <= RegWrite ;
            PC_out_O <= PC_out ;
            Regdata1_O <= Regdata1 ;
            Regdata2_O <= Regdata2 ;
            imm_O <= imm ;
            funct7_O <= funct7 ;
            funct3_O <= funct3 ;
            writeReg_O <= writeReg ;
            readReg1_O <= readReg1;
            readReg2_O <= readReg2; end
     end
     
endmodule