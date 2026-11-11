# GPIO IP Design and SoC Integration – Task 2

## 1. GPIO IP RTL
The GPIO peripheral was implemented using Verilog HDL in `gpio.v`. It contains a 32-bit register to store data written by the processor and return the stored value during read operations.

## 2. SoC Integration
The GPIO IP was integrated into the existing RISC-V SoC in `riscv.v`.

The integration includes:
- Memory-mapped address decoding.
- GPIO write enable generation.
- Processor write-data connection.
- GPIO read-data connection to the SoC read-data multiplexer.

## 3. Address Used
GPIO memory-mapped address: `0x00400020`

## 4. How CPU Accesses the IP
The CPU accesses the GPIO peripheral using memory-mapped I/O (MMIO). Firmware uses a volatile 32-bit pointer to write data to and read data from the GPIO address. The SoC decodes the address and enables the GPIO peripheral.

## 5. Simulation and Validation
The complete SoC was simulated using Icarus Verilog.

Test value: `0x12345678`

Simulation output:

    GPIO WRITE = 12345678
    GPIO READ  = 12345678
    GPIO TEST PASSED

The simulation validated:
- CPU GPIO write operation.
- GPIO register data storage.
- CPU GPIO read operation.
- Correct comparison of written and read values.
- UART PASS message.

## 6. Conclusion
The GPIO IP was successfully implemented and integrated into the RISC-V SoC. The complete SoC simulation passed the GPIO write and read verification.

Note: Physical FPGA pin-level validation has not been claimed.
