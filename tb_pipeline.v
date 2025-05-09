`timescale 1ns/1ps

module tb_pipeline();
//cpu testbench

reg clk;
reg start;
wire [3:0]out;


RISC_P riscv_tb(clk, start, out);

initial
	forever #4 clk = ~clk;

initial begin
	clk = 0;
	start = 0;
//	#1 start = 0;
	#11 start = 1;

//	#200 $finish;

end

endmodule
