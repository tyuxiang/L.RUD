/*
   This file was generated automatically by Alchitry Labs version 1.1.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     WIDTH = 4
*/
module decoder_18 (
    input [3:0] in,
    output reg [15:0] out
  );
  
  localparam WIDTH = 3'h4;
  
  
  always @* begin
    out = 1'h0;
    out[(in)*1+0-:1] = 1'h1;
  end
endmodule
