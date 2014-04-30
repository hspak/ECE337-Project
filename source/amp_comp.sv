// $Id: $
// File name:   amp_comp.sv
// Created:     4/28/2014
// Author:      Brian Rybarczyk
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Amplitude compression using local max value

module amp_comp(
    input wire clk,
    input wire n_rst,
    input wire [15:0] inchan,
    input wire [3:0] in_thresh,
    output wire [15:0] outchan
    );

    reg [15:0] reg_1_out;
    reg [15:0] reg_2_out;
    reg [15:0] reg_3_out;
    reg [15:0] reg_4_out;

    /* Shift Buffer */
    flex_buffer # (.NUM_BITS(16)) BUFFER1 (.clk(clk),
					  .n_rst(n_rst),
					  .input_data(inchan),
					  .output_data(reg_1_out));

    flex_buffer # (.NUM_BITS(16)) BUFFER2  (.clk(clk),
					  .n_rst(n_rst),
					  .input_data(reg_1_out),
					  .output_data(reg_2_out));

    flex_buffer # (.NUM_BITS(16)) BUFFER3  (.clk(clk),
					  .n_rst(n_rst),
					  .input_data(reg_2_out),
					  .output_data(reg_3_out));
    
    flex_buffer # (.NUM_BITS(16)) BUFFER4  (.clk(clk),
					  .n_rst(n_rst),
					  .input_data(reg_3_out),
					  .output_data(reg_4_out));


    /* Get Max */
    wire [15:0] AcmpB;
    wire [15:0] CcmpD;
    wire [15:0] diff1;
    wire [15:0] ABmax;
    wire [15:0] CDmax;
    wire [15:0] max;

    wire [15:0] A_raw;
    wire [15:0] B_raw;
    wire [15:0] C_raw;
    wire [15:0] D_raw;

    wire [15:0] A_opp_sign;
    wire [15:0] B_opp_sign;
    wire [15:0] C_opp_sign;
    wire [15:0] D_opp_sign;

    wire [15:0] A;
    wire [15:0] B;
    wire [15:0] C;
    wire [15:0] D;

    assign A_raw=reg_1_out;
    assign B_raw=reg_2_out;
    assign C_raw=reg_3_out;
    assign D_raw=reg_4_out;

    //Get absolute value of first buffer
    cla_16bit ABSA(.a(~A_raw), .b({16{1'b0}}), .cin(1'b1), .sum(A_opp_sign)); //get opposite sign of input
    assign A=A_raw[15]?A_opp_sign:A_raw; //get the positive version of the input

    //Get absolute value of second buffer
    cla_16bit ABSB(.a(~B_raw), .b({16{1'b0}}), .cin(1'b1), .sum(B_opp_sign)); //get opposite sign of input
    assign B=B_raw[15]?B_opp_sign:B_raw; //get the positive version of the input

    //Get absolute value of third buffer
    cla_16bit ABSC(.a(~C_raw), .b({16{1'b0}}), .cin(1'b1), .sum(C_opp_sign)); //get opposite sign of input
    assign C=C_raw[15]?C_opp_sign:C_raw; //get the positive version of the input

    //Get absolute value of fourth buffer
    cla_16bit ABSD(.a(~D_raw), .b({16{1'b0}}), .cin(1'b1), .sum(D_opp_sign)); //get opposite sign of input
    assign D=D_raw[15]?D_opp_sign:D_raw; //get the positive version of the input

    cla_16bit A2(.a(A), .b(~B), .cin(1'b1), .sum(AcmpB)); //get A-B
    cla_16bit A3(.a(C), .b(~D), .cin(1'b1), .sum(CcmpD)); //get C-D

    assign ABmax = AcmpB[15]?B:A; //if result of A-B negative, take B, else A
    assign CDmax = CcmpD[15]?D:C; //if result of C-D negative, take D, else C

    cla_16bit A4(.a(ABmax), .b(~CDmax), .cin(1'b1), .sum(diff1)); //subtract the resulted maxes

    assign max = diff1[15]?CDmax:ABmax; //take the max based on the sign of the reult

    /* Compression Block */
    wire [15:0] diff2;
    wire [19:0] product;
    wire [15:0] modifier;
    wire enable;

    assign enable = !diff2[15]; //if result of max-threshold is negative, do not enable modifier

    cla_16bit A5(.a(max), .b(~{1'b0,in_thresh,{11{1'b0}}}), .cin(1'b1), .sum(diff2)); //subtract max from threshold value
    mult16by4 M1(.a(D), .b(diff2[14:11]), .product(product)); //multiply the 4 most significant non-sign bits by D (an absolute value)

    assign modifier = !enable?{16{1'b0}}:
      (max[14]?{{14{1'b0}},product[19:18]}:
      (max[13]?{{13{1'b0}},product[19:17]}:
      (max[12]?{{12{1'b0}},product[19:16]}:
      (max[11]?{{11{1'b0}},product[19:15]}:
      {16{1'b0}})))); //bit shift output based on max

    wire [15:0] out_abs_val;
    cla_16bit A6(.a(D), .b(~modifier), .cin(1'b1), .sum(out_abs_val));

    /*Output positive or negative*/
    wire [15:0] neg_sign_out;
    cla_16bit A7(.a(~out_abs_val), .b({16{1'b0}}), .cin(1'b1), .sum(neg_sign_out));

    assign outchan = reg_4_out[15]?neg_sign_out:out_abs_val;


endmodule
