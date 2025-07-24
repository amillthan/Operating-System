# Operating-System
Creating Simple Operating System
Here's the content for a clean and professional **`README.md`** file you can use in your GitHub repository for **Amilthan OS**:

---

````markdown
# Amilthan OS

A tiny real-mode operating system written in x86 Assembly that boots up and displays a custom message:

> hello, welcome Amilthan OS

This project is perfect for beginners who want to learn how bootloaders and BIOS-level assembly work. It runs entirely in QEMU and fits within a 512-byte boot sector.

---

## Features

- BIOS bootable (real-mode, 16-bit)
- Displays custom welcome message using BIOS interrupts
- Bootloader size: exactly 512 bytes
- Runs in QEMU (no OS or kernel required)

---

## Requirements

- Linux or WSL (Windows Subsystem for Linux)
- [`NASM`](https://www.nasm.us/) - Netwide Assembler
- [`QEMU`](https://www.qemu.org/) - Emulator for testing

### Install NASM & QEMU

```bash
sudo apt update
sudo apt install nasm qemu
````

---

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/amilthan-os.git
cd amilthan-os
```

### 2. Build the Bootloader

```bash
nasm -f bin bootloader.asm -o bootloader.bin
```

### 3. Run with QEMU

```bash
qemu-system-x86_64 -drive format=raw,file=bootloader.bin
```

You should see the following message:

```
hello, welcome Amilthan OS
```

---

## How It Works

* BIOS loads the boot sector to memory address `0x7C00`.
* The bootloader prints each character using `int 0x10`, the BIOS teletype function.
* Execution halts in an infinite loop after printing the message.

---

## bootloader.asm (Code Summary)

```asm
[org 0x7c00]

start:
    mov si, message

print_loop:
    lodsb
    cmp al, 0
    je hang
    mov ah, 0x0E
    int 0x10
    jmp print_loop

hang:
    jmp $

message db 'hello, welcome Amilthan OS', 0
times 510 - ($ - $$) db 0
dw 0xAA55
```

---

## Ideas for Extensions

* Add color and cursor control
* Accept user keyboard input
* Implement a second-stage bootloader
* Load and execute external programs or kernels

---

## License

This project is open-source under the [MIT License](LICENSE).

---

## Credits

Inspired by many beginner OS tutorials and bootloader projects. Built with 💻, curiosity, and QEMU.

---

## Author

**Amilthan** — [GitHub](https://github.com/amillthan)

```

---

Let me know if you want me to:

- Add a `LICENSE` file
- Create a `.gitignore`
- Format this for Markdown preview
- Include GitHub Actions for auto-building the bootloader

Just say the word!
```
