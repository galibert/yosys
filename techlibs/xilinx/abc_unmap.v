/*
 *  yosys -- Yosys Open SYnthesis Suite
 *
 *  Copyright (C) 2012  Clifford Wolf <clifford@clifford.at>
 *                2019  Eddie Hung    <eddie@fpgeh.com>
 *
 *  Permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 */

// ============================================================================

module \$__ABC_ASYNC (input A, S, output Y);
  assign Y = A;
endmodule

module \$__ABC_FDRE (output Q,
                     input C,
                     input CE,
                     input D,
                     input R, \$pastQ );
  parameter [0:0] INIT = 1'b0;
  parameter [0:0] IS_C_INVERTED = 1'b0;
  parameter [0:0] IS_D_INVERTED = 1'b0;
  parameter [0:0] IS_R_INVERTED = 1'b0;
  parameter CLK_POLARITY = !IS_C_INVERTED;
  parameter EN_POLARITY = 1'b1;

  FDRE #(
    .INIT(INIT),
    .IS_C_INVERTED(IS_C_INVERTED),
    .IS_D_INVERTED(IS_D_INVERTED),
    .IS_R_INVERTED(IS_R_INVERTED),
  ) _TECHMAP_REPLACE_ (
    .D(D), .Q(Q), .C(C), .CE(CE), .R(R)
  );
endmodule

module \$__ABC_FDRE_1 (output Q,
                       input C,
                       input CE,
                       input D,
                       input R, \$pastQ );
  parameter [0:0] INIT = 1'b0;
  parameter CLK_POLARITY = 1'b0;
  parameter EN_POLARITY = 1'b1;
  assign Q = R ? 1'b0 : (CE ? D : \$pastQ );

  FDRE_1 #(
    .INIT(INIT),
  ) _TECHMAP_REPLACE_ (
    .D(D), .Q(Q), .C(C), .CE(CE), .R(R)
  );
endmodule

module \$__ABC_FDCE (output Q,
                     input C,
                     input CE,
                     input D,
                     input CLR, \$pastQ );
  parameter [0:0] INIT = 1'b0;
  parameter [0:0] IS_C_INVERTED = 1'b0;
  parameter [0:0] IS_D_INVERTED = 1'b0;
  parameter [0:0] IS_CLR_INVERTED = 1'b0;
  parameter CLK_POLARITY = !IS_C_INVERTED;
  parameter EN_POLARITY = 1'b1;

  FDCE #(
    .INIT(INIT),
    .IS_C_INVERTED(IS_C_INVERTED),
    .IS_D_INVERTED(IS_D_INVERTED),
    .IS_CLR_INVERTED(IS_CLR_INVERTED),
  ) _TECHMAP_REPLACE_ (
    .D(D), .Q(Q), .C(C), .CE(CE), .CLR(CLR)
  );
endmodule

module \$__ABC_FDCE_1 (output Q,
                       input C,
                       input CE,
                       input D,
                       input CLR, \$pastQ );
  parameter [0:0] INIT = 1'b0;
  parameter CLK_POLARITY = 1'b0;
  parameter EN_POLARITY = 1'b1;

  FDCE_1 #(
    .INIT(INIT),
  ) _TECHMAP_REPLACE_ (
    .D(D), .Q(Q), .C(C), .CE(CE), .CLR(CLR)
  );
endmodule

module \$__ABC_FDPE (output Q,
                     input C,
                     input CE,
                     input D,
                     input PRE, \$pastQ );
  parameter [0:0] INIT = 1'b0;
  parameter [0:0] IS_C_INVERTED = 1'b0;
  parameter [0:0] IS_D_INVERTED = 1'b0;
  parameter [0:0] IS_PRE_INVERTED = 1'b0;
  parameter CLK_POLARITY = !IS_C_INVERTED;
  parameter EN_POLARITY = 1'b1;

  FDPE #(
    .INIT(INIT),
    .IS_C_INVERTED(IS_C_INVERTED),
    .IS_D_INVERTED(IS_D_INVERTED),
    .IS_PRE_INVERTED(IS_PRE_INVERTED),
  ) _TECHMAP_REPLACE_ (
    .D(D), .Q(Q), .C(C), .CE(CE), .PRE(PRE)
  );
endmodule

module \$__ABC_FDPE_1 (output Q,
                       input C,
                       input CE,
                       input D,
                       input PRE, \$pastQ );
  parameter [0:0] INIT = 1'b0;
  parameter CLK_POLARITY = 1'b0;
  parameter EN_POLARITY = 1'b1;

  FDPE_1 #(
    .INIT(INIT),
  ) _TECHMAP_REPLACE_ (
    .D(D), .Q(Q), .C(C), .CE(CE), .PRE(PRE)
  );
endmodule
