`timescale 1ns/1ps

module Top(
input clk,
input start,
output [3:0]risc_out
    );
    
  
wire [31:0]pc_in, pc_out, IM_out, adderout1, adderout2, shift_out,
             ALU_rslt,immout,reg1,reg2,aluin2,read_data,write_data;
wire ALUsc,MemReg,RegW,MemR,MemW,br,zero,select; 
wire [1:0]ALU_op;  
wire [2:0]ALU_control;

wire [31:0]pc_out_IF_ID,pc_out_ID_EX, IM_out_IF_ID, shift_out_ED_EX, reg1_ID_EX,
            reg2_ID_EX,immout_ID_EX, adderout2_EX_MEM,ALU_rslt_EX_MEM, 
            reg2_EX_MEM, ALU_rslt_MEM_WB, read_data_MEM_WB ;
wire [31:0]mux4to1_A_op, mux4to1_B_op;    
wire ALUsc_ID_EX,MemReg_ID_EX,RegW_ID_EX,MemR_ID_EX,MemW_ID_EX,br_ID_EX,
    zero_ID_EX, funct7_ID_EX;
wire br_EX_MEM, MemR_EX_MEM, MemReg_EX_MEM, MemW_EX_MEM, RegW_EX_MEM,zero_EX_MEM; 
wire MemReg_MEM_WB, RegW_MEM_WB;
wire [1:0]mux4to1_selA, mux4to1_selB;
wire [1:0]ALU_op_ID_EX; 
wire [2:0]funct3_ID_EX;
wire [4:0]writeReg_ID_EX, writeReg_EX_MEM, writeReg_MEM_WB, readreg1_ID_EX,
    readreg2_ID_EX; 
 
PC PCtest(clk, pc_in, start, pc_out);
 
adder adder1test(pc_out, 32'd4, adderout1);
 
instruction instrntest(start, pc_out, IM_out);

IF_ID IF_ID_test(start, clk, IM_out, pc_out, IM_out_IF_ID, pc_out_IF_ID);
 
control controltest(IM_out_IF_ID[6:0], br, MemR, MemReg, ALU_op, MemW,
                      ALUsc, RegW);
                      
registers regtest(clk, start, IM_out_IF_ID[19:15], IM_out_IF_ID[24:20], 
                writeReg_MEM_WB, write_data,RegW_MEM_WB, reg1, reg2, risc_out);
                    
immediate immtest(IM_out_IF_ID, immout);

shiftleft shifttest(immout_ID_EX, shift_out);

ID_EX ID_EX_test(start, clk, br, MemR, MemReg, ALU_op, MemW, ALUsc, RegW,
                pc_out_IF_ID, reg1, reg2, immout, IM_out_IF_ID[30],
                IM_out_IF_ID[14:12],IM_out_IF_ID[11:7], IM_out_IF_ID[19:15],
                IM_out_IF_ID[24:20],
                br_ID_EX,MemR_ID_EX,MemReg_ID_EX,ALU_op_ID_EX, MemW_ID_EX,
                ALUsc_ID_EX, RegW_ID_EX,pc_out_ID_EX,reg1_ID_EX, reg2_ID_EX, 
                immout_ID_EX,funct7_ID_EX,funct3_ID_EX,
                writeReg_ID_EX, readreg1_ID_EX, readreg2_ID_EX); 
 
adder adder2test(pc_out_ID_EX, shift_out, adderout2);
 
ALUcntrl ALUcntrltest(ALU_op_ID_EX, funct7_ID_EX, funct3_ID_EX, ALU_control);
 
ALU ALUtest(ALU_control, mux4to1_A_op, mux4to1_B_op, ALU_rslt, zero);
 
mux2to1 mux2test(reg2_ID_EX, immout_ID_EX, ALUsc_ID_EX, aluin2); 
 
EX_MEM EX_MEM_test(start, clk, br_ID_EX, MemR_ID_EX, MemReg_ID_EX, MemW_ID_EX,
                    RegW_ID_EX, adderout2, ALU_rslt, zero, reg2_ID_EX, 
                    writeReg_ID_EX,
                    br_EX_MEM, MemR_EX_MEM, MemReg_EX_MEM, MemW_EX_MEM,
                    RegW_EX_MEM, adderout2_EX_MEM, ALU_rslt_EX_MEM, zero_EX_MEM,                   
                    reg2_EX_MEM, writeReg_EX_MEM);

Fwd Fwd_test(start, clk, readreg1_ID_EX, readreg2_ID_EX, writeReg_EX_MEM,
             writeReg_MEM_WB, br_EX_MEM, MemR_EX_MEM, MemW_EX_MEM, MemReg_EX_MEM,
             RegW_EX_MEM, MemReg_MEM_WB, RegW_MEM_WB, mux4to1_selA, mux4to1_selB);

mux4to1 mux4to1_testA(reg1_ID_EX, write_data, ALU_rslt_EX_MEM, 32'b0, mux4to1_selA,
                      mux4to1_A_op);

mux4to1 mux4to1_testB(aluin2, write_data, ALU_rslt_EX_MEM, 32'b0, mux4to1_selB,
                      mux4to1_B_op);                      
  
assign select = zero_EX_MEM & br_EX_MEM;
mux2to1 mux1test(adderout1, adderout2_EX_MEM, select, pc_in); 

dataMem dataMemtest(clk, start, MemR_EX_MEM, MemW_EX_MEM,ALU_rslt_EX_MEM,
                    reg2_ID_EX, read_data);

MEM_WB MEM_WB_test(start, clk, MemReg_EX_MEM, RegW_EX_MEM, read_data,
                   ALU_rslt_EX_MEM,writeReg_EX_MEM,
                   MemReg_MEM_WB, RegW_MEM_WB,read_data_MEM_WB, ALU_rslt_MEM_WB,
                   writeReg_MEM_WB);

mux2to1 mux3test( ALU_rslt_MEM_WB, read_data_MEM_WB, MemReg_EX_MEM, write_data);
 


    
endmodule
