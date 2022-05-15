#!/usr/bin/env bash
set -euo pipefail

# Instructions from https://imsai.dev/posts/build_llvm/
cd /opt

if [ -f "/opt/llvm-project/llvm/cmake-build/bin/clang" ]; then
    echo "LLVM for Z80 already installed"
else
    echo "Installing LLVM for Z80"
    sudo rm -rf "llvm-project" || true

    sudo apt-get install -y gcc cmake clang build-essential libxml2 lld-10 z80dasm valgrind

    sudo git clone https://github.com/gt-retro-computing/llvm-project

    cd llvm-project/llvm

    sudo rm -rf cmake-build
    sudo mkdir -p cmake-build
    cd cmake-build

    sudo cmake -DLLVM_TARGETS_TO_BUILD="" -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD="Z80" -DLLVM_ENABLE_PROJECTS="clang" ../

    if [ -n "$CI" ]; then
        sudo make clang llvm-mc llc llvm-objdump llvm-nm llvm-objcopy -j1
    else
        sudo make clang llvm-mc llc llvm-objdump llvm-nm llvm-objcopy -j$(nproc)
    fi
fi
