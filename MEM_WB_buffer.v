`timescale 1ns / 1ps
module MEM_WB(
input reset,
input clk,
input MemtoReg,
input RegWrite,
input [31:0]opdata,
input [31:0]ALUresult,
input [4:0]writeReg,
output reg MemtoReg_O,
output reg RegWrite_O,
output reg [31:0]opdata_O,
output reg[31:0]ALUresult_O,
output reg [4:0]writeReg_O
    );
    
    
    always@(posedge clk or negedge reset) begin
        
        if(reset == 0)begin
            MemtoReg_O <= 0 ;    
            RegWrite_O <= 0 ;   
            opdata_O <= 0;               
            ALUresult_O <= 0;
            writeReg_O <= 0 ; end 
    
        else begin
            MemtoReg_O <= MemtoReg ;    
            RegWrite_O <= RegWrite ;    
            opdata_O <= opdata;        
            ALUresult_O <= ALUresult;
            writeReg_O <= writeReg ; end
     end
     
endmodule