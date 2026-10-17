# Sequential MAC Unit

## Overview

This project implements a **sequential Multiply-Accumulate (MAC) unit** using Verilog/SystemVerilog. The design processes 8-bit input data and weight coefficients supplied sequentially to perform multiply-accumulate operations.

A MAC unit is a fundamental digital hardware component used in digital signal processing (DSP), convolution operations, and hardware acceleration.

## Features

- Sequential processing of input data and weight coefficients.
- 8-bit input data and weight coefficient interfaces.
- Sequence length of 8.
- Functional simulation of the MAC operation.
- RTL-based hardware design using Verilog/SystemVerilog.

## Architecture

The design receives input data and weight coefficients sequentially. The MAC unit performs multiplication and accumulates the resulting products according to the implemented control sequence.

Conceptually, the operation is:

\[
Y = \sum_{i=0}^{7} x_i w_i
\]

where:
- \(x_i\) represents the input data samples.
- \(w_i\) represents the corresponding weight coefficients.
- \(Y\) represents the accumulated output.

## Repository Structure

```text
sequential-mac-unit/
├── mac_seq_a.sv
├── tb_mac_seq_a.sv
└── README.md
```

*The filenames above are examples; adjust them to match the files in your repository.*

## Simulation

The design can be simulated using a compatible Verilog/SystemVerilog simulator, such as Cadence Xcelium.

The testbench applies input sequences and weight coefficients to verify the functional behavior of the MAC unit.

```text
xrun -64bit -sv -access +rwc mac_seq_a.sv tb_mac_seq_a.sv -l mac_seq_a.log
```

## Simulation Results

The design was simulated using Cadence Xcelium, and the resulting signal waveforms were inspected using the waveform viewer.

### Output Waveform

<img width="940" height="431" alt="image" src="https://github.com/user-attachments/assets/f4d6192d-372f-4e4a-a451-46134eb44bcf" />

The waveform shows the simulated signal activity during the sequential MAC operation.

### Simulation Environment

- Simulator: Cadence Xcelium
- Design language: SystemVerilog
- Verification: Testbench-driven functional simulation

## Applications

- Digital signal processing
- Multiply-accumulate datapaths
- RTL design and functional verification
- Hardware acceleration fundamentals

## Technologies

- Verilog/SystemVerilog
- RTL Design
- Functional Simulation
- Cadence Xcelium

## Author

Developed as a digital hardware design project focused on sequential MAC architecture and functional verification.
