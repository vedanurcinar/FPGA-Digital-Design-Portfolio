# Sequential Memory Unit (D Flip-Flop)
## Synchronous Hardware Logic Design

### Project Overview
This project demonstrates the fundamental building block of sequential logic hardware: The D-Type Flip-Flop (DFF). Unlike combinational logic, this system possesses memory and is strictly synchronized with a system clock signal. It forms the basis for registers, state machines, and processor architectures.

### Hardware Architecture
The module is designed to capture and hold a single bit of data. The internal memory (`reg Q`) is isolated from asynchronous input noise and only updates its state at a specific, rhythmic moment.
*   **Inputs:** `clk` (System Clock), `D` (Data Input)
*   **Output:** `Q` (Registered Output)
*   **Trigger Mechanism:** Positive Edge-Triggered (`posedge clk`)

### Development & Simulation Tools
*   **Hardware Description Language (HDL):** SystemVerilog
*   **Compiler / Simulator:** Icarus Verilog 12.0
*   **Waveform Viewer:** EPWave

### Testbench & Waveform Analysis
The simulation environment includes a clock generator producing a continuous signal with a 10ns period (`always #5 clk = ~clk`). 
The testbench deliberately injects data (`D`) at asynchronous intervals (e.g., at 12ns) to verify that the hardware is effectively "blind" to input changes until the exact moment of the clock's rising edge (at 15ns). The waveform successfully proves that `Q` only inherits the value of `D` precisely at the `posedge clk`, demonstrating true synchronous memory behavior.

### Repository Structure
*   `1_Design_Code.sv`: The D Flip-Flop RTL module.
*   `2_Testbench_Code.sv`: The simulation environment with the clock generator and stimulus.
*   `3_Waveform_Simulation.png`: The waveform proving edge-triggered memory retention.