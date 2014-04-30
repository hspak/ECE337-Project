// $Id: $
// File name:   sram_controller.sv
// Created:     4/30/2014
// Author:      Hong Shick Pak
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .
module sram_controller(
  input wire clk,
  input wire n_rst,
  input wire rw_trigger,
  input wire mem_clr,
  input wire mem_init,
  input wire mem_dump,
  input wire [31:0] write_data,
  output wire [31:0] sram_data
);
  localparam START_ADDR = 16'b0;
  localparam LAST_ADDR = 16'h1b90;

  reg r_en;
  reg w_en;

  reg [15:0] address;
  reg [15:0] next_address;
  reg [15:0] r_addr;
  reg [15:0] w_addr;
  reg [15:0] next_r_addr;
  reg [15:0] next_w_addr;
  reg [15:0] write_data_half;
  reg [15:0] read_data_half;
  reg [31:0] read_data;
  reg [31:0] next_read_data;

  reg manual;

  on_chip_sram_wrapper SRAM(
    .init_file_number(0),
    .dump_file_number(0),
    .mem_clr(mem_clr),
    .mem_init(mem_init),
    .mem_dump(mem_dump | manual),
    .verbose(1'b1),
    .start_address(START_ADDR),
    .last_address(LAST_ADDR),
    .read_enable(r_en),
    .write_enable(w_en),
    .address(address),
    .read_data(read_data_half), // output
    .write_data(write_data_half)
  );

  typedef enum bit [2:0] {
    idle,
    read,
    read_full,
    write,
    write_full,
    r_wait1,
    r_wait2,
    w_wait1
  } state;

  state curr_st;
  state next_st;

  always @ (posedge clk, negedge n_rst) begin
    if (!n_rst) begin
      curr_st <= idle;
      address <= START_ADDR;
      r_addr <= 16'h0010;
      w_addr <= 16'h0000;
      read_data <= 32'h00000000;
    end else if (r_addr == LAST_ADDR) begin
      r_addr <= 16'h0010;
    end else if (w_addr == LAST_ADDR) begin
      w_addr <= 16'h0000;
    end else begin
      curr_st <= next_st;
      address <= next_address;
      r_addr <= next_r_addr;
      w_addr <= next_w_addr;
      read_data <= next_read_data;
    end
  end

  // next_st state logic
  always_comb begin
    case(curr_st)
      idle: begin
        next_st = idle;
        if (rw_trigger)
          next_st = read;
      end
       
      read:
        next_st = r_wait1;

      r_wait1:
        next_st = read_full;
      
      read_full:
        next_st = r_wait2;

      r_wait2:
        next_st = write;

      write:
        next_st = w_wait1;

      w_wait1:
        next_st = write_full;

      write_full:
        next_st = idle;

      default: 
        next_st = idle;
    endcase
  end

  // output logic
  always_comb begin
    case(curr_st)
      idle: begin
        r_en = 1'b0;
        w_en = 1'b0;
        next_r_addr = r_addr;
        next_w_addr = w_addr;
        next_address = r_addr;
        write_data_half = 16'b0;
        next_read_data = read_data;
        manual = 1'b0;
      end

      read: begin
        r_en = 1'b0;
        w_en = 1'b0;
        next_r_addr = w_addr;
        next_r_addr = r_addr;
        next_address = r_addr;
        write_data_half = 16'b0;
        next_read_data[31:16] = read_data_half;
        manual = 1'b0;
      end

      r_wait1: begin
        r_en = 1'b1;
        w_en = 1'b0;
        next_r_addr = w_addr;
        next_r_addr = r_addr + 16;
        next_address = r_addr;
        write_data_half = 16'b0;
        next_read_data[31:16] = read_data_half;
        manual = 1'b0;
      end

      read_full: begin
        r_en = 1'b0;
        w_en = 1'b0;
        next_r_addr = w_addr;     
        next_r_addr = r_addr;
        next_address = r_addr;
        write_data_half = 16'b0;
        next_read_data[31:16] = read_data_half;
        manual = 1'b0;
      end

      r_wait2: begin
        r_en = 1'b1;
        w_en = 1'b0;
        next_r_addr = w_addr;
        next_r_addr = r_addr + 16;
        next_address = w_addr;
        write_data_half = 16'b0;
        next_read_data[31:16] = read_data_half;
        manual = 1'b0;
      end

      write: begin
        r_en = 1'b0;
        w_en = 1'b1;
        next_w_addr = w_addr + 16;
        next_r_addr = r_addr;
        next_address = w_addr;
        write_data_half = write_data[15:0];
        next_read_data[15:0] = read_data_half; // read data is offset a clock cycle
        manual = 1'b0;
      end

      w_wait1: begin
        r_en = 1'b0;
        w_en = 1'b0;
        next_r_addr = w_addr;
        next_r_addr = r_addr;
        next_address = w_addr;
        write_data_half = 16'b0;
        next_read_data[31:16] = read_data_half;
        manual = 1'b0;
      end

      write_full: begin
        r_en = 1'b0;
        w_en = 1'b1;
        next_w_addr = w_addr + 16;
        next_r_addr = r_addr;
        next_address = address;
        write_data_half = write_data[31:16];
        next_read_data[15:0] = read_data_half;
        manual = 1'b1;
      end
    endcase
  end

  assign sram_data = read_data;
endmodule
