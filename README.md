# MIPS-Pipelined-Datapath

The overall goal of the project was to create a 5 stage pipelined data path in Verilog that supported the MIPS architecture and was able to run a video compression algorithm. The project was split into 3 main phases:

## Phase 1

Create a [Variable Block Size Motion Estimation (VBSME) program](<Phase 1/vbsme.s>) using MIPS that takes as input a frame of integers and a window of integers:
```
frame = 0, 0, 0, 0,   window = 1, 2
        0, 0, 0, 0,            3, 4
        0, 1, 2, 0,
        0, 3, 4, 0
```
The program then iterates through the frame in a spiral search pattern to find the location of the block of integers in the frame that most closely matches the window. This is done by calculating the Sum of Absolute Difference (SAD) between the window and block of integers in the frame. For the above example, the program would return `[2, 1]`, representing the `[row, column]` of the upper right index of the closest matching window in the frame.

## Phase 2

Using Verilog, create a [data path](<Phase 2/Top Level/Datapath.v>) capable of running the VBSME program with the following characteristics: 
- 5 stages with 4 pipeline registers
- Forwarding and Hazard Detection to detect/resolve dependencies and data hazards
- [ALU core](<Phase 2/Data Path Components/ALU32Bit.v>) with capability to process [53 MIPS instruction types](<Phase 2/Mips_Instructions_Controller_Signals.xlsx>)
- [Instruction Memory](<Phase 2/Data Path Components/InstructionMemory.v>) to store VBSME program
- [Data Memory](<Phase 2/Data Path Components/DataMemory.v>) to store frame and window
- [Controller](<Phase 2/Data Path Components/Controller.v>) to decode MIPS instructions and regulate data path

## Phase 3

Implement the design on a NEXYS Atrix-7 FPGA. Vivado is used to synthesize, implement, and generate a bitstream for the design. The FPGA's display is used to show the results of the VBSME program as it iterates through frames of various sizes. 
          
