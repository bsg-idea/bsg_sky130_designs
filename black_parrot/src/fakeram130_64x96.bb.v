module fakeram130_64x96
(
`ifdef USE_POWER_PINS
    vccd1,  // User area 1 1.8V power
    vssd1,  // User area 1 digital ground
`endif

   rd_out,
   addr_in,
   we_in,
   wd_in,
   w_mask_in,
   clk,
   ce_in
);
   parameter BITS = 96;
   parameter WORD_DEPTH = 64;
   parameter ADDR_WIDTH = 6;
   parameter corrupt_mem_on_X_p = 1;

   output reg [BITS-1:0]    rd_out;
   input  [ADDR_WIDTH-1:0]  addr_in;
   input                    we_in;
   input  [BITS-1:0]        wd_in;
   input  [BITS-1:0]        w_mask_in;
   input                    clk;
   input                    ce_in;
`ifdef USE_POWER_PINS
   inout vccd1;  // User area 1 1.8V power
   inout vssd1;  // User area 1 digital ground
`endif


endmodule
