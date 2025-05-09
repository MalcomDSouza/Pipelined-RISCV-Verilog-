module control(
input [6:0]opcode,
output branch,
output MemRead,
output MemtoReg,
output [1:0]ALUop,
output MemWrite,
output ALUsrc,
output RegWrite);

reg [7:0]control;

assign {ALUsrc,MemtoReg,RegWrite,MemRead,MemWrite,branch,ALUop} = control;


always @(*) begin
    case (opcode)
        7'b0110011: control <= 8'b00100010; // R-type (ALUop = 2'b10 for R-type instructions)
        7'b1101111: control <= 8'b00001011; // JAL (jump and link, ALUop = 2'b11)
        7'b1100111: control <= 8'b10001011; // JALR (jump and link register, ALUop = 2'b11)
        7'b1100011: control <= 8'b0X000101; // B-type (branch instructions, ALUop = 2'b01)
        7'b0000011: control <= 8'b11110000; // Load (I-type, ALUop = 2'b00 for memory operations)
        7'b0100011: control <= 8'b1X001000; // Store (S-type, ALUop = 2'b00 for memory operations)
        7'b0010011: control <= 8'b10100011; // I-type arithmetic (ALUop = 2'b11 for immediate operations)
        default:    control <= 8'b00000000; 
    endcase
end

endmodule