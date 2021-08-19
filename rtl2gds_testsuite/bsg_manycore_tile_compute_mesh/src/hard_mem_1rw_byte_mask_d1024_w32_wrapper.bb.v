module hard_mem_1rw_byte_mask_d1024_w32_wrapper 
(
    clk_i,
    reset_i,
    v_i,
    w_i,
    addr_i,
    data_i,
    write_mask_i,
    data_o
  );

   parameter BITS = 32;
   parameter WORD_DEPTH = 1024;
   parameter ADDR_WIDTH = 10;
   parameter corrupt_mem_on_X_p = 1;

   output reg [BITS-1:0]    data_o;
   input  [ADDR_WIDTH-1:0]  addr_i;
   input                    w_i;
   input reset_i;
   input  [BITS-1:0]        data_i;
   input  [BITS-1:0]        write_mask_i;
   input                    clk_i;
   input                    v_i;
   
  // assign reset_i = 1'b0;


fakeram130_1024x32 fakeram1
(
   data_o,
   addr_i,
   w_i,
   data_i,
   write_mask_i,
   clk_i,
   v_i
);
  

endmodule
