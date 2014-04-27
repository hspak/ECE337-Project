// $Id: $
// File name:   tb_volume_mult.sv
// Created:     4/27/2014
// Author:      Hong Shick Pak
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .
module tb_volume_mult();
  // input
  reg [15:0] channel_data;
  reg [3:0] pot_data;

  // output
  reg [15:0] output_data;

  volume_mult DUT(
    .channel_data(channel_data),
    .pot_data(pot_data),
    .output_data(output_data)
  );

  initial begin
    // Initialize Inputs
    channel_data = 0;
    pot_data = 0;
    // Wait 100 ns for global reset to finish
    #100;
        
    // Add stimulus here
    channel_data = 16'h0555;
    pot_data = 4'b1010;
    #10
    channel_data = 16'h4444;
    pot_data = 4'b0101;
    #10
    channel_data = 16'h3333;
    pot_data = 4'b1111;
    #10
    channel_data = 16'h5555;
    pot_data = 4'b0000;
  end 
 
  initial begin
    $monitor("time=",$time,, "channel data=%b pot data=%b : output=%b", channel_data,pot_data,output_data);
  end       
endmodule
