# 1-Bit Half Adder Design

This repository contains a basic combinational logic circuit design of a **1-Bit Half Adder** implemented in SystemVerilog/Verilog. The design has been fully simulated and verified using Icarus Verilog on EDA Playground.

## Overview
A Half Adder is a fundamental digital circuit that performs the addition of two single-bit binary numbers. It is a combinational circuit, meaning it does not require a clock signal (`clk`) or memory elements; the outputs change instantly based on the current inputs.

### Ports
- **Inputs:**
  - `A`: 1-bit input operand
  - `B`: 1-bit input operand
- **Outputs:**
  - `Sum`: 1-bit output representing the addition result
  - `Carry`: 1-bit output representing the overflow (carry-out) bit

## Mathematical Logic & Truth Table
When adding two binary digits, the maximum possible result is $2_{10}$ ($10_{2}$). Since a single output bit can only hold 0 or 1, a second bit (`Carry`) is required to handle the overflow.

| Input A | Input B | Carry (Elde) | Sum (Toplam) | Decimal Value |
|:-------:|:-------:|:------------:|:------------:|:-------------:|
|    0    |    0    |      0       |      0       |       0       |
|    0    |    1    |      0       |      1       |       1       |
|    1    |    0    |      0       |      1       |       1       |
|    1    |    1    |      1       |      0       |       2       |

## Hardware Architecture
The internal structure of the Half Adder is mapped directly using primitive logic gates:
1. **Sum Output:** Implemented using an **XOR (Exclusive OR)** gate because the Sum bit is high only when the inputs are different ($A \neq B$).
2. **Carry Output:** Implemented using an **AND** gate because the Carry bit is high only when both inputs are simultaneously high ($A = 1$ AND $B = 1$).

```verilog
// Design Gate Implementation
assign Sum   = A ^ B; // XOR gate as a difference detector
assign Carry = A & B; // AND gate for overflow detection