// $Id: $
// File name:   tb_daf.sv
// Created:     4/29/2014
// Author:      Hong Shick Pak
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: tb top

`timescale 1ns / 100ps

module tb_daf();
  localparam CLK_PERIOD = 708;

  localparam INPUT_FILE = "./raw1";
  localparam OUTPUT_FILE = "./outraw_full";

  // input
  reg tb_clk;
  reg tb_n_rst;
  reg tb_serial_input;

  // external
  reg [3:0] pot_vol;
  reg [3:0] pot_amp_clp;
  reg [3:0] pot_amp_com;

  // order: flanger : amp clip : amp comp : fader
  reg [3:0] swch_mode_en;

  reg mem_clr;
  reg mem_init;
  reg mem_dump;

  // intermmediate
  reg [31:0] test_in;
  reg [31:0] test_out;

  // tb
  integer in_file;
  integer out_file;
  integer i;
  integer j;

  // output
  reg tb_serial_output;

  daf DAFF(
    .clk(tb_clk),
    .n_rst(tb_n_rst),
    .pot_vol(pot_vol),
    .pot_amp_clp(pot_amp_clp),
    .pot_amp_com(pot_amp_com),
    .swch_mode_en(swch_mode_en),
    .mem_clr(mem_clr),
    .test_in(test_in),
    .test_out(test_out)
  );

  always begin
    tb_clk = 1'b1;
    #(CLK_PERIOD/2);
    tb_clk = 1'b0;
    #(CLK_PERIOD/2);
  end

  initial begin
    tb_n_rst = 1'b0;
    pot_vol = 4'b1010;
    pot_amp_com = 4'b1111;
    pot_amp_clp = 4'b1111;
    swch_mode_en[0] = 1'b0;//flanger
    swch_mode_en[1] = 1'b0;//amp_clip
    swch_mode_en[2] = 1'b0;//amp_comp
    swch_mode_en[3] = 1'b1;//fader

    mem_clr = 1'b0;
    mem_init = 1'b0;
    mem_dump = 1'b0;
    @(posedge tb_clk);
    mem_clr = 1'b1;
    @(posedge tb_clk);
    mem_clr = 1'b0;
    tb_n_rst = 1'b1;
    @(posedge tb_clk);

    // start
    in_file = $fopen(INPUT_FILE, "rb");
    out_file = $fopen(OUTPUT_FILE, "wb");

    while (!$feof(in_file)) begin
      // input
      $fscanf(in_file, "%c", test_in[7:0]);
      $fscanf(in_file, "%c", test_in[15:8]);
      $fscanf(in_file, "%c", test_in[23:16]);
      $fscanf(in_file, "%c", test_in[31:24]);

      // serialize
      for (i = 0; i < 34; i = i + 1) begin
        if (i != 16 && i != 33) begin
          tb_serial_input = test_in[j];
          j = j + 1;
        end
        @(posedge tb_clk);
      end
      $fwrite(out_file, "%c", test_out[7:0]);
      $fwrite(out_file, "%c", test_out[15:8]);
      $fwrite(out_file, "%c", test_out[23:16]);
      $fwrite(out_file, "%c", test_out[31:24]);
    end
    $fclose(out_file);                                                                                                            
    $fclose(in_file);
  end
endmodule
