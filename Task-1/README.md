# Task-1: Environment Setup & RISC-V Reference Bring-Up

## 1. Objective
Set up the RISC-V reference environment in GitHub Codespaces, execute the reference program, and verify the VSDFPGA firmware and SoC simulation.

## 2. Environment Setup
- **Platform:** GitHub Codespaces
- **Repositories:** `vsd-riscv2` and `vsdfpga_labs`
- **Local PC setup:** Not used

## 3. RISC-V Reference Program

- **Location:** `vsd-riscv2/samples/`
- **Example program:** `sum1ton.c`
- **Compiler:** `riscv64-unknown-elf-gcc`
- **Simulator:** Spike with `pk`

### Observed Output

```text
Sum from 1 to 9 is 45
```

## 4. VSDFPGA Firmware Verification

- **Directory:** `basicRISCV/Firmware/`
- **Build command:** `make riscv_logo.bram.hex`
- **Result:** The firmware file was already up to date when checked.

## 5. SoC Simulation

A simulation was run using a temporary clock-primitive stub for FPGA-specific iCE40 primitives. The simulation log showed UART write activity and RISC-V banner characters.

**Note:** This verifies UART activity in simulation; physical FPGA board output was not tested.

## 6. Understanding Questions and Answers

### Q1. Where is the RISC-V program located in `vsd-riscv2`?

The reference programs are located in the `samples/` directory. For example, `samples/sum1ton.c` calculates the sum of numbers from 1 to 9.

### Q2. How is the program compiled and loaded into memory?

The reference program is compiled using `riscv64-unknown-elf-gcc` and executed using Spike with `pk`. In the SoC firmware flow, RTL memory loads `firmware.hex` using the Verilog system task `$readmemh`.

### Q3. How does the processor access memory and memory-mapped I/O?

The processor uses memory read and write operations. Address-decoding logic in the SoC distinguishes RAM accesses from I/O accesses and selects peripherals such as UART or GPIO.

### Q4. Where would a new FPGA IP logically integrate?

A new IP would integrate as a peripheral in the SoC RTL. It would connect to the required address-decoding, clock, reset, read-data, and write-control signals so the processor can access its registers.

## 7. Evidence Screenshots

Place the following screenshots in the `Evidence/` directory:

1. `Task1_RISCV_Reference_Run.png` — successful RISC-V reference program execution.
2. `task1_vsdfpga_firmware_build.png` — firmware build status.
3. `task1_soc_uart_simulation_500ms.png` — SoC UART simulation log.

## 8. Conclusion

The RISC-V reference program was executed successfully, the VSDFPGA firmware file was confirmed up to date, and the SoC simulation showed UART transmission activity.

**Environment confirmation:** GitHub Codespaces only.
