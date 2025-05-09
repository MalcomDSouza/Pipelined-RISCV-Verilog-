module registers(
input clk,
input reset,
input [4:0]readReg1,
input [4:0]readReg2,
input [4:0]writeReg,
input [31:0]writedata,
input RegWrite,
output reg [31:0]Regdata1,
output reg [31:0]Regdata2,
output [3:0]riscout

);

reg [31:0]RegisterBank[0:31];
    
assign riscout = writedata[3:0];


always @(*) begin
    Regdata1 = (readReg1 != 0) ? RegisterBank[readReg1] : 0;
    Regdata2 = (readReg2 != 0)?RegisterBank[readReg2]:0;
end


integer i;

always@(posedge clk or negedge reset )begin
    if(~reset)begin
        for(i=0;i<32;i=i+1)begin
            RegisterBank[i] <= 0;
            end
         end
    
    else begin
        if(RegWrite == 1)
            RegisterBank[writeReg] <= writedata;
    end      

end


endmodule
