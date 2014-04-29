// $Id: $
// File name:   amp_comp.sv
// Created:     4/28/2014
// Author:      Brian Rybarczyk
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Amplitude compression using local max value

module amp_comp(
    input wire clk;
    input wire n_rst;
    input wire [15:0] inchan
    output wire [15:0] outchan
    );

    wire [15:0] in_abs_val;
    wire [15:0] opp_sign;

    cla_16bit A1(.a(~inchan), .b(16'b0000000000000000), .cin(1'b1), .sum(opp_sign)); //get opposite sign of input
    assign in_abs_val=inchan[15]?opp_sign:inchan; //get the positive version of the input

    wire [15:0] AcmpB;
    wire [15:0] CcmpD;
    wire [15:0] diff;
    wire [15:0] ABmax;
    wire [15:0] CDmax;

    cla_16bit A1(.a(A), .b(~B), .cin(1'b1), .sum(AcmpB));
    cla_16bit A1(.a(C), .b(~D), .cin(1'b1), .sum(CcmpD));

    assign ABmax = AcmpB[15]?B:A;
    assign CDmax = CcmpD[15]?D:C;

    cla_16bit A1(.a(ABmax), .b(~CDmax), .cin(1'b1), .sum(diff));

    assign max = diff[15]?CDmax:ABmax;
    
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
