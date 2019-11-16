/*
   This file was generated automatically by Alchitry Labs version 1.1.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module move_8 (
    input [3:0] current_pos,
    output reg [15:0] reg_led
  );
  
  
  
  wire [16-1:0] M_num_to_seg_out;
  reg [4-1:0] M_num_to_seg_in;
  decoder_18 num_to_seg (
    .in(M_num_to_seg_in),
    .out(M_num_to_seg_out)
  );
  
  always @* begin
    reg_led = 4'bxxxx;
    M_num_to_seg_in = current_pos;
    reg_led = M_num_to_seg_out;
  end
endmodule