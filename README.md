# Synchronous-FIFO
This project implements a parameterized synchronous FIFO (First-In-First-Out) memory in Verilog HDL. The FIFO supports configurable data width and depth, and operates under a single clock domain (synchronous).
It efficiently manages data flow between producer and consumer circuits using circular buffer logic, while handling full and empty conditions.
The design is verified using testbenches that simulate corner cases such as simultaneous read/write, overflow, and underflow conditions, ensuring reliable and cycle-accurate operation.

Features:
Parameterized design – configurable DATA_WIDTH and DEPTH.
Buffer architecture for efficient memory utilization.
Full & Empty flag generation for robust flow control.
Synchronous operation – single clock domain.
Reset support for initialization.
Verilog testbench for simulation and validation.

Applications:
Hardware buffers in SoCs and FPGAs.
Pipelined processors (instruction/data buffering).
Data streaming systems (audio, video, network packets).
Producer–consumer synchronization.

The images of both simulation and schematic are attached in the repository with the respective names.

Developed By: Shivam Singla
Feel free for any kind of suggestions and pull requests.
