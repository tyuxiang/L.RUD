/*
   This file was generated automatically by Alchitry Labs version 1.1.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module convert_to_alu_7 (
    input [1:0] lrud,
    output reg [5:0] alufn,
    output reg [15:0] value
  );
  
  
  
  always @* begin
    alufn = 24'bxxxxxxxxxxxxxxxxxxxxxxxx;
    value = 64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if (lrud == 2'h0) begin
      alufn = 6'h01;
      value = 16'h0001;
    end else begin
      if (lrud == 2'h1) begin
        alufn = 6'h00;
        value = 16'h0001;
      end else begin
        if (lrud == 2'h2) begin
          alufn = 6'h01;
          value = 16'h0004;
        end else begin
          if (lrud == 2'h3) begin
            alufn = 6'h00;
            value = 16'h0004;
          end
        end
      end
    end
  end
endmodule
