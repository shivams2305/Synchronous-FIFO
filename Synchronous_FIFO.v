`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/14/2025 03:14:16 PM
// Design Name: 
// Module Name: Synchronous_FIFO
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


module Synchronous_FIFO#(parameter DATA_WIDTH=8,DEPTH=8)(
    input r_en,w_en,
    input [DATA_WIDTH-1:0] data_in,
    input clk,reset,
    output reg [DATA_WIDTH-1:0]data_out,
    output full,empty
    );
    reg [DATA_WIDTH-1:0] r[0:DEPTH-1];
    reg [$clog2(DEPTH):0] r_ptr,w_ptr;
    
    always@(posedge clk) begin
        if(reset) begin
            r_ptr<=0;
            w_ptr<=0;
            data_out=0;
        end
        else begin
            if(w_en) begin
                if(!full)begin
                    r[w_ptr]<=data_in;
                    w_ptr<=w_ptr+1;
                end    
            end 
            if(r_en && !empty) begin
                data_out<=r[r_ptr];
                r_ptr<=r_ptr+1;
            end
            else data_out=0;
        end  
    end
    
    assign full=((w_ptr)==DEPTH && r_ptr==0);
    assign empty=(r_ptr==DEPTH | w_ptr==0);
endmodule
