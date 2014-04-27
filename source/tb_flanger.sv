// $Id: $
// File name:   tb_flanger.sv
// Created:     4/27/2014
// Author:      Hong Shick Pak
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .
`timescale 1ns / 10ps

module tb_flanger();
  localparam CLK_PERIOD = 709;

  reg tb_clk;
  reg tb_n_rst;
  reg tb_flanger_en;
  reg tb_shift_en;
  reg [31:0] tb_input_data;
  reg [31:0] tb_output_data;

  flanger DUT(
    .clk(tb_clk),
    .n_rst(tb_n_rst),
    .flanger_en(tb_flanger_en),
    .shift_en(tb_shift_en),
    .input_data(tb_input_data),
    .output_data(tb_output_data)
  );

  always begin
    tb_clk = 1'b1;
    #(CLK_PERIOD/2);
    tb_clk = 1'b0;
    #(CLK_PERIOD/2);
  end

  integer tb_test_case;

  initial begin
    // init
    tb_test_case = 0;
    tb_n_rst = 1'b0;

    tb_shift_en = 1'b1;
    tb_flanger_en = 1'b1;
    tb_input_data = 32'hf0f0f0f0;

    @(posedge tb_clk);
    tb_n_rst = 1'b1;
  end
endmodule
