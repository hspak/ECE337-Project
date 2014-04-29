// $Id: $
// File name:   tb_amp_comp
// Created:     4/29/2014
// Author:      Brian Rybarczyk
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: testbench for amplitude compression block

`timescale 1ns / 100ps
module tb_amp_comp;
    
    local param CLK_PERIOD = 5;
    local param INPUT_NUM = 8;
    // Inputs
    reg [15:0] tb_input;
    reg [3:0] tb_thresh;
    reg tb_clk;
    reg tb_n_rst;

    // Outputs
    reg [19:0] tb_output;

    // Instantiate the Unit Under Test (UUT)
    amp_comp DUT(
    .inchan(tb_input),
    .in_thresh(tb_thresh),
    .outchan(tb_output),
    .clk(tb_clk),
    .n_rst(tb_n_rst)
    );
    
    int i; //loop control variable
    
    //initialize input vector
    reg [15:0] input_vec [INPUT_NUM-1:0];
    input_vec[0]=16'hff00;
    input_vec[1]=16'h7f00;
    input_vec[2]=16'h88ff;
    input_vec[3]=16'h38f0;
    input_vec[4]=16'h210f;
    input_vec[5]=16'hb100;
    input_vec[6]=16'haa00;
    input_vec[7]=16'h4c00;

    always begin
        tb_clk = 1'b1;
        #(CLK_PERIOD/2);
        tb_clk = 1'b0;
        #(CLK_PERIOD/2);
    end

    initial begin
    // Initialize Inputs
    tb_input = 0;  tb_thresh = 0; tb_n_rst = 1;
    // Wait 100 ns for global reset to finish
    #10;
    tb_n_rst = 0;
    #40;
    tb_n_rst = 1;
    #40;
    tb_thresh=4'b0110;
    for(i=0;i<INPUT_NUM;i++) begin
      tb_input=input_vec[i];
      #CLK_PERIOD;
    end
    
        
    // Add stimulus here
    
 
    initial begin
 $monitor("time=",$time,, "inchan=%b in_thresh=%b output= %b",tb_input, tb_thresh, tb_output);
    end      
endmodule
