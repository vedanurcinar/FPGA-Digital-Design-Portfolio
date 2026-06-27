# Tactical Missile Ignition System
## Combinational Logic Hardware Design

### Project Overview
This project implements a secure, 3-input hardware voting system (Majority Voter) designed for a tactical missile ignition protocol. The system ensures that a missile launch sequence is only initiated if at least two out of three authorized commanders provide a simultaneous launch signal. This prevents accidental launches caused by a single point of failure or individual error.

### Hardware Architecture
The architecture is built using pure **Combinational Logic**. The digital logic design was mathematically optimized using a Karnaugh Map (K-Map) to minimize gate delays and reduce hardware complexity.

*   **Inputs:** `Commander_A`, `Commander_B`, `Commander_C` (3x 1-bit Wires)
*   **Output:** `Launch_Signal` (1-bit Wire)
*   **Boolean Equation:** `Launch_Signal = (A & B) | (A & C) | (B & C)`

### Development & Simulation Tools
*   **Hardware Description Language (HDL):** Verilog / SystemVerilog
*   **Simulation Environment:** EDA Playground
*   **Compiler / Simulator:** Icarus Verilog 12.0
*   **Waveform Viewer:** EPWave

### Testbench & Verification
A comprehensive `Testbench` was developed to verify the gate-level design. The simulation injects all 8 possible input combinations (from `000` to `111`) into the `Unit Under Test (UUT)` to validate the logic accuracy. 

*Simulation explicitly confirms that the `Launch_Signal` remains `0` (Low) during isolated single-commander inputs, and correctly transitions to `1` (High) only when a strict majority (2 or 3 inputs) is detected.*

### Repository Structure
*   `1_Design_Code.sv`: The main Verilog module containing the combinational logic.
*   `2_Testbench_Code.sv`: The automated simulation environment injecting stimulus into the UUT.
*   `3_Waveform_Simulation.png`: EPWave output demonstrating the successful logic states over time.