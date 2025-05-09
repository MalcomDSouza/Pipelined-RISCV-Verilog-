module dataMem(
input clk,
input reset,
input MemRead,
input MemWrite,
input [31:0]address,
input [31:0]writedata,
output reg [31:0]opdata);


reg [31:0]datamem[127:0];
integer i;

    
always@(posedge clk or negedge reset) begin

        if(reset == 0)begin
             for(i=0;i<128;i=i+1)begin
            datamem[i] <= 0;end
        end
        
        else begin

            if(MemWrite)begin
                datamem[address+3] <= writedata[31:24];
                datamem[address+2] <= writedata[23:16];
                datamem[address+1] <= writedata[15:8];
                datamem[address] <= writedata[7:0];end
    
            if(MemRead)begin
                opdata <= {datamem[address+3],
                           datamem[address+2], 
                           datamem[address+1], 
                           datamem[address]};end
            else begin
                opdata <= 0;end
                
         end
        
 end



endmodule
