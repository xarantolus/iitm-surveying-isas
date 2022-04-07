#!/usr/bin/env bash
set -euo pipefail

cd /opt
if [ -d "emsdk" ]; then
    echo "emsdk already downloaded"
else
    echo "Installing emsdk for Wasm"
    git clone https://github.com/emscripten-core/emsdk
fi

cd emsdk

chmod +x ./emsdk

./emsdk install latest
./emsdk activate latest

