`timescale 1ns / 1ps
module EX_MEM(
input reset,
input clk,
input branch,
input MemRead,
input MemtoReg,
input MemWrite,
input RegWrite,
input [31:0]adderout2,
input [31:0]ALUresult,
input zero,
input [31:0]Regdata2,
input [4:0]writeReg,
output reg branch_O,
output reg MemRead_O,
output reg MemtoReg_O,
output reg MemWrite_O,
output reg RegWrite_O,
output reg [31:0]adderout2_O,
output reg [31:0]ALUresult_O,
output reg zero_O,
output reg [31:0]Regdata2_O,
output reg [4:0]writeReg_O
    );
    
    
    always@(posedge clk or negedge reset) begin
        
        if(reset == 0)begin
            branch_O <= 0 ;
            MemRead_O <= 0 ;
            MemtoReg_O <= 0 ;
            MemWrite_O <= 0 ;           
            writeReg_O <= 0 ;
            adderout2_O <= 0;
            ALUresult_O <= 0;
            zero_O <= 0;
            Regdata2_O <= 0;
            RegWrite_O <= 0 ; end 
    
        else begin
            branch_O <= branch ;
            MemRead_O <= MemRead ;
            MemtoReg_O <= MemtoReg ;
            MemWrite_O <= MemWrite ;           
            writeReg_O <= writeReg ; 
            adderout2_O <= adderout2;
            ALUresult_O <= ALUresult;
            zero_O <= zero;
            Regdata2_O <= Regdata2;
            RegWrite_O <= RegWrite ;end
     end
     
endmodule