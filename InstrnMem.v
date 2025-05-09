module instruction(
input reset,
input [31:0]address,
output [31:0]instruction);

reg [7:0]insts[0:39];
integer i;

assign instruction = (address >= 128)? 0 : {insts[address],
                                            insts[address+1],
                                            insts[address+2], 
                                            insts[address+3]};

  
  always @(posedge reset)begin

        insts[0]  <= 8'b00000000;
        insts[1]  <= 8'b00000000;
        insts[2]  <= 8'b00000000;
        insts[3]  <= 8'b00000000;
        
        insts[4]  <= 8'b00000000;  // ADDI x1, x0, 5
        insts[5]  <= 8'b01010000;
        insts[6]  <= 8'b00000000;
        insts[7]  <= 8'b10010011;
        
        insts[8]  <= 8'b00000000;  // ADDI x2, x0, 2
        insts[9]  <= 8'b00100000;
        insts[10] <= 8'b00000001;
        insts[11] <= 8'b00010011;
        
        insts[12] <= 8'b00000000;  // ADD x5, x1, x2
        insts[13] <= 8'b00100000;
        insts[14] <= 8'b10000010;
        insts[15] <= 8'b10110011;
        
        insts[16] <= 8'b01000000;  // SUB x6, x5, x3
        insts[17] <= 8'b00110010;
        insts[18] <= 8'b10000011;
        insts[19] <= 8'b00110011;
        
        insts[20] <= 8'b00000000;  // ADDI x3, x1, 7
        insts[21] <= 8'b01110000;
        insts[22] <= 8'b10000001;
        insts[23] <= 8'b10010011;
        
        insts[24] <= 8'b00000000;  // XOR x4, x6, x2
        insts[25] <= 8'b00100011;
        insts[26] <= 8'b01000010;
        insts[27] <= 8'b00110011;
        
        insts[28] <= 8'b00000000;  // ADDI x4, x4, 9
        insts[29] <= 8'b10010010;
        insts[30] <= 8'b00000010;
        insts[31] <= 8'b00010011;
        
        insts[32] <= 8'b00000000;  // AND x7, x4, x6
        insts[33] <= 8'b01100010;
        insts[34] <= 8'b01110011;
        insts[35] <= 8'b10110011;
        
        insts[36] <= 8'b00000000;  // ADDI x2, x3, 3
        insts[37] <= 8'b00110001;
        insts[38] <= 8'b10000001;
        insts[39] <= 8'b00010011;
        
  end
  
  
    
endmodule
