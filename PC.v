module PC(
input clk,
input [31:0]PCin,
input reset,
output reg [31:0]PCout);

always@(posedge clk or negedge reset)
    begin    
    if(reset == 0)begin
        PCout <= 0; end
    else begin
        PCout <= PCin;end
        
    end

endmodule