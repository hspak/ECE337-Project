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
  output reg [31:0] output_data
);

reg r_en;
reg w_en;
reg [15:0] addr;
reg [15:0] r_data;
reg [15:0] r_data_save;
reg [15:0] w_data;
reg [31:0] sram_data;
reg [31:0] adder_data;

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
  .verbose(1'b0),
  .read_enable(r_en),
  .write_enable(w_en),
  .address(addr),
  .read_data(r_data),
  .write_data(w_data)
);

flanger_adder ADD(
  .flanger_data(input_data),
  .sram_data(sram_data),
  .output_data(adder_data)
);

typedef enum bit [3:0] {setup, idle, enable_read, read_1, enable_read_2, read_2, enable_write, write_1, write_enable_2, write_2} stateType;

stateType next;
stateType curr;

// reg
always @ (posedge clk, negedge n_rst) begin
  if (!n_rst) begin
    curr <= setup;
  end else begin
    curr <= next;
  end         
end

reg [15:0] w_addr;
reg [15:0] r_addr;
reg [15:0] w_addr_next;
reg [15:0] r_addr_next;

always @ (posedge clk, negedge n_rst) begin
  if (!n_rst) begin
    w_addr <= 16'b0;
  end else if (w_addr == 16'h19d0) begin
    w_addr <= 16'b0;
  end else begin
    w_addr <= w_addr_next;
  end
end

always @ (posedge clk, negedge n_rst) begin
  if (!n_rst) begin
    r_addr <= 16'h0010;
  end else if (r_addr == 16'h19d0) begin
    r_addr <= 16'b0;
  end else begin
    r_addr <= r_addr_next;
  end
end

reg [31:0] sram_data_save;
reg [15:0] r_data_save_save;

always_ff @ (posedge clk, negedge n_rst) begin
  if (!n_rst) begin
    r_data_save <= '0;
  end else begin
    r_data_save <= r_data_save_save;
  end
end

always_ff @ (posedge clk, negedge n_rst) begin
  if (!n_rst) begin
    sram_data <= '0;
  end else begin
    sram_data <= sram_data_save;
  end
end


// next state
always_comb begin
  case(curr)
    setup: begin
      if (flanger_en) begin
        next = idle;
      end else begin
        next = setup;
      end
    end

    idle: begin
      if (flanger_en && shift_en) begin
        next = enable_read;
      end else begin
        next = idle;
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
        next = enable_read_2;
      end else begin
        next = idle;
      end
    end

    enable_read_2: begin
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
        next = write_enable_2;
      end else begin
        next = idle;
      end
    end

    write_enable_2: begin
      if (flanger_en) begin
        next = write_2;
      end else begin
        next = idle;
      end
    end

    write_2: begin
      next = idle;
    end

    default: begin
      next = setup;
    end
  endcase
end

always_comb begin
  case(curr)
    setup: begin
      r_addr_next = 16'h0010; // read starts at 16-bits offset
      w_addr_next = 16'b0;

      mem_clr = 1'b1; // reset all memory to 0
      mem_init = 1'b0;
      mem_dump = 1'b0;

      r_en = 1'b0;
      w_en = 1'b0;
      addr = 16'b0;
      w_data = 16'b0;
      r_data_save = 16'b0;
      sram_data = 32'b0;
    end

    idle: begin
      r_addr_next = r_addr;
      w_addr_next = w_addr;

      mem_clr = 1'b0;
      mem_init = 1'b0;
      mem_dump = 1'b0;

      r_en = 1'b0;
      w_en = 1'b0;
      addr = 16'b0;
      w_data = 16'b0;
      r_data_save = 16'b0;
      sram_data = sram_data_save;
    end

    enable_read: begin
      r_addr_next = r_addr;
      w_addr_next = w_addr;

      mem_clr = 1'b0;
      mem_init = 1'b0;
      mem_dump = 1'b0;

      r_en = 1'b0;
      w_en = 1'b0;
      addr = r_addr;
      w_data = 16'b0;
      r_data_save = 16'b0;
      sram_data = sram_data_save;
    end

    read_1: begin
      r_addr_next = r_addr + 16;
      w_addr_next = w_addr;

      mem_clr = 1'b0;
      mem_init = 1'b0;
      mem_dump = 1'b0;

      r_en = 1'b1;
      w_en = 1'b0;
      addr = r_addr;
      w_data = 16'b0;
      r_data_save = r_data;
      sram_data = sram_data_save;
    end

    enable_read_2: begin
      r_addr_next = r_addr;
      w_addr_next = w_addr;

      mem_clr = 1'b0;
      mem_init = 1'b0;
      mem_dump = 1'b1;

      r_en = 1'b0;
      w_en = 1'b0;
      addr = r_addr;
      w_data = 16'b0;
      r_data_save = r_data_save_save;
      sram_data = sram_data_save; 
    end

    read_2: begin
      r_addr_next = r_addr + 16;
      w_addr_next = w_addr;

      mem_clr = 1'b0;
      mem_init = 1'b0;
      mem_dump = 1'b0;

      r_en = 1'b1;
      w_en = 1'b0;
      addr = r_addr;
      w_data = 16'b0;
      r_data_save = r_data_save_save;
      sram_data = {r_data_save, r_data};
    end

    enable_write: begin
      r_addr_next = r_addr;
      w_addr_next = w_addr + 16;

      mem_clr = 1'b0;
      mem_init = 1'b0;
      mem_dump = 1'b0;

      r_en = 1'b0;
      w_en = 1'b1;
      addr = w_addr;
      w_data = input_data[15:0];
      r_data_save = 16'b0;
      sram_data = sram_data_save;
    end

    write_1: begin
      r_addr_next = r_addr;
      w_addr_next = w_addr;

      mem_clr = 1'b0;
      mem_init = 1'b0;
      mem_dump = 1'b0;

      r_en = 1'b0;
      w_en = 1'b0;
      addr = w_addr;
      w_data = 0;
      r_data_save = 16'b0;
      sram_data = sram_data_save;
    end

    write_enable_2: begin
      r_addr_next = r_addr;
      w_addr_next = w_addr + 16;

      mem_clr = 1'b0;
      mem_init = 1'b0;
      mem_dump = 1'b0;

      r_en = 0;
      w_en = 1'b1;
      addr = w_addr;
      w_data = input_data[31:16];
      r_data_save = 0;
      sram_data = sram_data_save;
    end

    write_2: begin
      r_addr_next = r_addr;
      w_addr_next = w_addr;

      mem_clr = 1'b0;
      mem_init = 1'b0;
      mem_dump = 1'b0;

      r_en = 1'b0;
      w_en = 1'b0;
      addr = w_addr;
      w_data = 0;
      r_data_save = 16'b0;
      sram_data = sram_data_save;
    end

    default: begin
      r_addr_next = 16'h0010; // read starts at 16-bits offset
      w_addr_next = 16'b0;

      mem_clr = 1'b1; // reset all memory to 0
      mem_init = 1'b0;
      mem_dump = 1'b0;

      r_en = 1'b0;
      w_en = 1'b0;
      addr = 16'b0;
      w_data = 16'b0;
      r_data_save = 16'b0;
      sram_data = 32'b0;
    end
  endcase
end

assign output_data = (!flanger_en ? input_data : adder_data);

endmodule
