// $Id: $
// File name:   tb_flanger_adder.sv
// Created:     4/27/2014
// Author:      Hong Shick Pak
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

`timescale 1ns / 10ps

module tb_flanger_adder();
  // input
  reg [31:0] data1;
  reg [31:0] data2;

  // output
  reg [31:0] sum;

  flanger_adder DUT(
    .flanger_data(data1),
    .sram_data(data2),
    .output_data(sum)
  );

  initial begin
    // Initialize Inputs
    data1 = 0;  
    data2 = 0;
    // Wait 100 ns for global reset to finish
    #100;
        
    // Add stimulus here
    #10
    data1 = 32'h0000FFFF;
    data2 = 32'hFFFF0000;
    #10
    data1 = 32'h00000FFF;
    data2 = 32'hFFF00000;
    #10
    data1 = 32'h0000FF00;
    data2 = 32'h00FF0000;
  end 

  initial begin
    $monitor("time=",$time,, "Data1=%b Data2=%b : Sum=%b", data1, data2, sum);
  end       
endmodule
