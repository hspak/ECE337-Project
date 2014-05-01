// $Id: $
// File name:   tb_flanger.sv
// Created:     4/27/2014
// Author:      Hong Shick Pak
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .
`timescale 1ns / 100ps

// 1.4112 MHz

module tb_flanger();
  localparam CLK_PERIOD = 708; // 708

  localparam INPUT_FILE = "./raw";
  localparam OUTPUT_FILE = "./outraw";

  reg tb_clk;
  reg tb_n_rst;
  reg tb_flanger_en;
  reg [31:0] tb_input_data;
  reg [31:0] tb_output_data;
  
  reg tb_mem_clr;
  reg tb_mem_init;
  reg tb_mem_dump;

  flanger_wrapper DUT(
    .clk(tb_clk),
    .n_rst(tb_n_rst),
    .flanger_en(tb_flanger_en),
    .input_data(tb_input_data),
    .output_data(tb_output_data),
    .mem_clr(tb_mem_clr),
    .mem_init(tb_mem_init),
    .mem_dump(tb_mem_dump)
  );

 always begin
    tb_clk = 1'b1;
    #(CLK_PERIOD/2);
    tb_clk = 1'b0;
    #(CLK_PERIOD/2);
  end

  integer tb_test_case;
  integer in_file;
  integer out_file;
  integer i;

  initial begin
    // init
    tb_test_case = 0;
    tb_n_rst = 1'b0;

    tb_mem_clr = 0;
    tb_mem_init = 0;
    tb_mem_dump = 0;

    tb_flanger_en = 1'b1;
    @(posedge tb_clk);

    // pulse the mem clear
    tb_mem_clr = 1'b1;
    @(posedge tb_clk);
    tb_mem_clr = 0;
    @(posedge tb_clk);

    // begin
    tb_test_case = tb_test_case + 1;
    tb_n_rst = 1'b1;

    // start
    in_file = $fopen(INPUT_FILE, "rb");
    out_file = $fopen(OUTPUT_FILE, "wb");
    while (!$feof(in_file)) begin
      // input
      $fscanf(in_file, "%c", tb_input_data[7:0]);
      $fscanf(in_file, "%c", tb_input_data[15:8]);
      $fscanf(in_file, "%c", tb_input_data[23:16]);
      $fscanf(in_file, "%c", tb_input_data[31:24]);
      for (i = 0; i < 31; i = i + 1) begin
        @(posedge tb_clk);
      end
      $fwrite(out_file, "%c", tb_output_data[7:0]);
      $fwrite(out_file, "%c", tb_output_data[15:8]);
      $fwrite(out_file, "%c", tb_output_data[23:16]);
      $fwrite(out_file, "%c", tb_output_data[31:24]);
    end
    $fclose(out_file);                                                                                                            
    $fclose(in_file);
  end  
endmodule
