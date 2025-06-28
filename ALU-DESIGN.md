🚀 Multi-Bit ALU Design & Simulation | 4-bit | 8-bit | 16-bit | 32-bit 🔧
Tools Used: ModelSim | Xilinx Vivado
Languages: Verilog / VHDL

I’m excited to share a recent digital design project where I developed and simulated Arithmetic Logic Units (ALUs) of increasing complexity: 4-bit, 8-bit, 16-bit, and 32-bit versions. This project was a deep dive into hardware architecture and gave me hands-on experience with FPGA design flow, logic simulation, and synthesis.

🔍 Project Overview:
The ALU (Arithmetic Logic Unit) is a core component of a CPU responsible for performing arithmetic and logical operations. For this project, I incrementally built scalable ALUs that perform the following operations:

Addition & Subtraction

Bitwise AND, OR, XOR

Increment / Decrement

Logical Shift Left/Right

Set-on-Less-Than (SLT)

Zero Flag Detection

Overflow Handling

Each design version (4, 8, 16, 32-bit) maintained modularity and followed good coding practices for reuse and scalability.

⚙️ Design Approach:

Modular Architecture: Each ALU is designed as a parameterized module using Verilog/VHDL, allowing size changes with minimal modifications.

Control Unit Integration: An ALU_control module interprets function codes to select the correct operation.

Combinational Logic Design: Used minimal sequential logic to optimize performance and reduce complexity.

Testbenches in ModelSim: Created comprehensive testbenches for each ALU size with coverage for all operations and edge cases (e.g., overflow, zero result).

🧪 Simulation with ModelSim:
Using ModelSim, I validated each ALU's functional correctness. Waveform analysis helped debug and verify operations across all input ranges. Special attention was given to:

Overflow detection in signed arithmetic

Propagation of carry/borrow in multi-bit add/subtract

Flag register outputs like Zero and Overflow

💡 Synthesis & Implementation in Xilinx Vivado:
After functional simulation, I synthesized each ALU using Vivado on a Xilinx FPGA target (Basys3 / Artix-7).
Key steps included:

RTL analysis and logic optimization

FPGA resource estimation (LUTs, FFs, DSP slices)

Timing analysis to ensure no setup/hold violations

I/O mapping and constraints definition
Post-implementation, I validated the design in hardware via switches (inputs) and LEDs (outputs) for small ALU sizes.

📈 Outcomes & Learnings:

Built scalable digital systems from 4-bit up to 32-bit logic

Learned efficient simulation-debugging flow using ModelSim

Mastered FPGA design flow from RTL to bitstream using Vivado

Reinforced concepts in computer architecture and digital electronics
