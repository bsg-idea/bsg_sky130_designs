module realram_8x1024(
   rd_out,
   addri,
   wei,
   wdi,
   wmski,
   clk,
   cei,
); 
   parameter BITS = 8;
   parameter ADDR_WIDTH = 10;

   output reg [BITS-1:0]    rd_out;
   input  [ADDR_WIDTH-1:0]  addri;
   input                    wei;
   input  [BITS-1:0]        wdi;
   input  [BITS-1:0]        wmski;
   input                    clk;
   input                    cei;
   wire  [BITS-1:0]    r_out;
   wire csb1;
  assign csb1 = 1'b1;
  wire [BITS-1:0] do;

   sky130_sram_1kbyte_1rw1r_8x1024_8 realram1
   (
`ifdef USE_POWER_PINS
	.vccd1(vccd1),
	.vssd1(vssd1),
`endif
// Port 0: RW
    .clk0(clk),.csb0(cei),.web0(wei),.wmask0(wmski),.addr0(addri),.din0(wdi),.dout0(r_out),
// Port 1: R
    .clk1(clk),.csb1(csb1),.addr1(addri),.dout1(do)
  );

   assign rd_out = ~r_out;

endmodule



