module D_Flip_Flop(
  input wire clk, //sistem sinyali
  input wire D, // data girisi
  output reg Q  // veriyi saklayacak kısım 
);
  // clk yukarı vurduğunda  ( positive edge ) içerideki islemi yap
  always @(posedge clk) begin
    Q <=D; // D den o anki veriyi al, Q'nun içine kopyala ve hapset 
  end
endmodule
