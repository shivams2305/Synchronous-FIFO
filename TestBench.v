`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/14/2025 04:06:53 PM
// Design Name: 
// Module Name: TestBench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TestBench(

    );
    reg clk,reset,r_en,w_en;
    reg [7:0]data_in;
    wire [7:0]data_out;
    wire full,empty;
    
    Synchronous_FIFO uut(r_en,w_en,data_in,clk,reset,data_out,full,empty);
    
    always #5 clk = ~clk;
  
    initial begin
        // Initialize
        clk = 0; reset = 1; r_en = 0; w_en = 0; data_in = 0;

        // Apply reset
        #10 reset = 0;

        // Write data into FIFO
        repeat(8) begin
            @(negedge clk);
            w_en = 1; r_en = 0;
            data_in = $random;
        end

        @(negedge clk);
        w_en = 0;

        // Read data from FIFO
        repeat(9) begin
            @(negedge clk);
            r_en = 1; w_en = 0;
        end

        @(negedge clk);
        r_en = 0;

        // End simulation
        #20 $finish;
    end
endmodule
