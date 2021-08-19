module hard_mem_1rw_d1024_w46_wrapper (
    clk_i,
    reset_i,
    data_i,
    addr_i,
    v_i,
    w_i,
    data_o
  );

   parameter BITS = 46;
   parameter WORD_DEPTH = 1024;
   parameter ADDR_WIDTH = 10;
   parameter corrupt_mem_on_X_p = 1;

   output reg [BITS-1:0]    data_o;
   input  [ADDR_WIDTH-1:0]  addr_i;
   input   reset_i ;
   input                    w_i;
   input  [BITS-1:0]        data_i;
   wire  [BITS-1:0]        w_mask_in;
   input                    clk_i;
   input                    v_i;

//assign reset_i = 1'b0;
assign w_mask_in = 46'd0;

fakeram130_1024x46 fakeram2
(
   data_o,
   addr_i,
   w_i,
   data_i,
   w_mask_in,
   clk_i,
   v_i
);
   


endmodule
