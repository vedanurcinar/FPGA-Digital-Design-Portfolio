module Tactical_Missile_Ignition(
  input wire Commander_A,
  input wire Commander_B,
  input wire Commander_C,
  output wire Launch_Signal
);
  assign Launch_Signal=(Commander_A & Commander_B)|(Commander_A & Commander_C)|(Commander_B & Commander_C);
endmodule