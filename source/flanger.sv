// $Id: $
// File name:   flanger.sv
// Created:     4/21/2014
// Author:      Hong Shick Pak
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .
module flanger(
  input wire clk,
  input wire n_rst,
  input wire flanger_en,
  input wire shift_en,
  input wire [31:0] input_data,
  output wire [31:0] output_data
);

reg r_en;
reg w_en;
reg [15:0] addr;
reg [15:0] r_data;
reg [15:0] r_data_save;
reg [15:0] w_data;
reg [31:0] mod_data;

reg mem_clr;
reg mem_init;
reg mem_dump;

on_chip_sram_wrapper DUT(
  .init_file_number(0),
  .dump_file_number(0),
  .mem_clr(mem_clr),
  .mem_init(mem_init),
  .mem_dump(mem_dump),
  .start_address(0),
  .last_address(16'h1090),
  .verbose(1'b1),
  .read_enable(r_en),
  .write_enable(w_en),
  .address(addr),
  .read_data(r_data),
  .write_data(w_data)
);

// 16bit counter
typedef enum bit [3:0] {setup, idle, enable_read, read_1, read_2, enable_write, write_1, write_2} stateType;

stateType next;
stateType curr;

// reg
always @ (posedge clk, negedge n_rst) begin
  if (!n_rst) begin
    curr <= idle;
  end else begin
    curr <= next;
  end         
end

reg [15:0] w_addr;
reg [15:0] r_addr;

always @ (posedge clk, negedge n_rst) begin
  if (!n_rst) begin
    w_addr <= '0;
  end if (w_en) begin
    w_addr <= w_addr + 16;
  end else if (w_addr == 16'h1b90) begin
    w_addr <= 0;
  end else begin
    w_addr <= w_addr;
  end
end
always @ (posedge clk, negedge n_rst) begin
  if (!n_rst) begin
    r_addr <= 32;
  end if (r_en) begin
    r_addr <= r_addr + 16;
  end else if (r_addr == 16'h1b90) begin
    r_addr <= 0;
  end else begin
    r_addr <= r_addr;
  end
end
  
// next state
always_comb begin
  case(curr)
    setup: begin
      if (flanger_en && shift_en) begin
        next = idle;
      end
    end

    idle: begin
      if (flanger_en) begin
        next = enable_read;
      end
    end

    enable_read: begin
      if (flanger_en) begin
        next = read_1;
      end else begin
        next = idle;
      end
    end

    read_1: begin
      if (flanger_en) begin
        next = read_2;
      end else begin
        next = idle;
      end
    end
    read_2: begin
      if (flanger_en) begin
        next = enable_write;
      end else begin
        next = idle;
      end
    end

    enable_write: begin
      if (flanger_en) begin
        next = write_1;
      end else begin
        next = idle;
      end
    end

    write_1: begin
      if (flanger_en) begin
        next = write_2;
      end else begin
        next = idle;
      end
    end

    write_2: begin
      if (flanger_en) begin
        next = enable_read;
      end else begin
        next = idle;
      end
    end
  endcase
end

always_comb begin
  case(curr)
    setup: begin
      mem_clr = 1'b1;
      mem_init = 1'b0;
      mem_dump = 1'b0;

      r_en = 1'b0;
      w_en = 1'b0;
      addr = 16'b0;
      w_data = 16'b0;
      r_data_save = 16'b0;
      mod_data = 32'b0;
    end

    idle: begin
      mem_clr = 1'b0;
      mem_init = 1'b0;
      mem_dump = 1'b0;

      r_en = 1'b0;
      w_en = 1'b0;
      addr = 16'b0;
      w_data = 16'b0;
      r_data_save = 16'b0;
      mod_data = 32'b0;
    end

    enable_read: begin
      mem_clr = 1'b0;
      mem_init = 1'b0;
      mem_dump = 1'b1;

      r_en = 1'b1;
      w_en = 1'b0;
      addr = 16'b0;
      w_data = 16'b0;
      r_data_save = 16'b0;
      mod_data = mod_data;
    end

    read_1: begin
      mem_clr = 1'b0;
      mem_init = 1'b0;
      mem_dump = 1'b0;

      r_en = 1'b1;
      w_en = 1'b0;
      addr = r_addr;
      w_data = 16'b0;
      r_data_save = r_data;
      mod_data = mod_data;
    end

    read_2: begin
      mem_clr = 1'b0;
      mem_init = 1'b0;
      mem_dump = 1'b0;

      r_en = 1'b0;
      w_en = 1'b0;
      addr = r_addr;
      w_data = 16'b0;
      r_data_save = 16'b0;
      mod_data = {r_data_save, r_data};
    end

    enable_write: begin
      mem_clr = 1'b0;
      mem_init = 1'b0;
      mem_dump = 1'b0;

      r_en = 1'b0;
      w_en = 1'b1;
      addr = w_addr;
      w_data = 16'b0;
      r_data_save = 16'b0;
      mod_data = mod_data;
    end

    write_1: begin
      mem_clr = 1'b0;
      mem_init = 1'b0;
      mem_dump = 1'b0;

      r_en = 1'b0;
      w_en = 1'b1;
      addr = w_addr;
      w_data = 16'hffff;
      r_data_save = 16'b0;
      mod_data = mod_data;
    end

    write_2: begin
      mem_clr = 1'b0;
      mem_init = 1'b0;
      mem_dump = 1'b0;

      r_en = 1'b0;
      w_en = 1'b0;
      addr = w_addr;
      w_data = 16'h1111;
      r_data_save = 16'b0;
      mod_data = mod_data;
    end
  endcase
end

assign output_data = (!flanger_en ? input_data : mod_data);

endmodule
