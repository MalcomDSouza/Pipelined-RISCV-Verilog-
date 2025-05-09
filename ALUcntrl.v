module ALUcntrl(
input [1:0]ALUop,
input funct7,
input [2:0]funct3,
output reg [2:0]ALUcontrol);

always@(*)begin

    case(ALUop)
        2'b10 : case({funct7,funct3})//R type
                4'b0000 : ALUcontrol <= 3'b000;  //add   
                4'b1000 : ALUcontrol <= 3'b001;  //sub
                4'b0111 : ALUcontrol <= 3'b010;  //and
                4'b0110 : ALUcontrol <= 3'b011;  //or
                4'b0001 : ALUcontrol <= 3'b100;  //sll
                4'b0101 : ALUcontrol <= 3'b101;  //srl
                4'b0010 : ALUcontrol <= 3'b110;  //slt
                4'b0100 : ALUcontrol <= 3'b111;  //xor
                default : ALUcontrol <= 3'bXXX;
                endcase
        2'b11 : case(funct3)//I type
                3'b000 : ALUcontrol <= 3'b000;  //addi 
                3'b001 : ALUcontrol <= 3'b000;  //slli  
                3'b010 : ALUcontrol <= 3'b000;  //slti 
                                                //did not add sltiu
                3'b100 : ALUcontrol <= 3'b000;  //xori
                3'b101 : ALUcontrol <= 3'b000;  //srli     
                3'b110 : ALUcontrol <= 3'b000;  //ori                                                          
                3'b111 : ALUcontrol <= 3'b000;  //andi
                default : ALUcontrol <= 3'bXXX;
                endcase
        2'b00 : ALUcontrol <= 3'b000; //S type              
        2'b01 : ALUcontrol <= 3'b001; //B type    
    endcase
    
end
endmodule