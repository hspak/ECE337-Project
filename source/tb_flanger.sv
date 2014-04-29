// $Id: $
// File name:   tb_flanger.sv
// Created:     4/27/2014
// Author:      Hong Shick Pak
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .
`timescale 1ns / 10ps

// 1.4112 MHz

module tb_flanger();
  localparam CLK_PERIOD = 708;

  reg tb_clk;
  reg tb_n_rst;
  reg tb_flanger_en;
  reg tb_shift_en;
  reg [31:0] tb_input_data;
  reg [31:0] tb_output_data;
  reg [31:0] tb_flanger_output;

  reg tb_clk_div;

  clk_div DIV(
    .clk(tb_clk),
    .n_rst(tb_n_rst),
    .clk_div(tb_clk_div),
    .shift_en(tb_shift_en)
  );

  flex_buffer #(32) BUF(
    .clk(tb_clk_div),
    .n_rst(tb_n_rst),
    .input_data(tb_input_data),
    .output_data(tb_output_data)
  );

  flanger DUT(
    .clk(tb_clk),
    .n_rst(tb_n_rst),
    .flanger_en(tb_flanger_en),
    .shift_en(tb_shift_en),
    .input_data(tb_output_data),
    .output_data(tb_flanger_output)
  );

  always begin
    tb_clk = 1'b1;
    #(CLK_PERIOD/2);
    tb_clk = 1'b0;
    #(CLK_PERIOD/2);
  end

  integer tb_test_case;
  integer i;

  initial begin
    // init
    tb_test_case = 0;
    tb_n_rst = 1'b0;

    tb_flanger_en = 1'b1;
    tb_input_data = 32'h99991111;
    @(posedge tb_clk);

    // begin
    tb_test_case = tb_test_case + 1;
    tb_n_rst = 1'b1;

    // wait for at least 32 clock cycles
    i = 0;
    while (i < 32) begin
      @(posedge tb_clk);
      i = i + 1;
    end
    tb_input_data = 32'h22223333;
  end
endmodule
