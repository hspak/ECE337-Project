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

    reg reg_1_out;
    reg reg_2_out;
    reg reg_3_out;
    reg reg_4_out;

    /* Shift Buffer */
    flex_buffer BUFFER # (NUM_BITS = 16) (.clk(clk),
					  .n_rst(n_rst),
					  .input_data(inchan),
					  .output_data(reg_1_out));

    flex_buffer BUFFER # (NUM_BITS = 16) (.clk(clk),
					  .n_rst(n_rst),
					  .input_data(reg_1_out),
					  .output_data(reg_2_out));

    flex_buffer BUFFER # (NUM_BITS = 16) (.clk(clk),
					  .n_rst(n_rst),
					  .input_data(reg_2_out),
					  .output_data(reg_3_out));
    
    flex_buffer BUFFER # (NUM_BITS = 16) (.clk(clk),
					  .n_rst(n_rst),
					  .input_data(reg_3_out),
					  .output_data(reg_4_out));

    /* Get Absolute Value */
    wire [15:0] in_abs_val;
    wire [15:0] opp_sign;

    cla_16bit A1(.a(~reg_4_out), .b({16{1'b0}}), .cin(1'b1), .sum(opp_sign)); //get opposite sign of input
    assign in_abs_val=reg_4_out[15]?opp_sign:reg_4_out; //get the positive version of the input

    /* Get Max */
    wire [15:0] AcmpB;
    wire [15:0] CcmpD;
    wire [15:0] diff1;
    wire [15:0] ABmax;
    wire [15:0] CDmax;
    wire [15:0] max;

    cla_16bit A2(.a(A), .b(~B), .cin(1'b1), .sum(AcmpB));
    cla_16bit A3(.a(C), .b(~D), .cin(1'b1), .sum(CcmpD));

    assign ABmax = AcmpB[15]?B:A;
    assign CDmax = CcmpD[15]?D:C;

    cla_16bit A4(.a(ABmax), .b(~CDmax), .cin(1'b1), .sum(diff1));

    assign max = diff1[15]?CDmax:ABmax;

    /* Compression Block */
    wire [15:0] diff2;
    wire [19:0] product;
    wire [15:0] modifier;
    wire enable;

    assign enable = !diff2[15];

    cla_16bit(.a(max), .b(~{1'b0,in_thresh,{11{1'b0}}}), .cin(1'b1), .sum(diff2));
    mult16by4 M1(.a(in_abs_val), .b(diff2[14:11]), .product(product));

    assign modifier = !enable?{16{1'b0}}:(max[14]?{{14{1'b0}},product[19:18]}:(max[13]?{{13{1'b0}},product[19:17]}:(max[12]?{{12{1'b0}},product[19:16]}:(max[11]?{{11{1'b0}},product[19:15]}:{16{1'b0}}))));

    wire [15:0] out_abs_val;
    cla_16bit A5(.a(in_abs_val), .b(~modifier), .cin(1'b1), .sum(out_abs_val));

    /*Output positive or negative*/
    wire [15:0] neg_sign_out;
    cla_16bit A6(.a(~out_abs_val), .b({16{1'b0}}), .cin(1'b1), .sum(neg_sign_out));

    assign outchan = reg_4_out[15]?neg_sign_out:out_abs_val;
/*    
    wire [15:0] AcmpB;
    wire [15:0] AcmpC;
    wire [15:0] AcmpD;
    wire [15:0] BcmpC;
    wire [15:0] BcmpD;
    wire [15:0] CcmpD;

    wire AeqB;
    wire AeqC;
    wire AeqD;
    wire BeqC;
    wire BeqD;
    wire CeqD;

    assign AeqB=!(AcmpB||{16{1'b0}});
    assign AeqC=!(AcmpC||{16{1'b0}});
    assign AeqD=!(AcmpD||{16{1'b0}});
    assign BeqC=!(BcmpC||{16{1'b0}});
    assign BeqD=!(BcmpD||{16{1'b0}});
    assign CeqD=!(CcmpD||{16{1'b0}});
    
    cla_16bit A1(.a(A), .b(~B), .cin(1'b1), .sum(AcmpB));
    cla_16bit A1(.a(A), .b(~C), .cin(1'b1), .sum(AcmpC));
    cla_16bit A1(.a(A), .b(~D), .cin(1'b1), .sum(AcmpD));
    cla_16bit A1(.a(B), .b(~C), .cin(1'b1), .sum(BcmpC));
    cla_16bit A1(.a(B), .b(~D), .cin(1'b1), .sum(BcmpD));
    cla_16bit A1(.a(C), .b(~D), .cin(1'b1), .sum(CcmpD));

    wire ABflag;
    wire ACflag;
    wire ADflag;
    wire BCflag;
    wire BDflag;
    wire CDflag;

    ABflag=(AcmpB[15] | AeqB);
    ACflag=(AcmpC[15] | AeqC);
*/

endmodule
