module ALU(
input [2:0]ALUcontrol,
input [31:0]A,B,
output reg [31:0]ALUresult, 
output zero);

always@(*)
    begin
    case(ALUcontrol)
        3'b000 : ALUresult <= A+B;//add
        3'b001 : ALUresult <= A-B;//sub
        3'b010 : ALUresult <= A&B;//and
        3'b011 : ALUresult <= A|B;//or
        3'b100 : ALUresult <= A<<B;//sll
        3'b101 : ALUresult <= A>>B;//srl
        3'b110 : ALUresult <= (A<B)?1:0;//slt
        3'b111 : ALUresult <= A^B;//xor
        default : ALUresult <= 0;
    endcase
    
end

assign zero = (ALUresult == 0)?1:0;

endmodule