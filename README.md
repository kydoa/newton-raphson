# newton-raphson

[![Language](https://img.shields.io/badge/Languages-C%20|%20MIPS%20Assembly-blue)](mips1.asm)
[![Algorithm](https://img.shields.io/badge/Algorithm-Newton--Raphson-green)](main.c)

This repository provides a dual-language implementation of the Newton-Raphson algorithm for calculating square roots, comparing high-level logic in C with low-level execution in MIPS assembly.

## Table of Contents
- [What This Project Does](#what-this-project-does)
- [Why This Project Is Useful](#why-this-project-is-useful)
- [Architecture Overview](#architecture-overview)
- [Instruction Set](#instruction-set)
- [Getting Started](#getting-started)
- [Usage Examples](#usage-examples)
- [Project Structure](#project-structure)
- [Where To Get Help](#where-to-get-help)
- [Maintainers and Contributions](#maintainers-and-contributions)

## What This Project Does
The project implements the Newton-Raphson algorithm to approximate square roots based on user-defined parameters $x$ and $i$. Both implementations allow the user to abort execution by entering -1 as a parameter.

## Why This Project Is Useful
This repository serves as a technical bridge between programming abstractions. It demonstrates how a recursive mathematical function written in C can be translated into MIPS assembly instructions that manage system calls and register-level data movement.

## Architecture Overview
The project features two distinct architectural approaches:
* **C Implementation:** Utilizes a recursive functional approach via the `sqrt_nr(int x, int i)` function.
* **MIPS Implementation:** Uses an imperative approach, leveraging MIPS `syscall` to interact with the user and storing parameters $x$ and $i$ directly into registers `$s0` and `$s1` respectively.

## Instruction Set
The MIPS implementation utilizes the following core instructions:
| Instruction | Purpose |
| --- | --- |
| `li` | Load immediate value into a register |
| `syscall` | Invoke system services (e.g., reading input or printing strings) |
| `move` | Copy data between registers (e.g., moving input to `$s1`) |

## Getting Started
### Prerequisites
* A C compiler (such as `gcc`).
* A MIPS simulator (such as **MARS** or **SPIM**).

## Usage Examples
### Running the C Implementation
```bash
gcc main.c -o sqrt_nr -lm
./sqrt_nr
```

### Running the MIPS Implementation
1. Open `mips1.asm` in your MIPS simulator.
2. Assemble and run the code.
3. Follow the prompts to enter parameters $x$ and $i$.

## Project Structure
* `main.c`: High-level recursive implementation of the algorithm.
* `mips1.asm`: Low-level assembly implementation using MIPS architecture.

## Where To Get Help
For issues regarding logic errors in the recursion, refer to the C source code. For issues regarding register management or system calls, refer to the MIPS assembly file.

## Maintainers

Maintainer:

- [@kydoa](https://github.com/kydoa)
