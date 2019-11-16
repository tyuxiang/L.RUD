/*
   This file was generated automatically by Alchitry Labs version 1.1.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module shft_15 (
    input [15:0] firstNumber,
    input [3:0] secondNumber,
    input [1:0] alufn,
    output reg [15:0] answer
  );
  
  
  
  always @* begin
    answer = 4'bxxxx;
    if (alufn == 2'h0) begin
      answer = firstNumber << (secondNumber);
    end
    if (alufn == 2'h1) begin
      answer = firstNumber >> (secondNumber);
    end
    if (alufn == 2'h3) begin
      answer = $signed(firstNumber) >>> (secondNumber);
    end
  end
endmodule
