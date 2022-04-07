# If you change any variable here, you also need to update it in install.sh
CC=/opt/emsdk/upstream/emscripten/emcc
OBJDUMP=/opt/emsdk/upstream/bin/llvm-objdump
# emnm doesn't seem to work correctly, it always outputs the size as "0"
# we can however use objdump to get the code size
#NM=/opt/emsdk/upstream/emscripten/emnm
CFLAGS=-c

all: fib.wasm.disassembly.txt fib.wasm.optimized.disassembly.txt

fib.wasm.disassembly.txt: fib.wasm
	echo "Disassembly for Wasm (using emscripten):" > $@
	$(OBJDUMP) --disassemble-symbols=fib $^ >> $@
	echo "Code size:" >> $@
	$(OBJDUMP) -h $^ >> $@
	echo "The size (hexadecimal) of the code segment is the size of our fib function" >> $@


fib.wasm.optimized.disassembly.txt: fib_optimized.wasm
	echo "Disassembly for Wasm (using emscripten):" > $@
	$(OBJDUMP) --disassemble-symbols=fib $^ >> $@
	echo "Code size:" >> $@
	$(OBJDUMP) -h $^ >> $@
	echo "The size (hexadecimal) of the code segment is the size of our fib function" >> $@


fib.wasm: ../programs/fib.c
	$(CC) $(CFLAGS) $^ -o $@
	rm -f fib-*.wasm.tmp

fib_optimized.wasm: ../programs/fib.c
	$(CC) $(CFLAGS) -Oz $^ -o $@
	rm -f fib_optimized-*.wasm.tmp

.PHONY:
dependencies:
	bash ./install.sh

.PHONY:
clean:
	rm -f fib.wasm* fib_optimized.wasm*
