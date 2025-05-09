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

//,output [31:0]regbank0,
//output [31:0]regbank1,
//output [31:0]regbank2,
//output [31:0]regbank3,
//output [31:0]regbank4,
//output [31:0]regbank5,
//output [31:0]regbank6,
//output [31:0]regbank7
);

reg [31:0]RegisterBank[0:31];

//assign regbank0 = RegisterBank[0];
//assign regbank1 = RegisterBank[1];
//assign regbank2 = RegisterBank[2];
//assign regbank3 = RegisterBank[3];
//assign regbank4 = RegisterBank[4];
//assign regbank5 = RegisterBank[5];
//assign regbank6 = RegisterBank[6];
//assign regbank7 = RegisterBank[7];
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
//riscout <= {RegisterBank[1][3:0],RegisterBank[2][3:0],
//                RegisterBank[3][3:0],RegisterBank[4][3:0]};   
end

//always@(posedge reset)begin
//        for(i=0;i<32;i=i+1)begin
//            RegisterBank[i] <= 0;
//            end
//        end

//always@(posedge clk )begin

//        if(RegWrite == 1)
//            RegisterBank[writeReg] <= writedata;
      
//riscout <= {RegisterBank[1][3:0],RegisterBank[2][3:0],
//                RegisterBank[3][3:0],RegisterBank[4][3:0]};   
//end

endmodule
