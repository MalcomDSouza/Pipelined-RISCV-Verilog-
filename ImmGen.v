module immediate#(parameter width = 32)(
input [31:0]instrn,
output reg [31:0]imm);


always@(*)begin
    
    case(instrn[6:0])
    //  7'b0110111 : imm <=   
    //  7'b0010111 : imm <=   
        7'b1101111 : imm <= {{(width-20){instrn[31]}},instrn[31],instrn[19:12],instrn[20],instrn[30:21]};//jal
        7'b1100111 : imm <= {{(width-12){instrn[31]}},instrn[31:20]}; //jalr
        7'b1100011 : imm <= {{(width-12){instrn[31]}},instrn[31],instrn[7],instrn[30:25],instrn[11:8]};//B
        7'b0000011 : imm <= {{(width-12){instrn[31]}},instrn[31:20]}; //I load
        7'b0100011 : imm <= {{(width-12){instrn[31]}},instrn[31:25],instrn[11:7]}; //S
        7'b0010011 : imm <= {{(width-12){instrn[31]}},instrn[31:20]}; //I 
    //  7'b0110011 : imm <=   
    //  7'b0001111 : imm <=   
    //  7'b1110011 : imm <=   
        default : imm <= 0; 
    endcase
end
endmodule