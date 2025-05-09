module clk_div (
    input  wire clk_in,   // 125 MHz input clock (8 ns period)
    input  wire rst,      // Asynchronous reset
    output reg  clk_out   // 12.5 kHz output clock (80 µs period)  
);

    reg [13:0] counter;  // 14-bit counter (log2(10000) ≈ 14 bits)

    always @(posedge clk_in or negedge rst) begin
        if (~rst) begin
            counter <= 0;
            clk_out <= 0;
        end else if (counter == 4999) begin
            counter <= 0;
            clk_out <= ~clk_out;  // Toggle output clock
        end else begin
            counter <= counter + 1;
        end
    end


//Top riscvtest(clk_out,rst,risc_out);


endmodule




