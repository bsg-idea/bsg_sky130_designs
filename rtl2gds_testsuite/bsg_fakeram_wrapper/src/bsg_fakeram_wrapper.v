module bsg_fakeram_wrapper
(
   rd_out,
   addri,
   wei,
   wdi,
   wmski,
   clk,
   cei,
);
   parameter BITS = 64;
   parameter ADDR_WIDTH = 9;

   output reg [BITS-1:0]    rd_out;
   input  [ADDR_WIDTH-1:0]  addri;
   input                    wei;
   input  [BITS-1:0]        wdi;
   input  [BITS-1:0]        wmski;
   input                    clk;
   input                    cei;
//   input VPWR, VGND;
   
  // assign VPWR = 1'b1;
   //assign VGND = 1'b0;
   fakeram130_512x64 fakeram1 (r_out, addri, wei, wdi, wmski, clk, cei);

   assign rd_out = ~r_out;
  
endmodule

