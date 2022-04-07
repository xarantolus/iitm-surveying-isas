#!/usr/bin/env bash
set -euo pipefail


INSTALL_DIR=/opt/riscv
CC=$INSTALL_DIR/bin/riscv64-unknown-linux-gnu-gcc
GDB=$INSTALL_DIR/bin/riscv64-unknown-linux-gnu-gdb
NM=$INSTALL_DIR/bin/riscv64-unknown-linux-gnu-nm

if [ -f "$CC" ] && [ -f "$GDB" ] && [ -f "$NM" ]; then
    echo "All RISC-V tools are already installed"
else
    echo "This will do a manual install of the RISC-V toolchain. This might or might not work on your specific system."

    sudo apt-get install -y autoconf automake autotools-dev curl python3 libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev

    cd /opt

    git clone https://github.com/riscv/riscv-gnu-toolchain

    cd riscv-gnu-toolchain

    chmod +x ./configure

    sudo ./configure --prefix=$INSTALL_DIR

    sudo make linux
fi
