// $Id: $
// File name:   tb_daf.sv
// Created:     4/29/2014
// Author:      Hong Shick Pak
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: tb top

`timescale 1ns / 10ps

module tb_daf();
  localparam CLK_PERIOD = 708;

  localparam INPUT_FILE = "./Pompeii.wav";
  localparam OUTPUT_FILE = "./outputt.wav";

  // input
  reg tb_clk;
  reg tb_n_rst;
  reg tb_serial_input;

  // external
  reg [3:0] pot_vol;
  reg [3:0] pot_amp;

  // order: flanger : amp clip : amp comp : fader
  reg [3:0] swch_mode_en;

  // intermmediate
/*  reg tb_sck;
  reg tb_ws;
  reg [31:0] tb_parallel_i2s;

  reg tb_clk_div;
  reg tb_shift_en;

  // reg [31:0] tb_parallel_buf_vol;
  // reg [15:0] tb_parallel_vol_upper;
  // reg [15:0] tb_parallel_vol_lower;
  reg [31:0] tb_parallel_buf_flang;
  reg [31:0] tb_parallel_flang;
  reg [31:0] tb_parallel_buf_ampclp;
  reg [31:0] tb_parallel_ampclp;
  // reg [31:0] tb_parallel_buf_acmcop;
  // reg [31:0] tb_parallel_ampcop;
  // reg [31:0] tb_parallel_buf_trns;
  reg [31:0] tb_parallel_buf_fad;*/
  reg [31:0] tb_parallel_fad;

  reg [31:0] temp;

  // tb
  integer in_file;
  integer out_file;
  integer i;

  // output
  reg tb_serial_output;


daf DAFF(
.tb_clk(tb_clk),
.tb_n_rst(tb_n_rst),
.temp(temp),
.pot_vol(pot_vol),
.pot_amp(pot_amp),
.swch_mode_en(swch_mode_en),
.parallel_fad(tb_parallel_fad)
);
  // i2s_trnmtr TRNS(
    // .clk(tb_clk),
    // .n_rst(tb_n_rst),
    // .parallel_data(tb_parallel_buf_trns),
    // .ws(tb_ws),
    // .serial_data(tb_serial_output),
    // .sck(tb_sck)
  // );

  // i2s_rcvr RCV(
    // .clk(tb_sck),
    // .n_rst(tb_n_rst),
    // .ws(tb_ws),
    // .serial_data(tb_serial_input),
    // .parallel_data(tb_parallel_i2s)
  // );

  
  // flex_buffer #(32) BVOL(
    // .clk(tb_clk_div),
    // .n_rst(tb_n_rst),
    // .input_data(tb_parallel_i2s),
    // .output_data(tb_parallel_buf_vol)
  // );

  // volume_mult VOL1(
    // .channel_data(tb_parallel_buf_vol[31:16]),
    // .pot_data(pot_vol),
    // .output_data(tb_parallel_vol_upper)
  // );                                             e

  // volume_mult VOL2(
    // .channel_data(tb_parallel_buf_vol[15:0]),
    // .pot_data(pot_vol),
    // .output_data(tb_parallel_vol_lower)
  // );

  
/*  flex_buffer #(32) BFLANG(
    .clk(tb_clk_div),
    .n_rst(tb_n_rst),
    // .input_data({tb_parallel_vol_upper,tb_parallel_vol_lower}),
    .input_data(temp),
    .output_data(tb_parallel_buf_flang)
  );

  flanger FLANG(
    .clk(tb_clk),
    .n_rst(tb_n_rst),
    .flanger_en(swch_mode_en[3]),
    .shift_en(tb_shift_en),
    .input_data(tb_parallel_buf_flang),
    .output_data(tb_parallel_flang)
  );

  flex_buffer #(32) BAMPCL(
    .clk(tb_clk_div),
    .n_rst(tb_n_rst),
    .input_data(tb_parallel_flang),
    .output_data(tb_parallel_buf_ampclp)
  );

  amp_clip AMPCLP1(
      .inchan(tb_parallel_buf_ampclp[31:16]),
      .comp_in(pot_amp),
      .outchan(tb_parallel_ampclp[31:16])
  );

  amp_clip AMPCLP2(
      .inchan(tb_parallel_buf_ampclp[15:0]),
      .comp_in(pot_amp),
      .outchan(tb_parallel_ampclp[15:0])
  );
  
  flex_buffer #(32) BFAD(
    .clk(tb_clk_div),
    .n_rst(tb_n_rst),
    .input_data(tb_parallel_ampclp),
    .output_data(tb_parallel_buf_fad)
  );

  fader FAD(
    .clk(tb_clk),
    .n_reset(tb_n_rst),
    .clear(1'b0),
    .fad_enable(swch_mode_en[0]),
    .signal_in(tb_parallel_buf_fad),
    .signal_out(tb_parallel_fad)
  );*/
 
  // flex_buffer #(32) BTRNS(
    // .clk(tb_clk_div),
    // .n_nrst(tb_n_rst),
    // .input_data(tb_parallel_flang),
    // .output_data(tb_parallel_buf_trns)
  // );

  always begin
    tb_clk = 1'b1;
    #(CLK_PERIOD/2);
    tb_clk = 1'b0;
    #(CLK_PERIOD/2);
  end

  initial begin
    tb_n_rst = 1'b0;
    tb_serial_input = 1'b0;
    pot_vol = 4'b1111;
    pot_amp = 4'b1111;
    swch_mode_en = 4'b1111;
    
    
    @(posedge tb_clk);

    // start
    tb_n_rst = 1'b1;
    in_file = $fopen(INPUT_FILE, "rb");
    out_file = $fopen(OUTPUT_FILE, "wb");
    while (!$feof(in_file)) begin
      // input
      $fscanf(in_file, "%c", temp[7:0]);
      $fscanf(in_file, "%c", temp[15:8]);
      $fscanf(in_file, "%c", temp[23:16]);
      $fscanf(in_file, "%c", temp[31:24]);
      for (i = 0; i < 31; i = i + 1) begin
        @(posedge tb_clk);
      end
      $fwrite(out_file, "%c", tb_parallel_fad[7:0]);
      $fwrite(out_file, "%c", tb_parallel_fad[15:8]);
      $fwrite(out_file, "%c", tb_parallel_fad[23:16]);
      $fwrite(out_file, "%c", tb_parallel_fad[31:24]);
    end
    $fclose(out_file);                                                                                                            
    $fclose(in_file);
  end
endmodule
