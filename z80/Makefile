# If you change any variable here, you also need to update it in install.sh
CC=/opt/llvm-project/llvm/cmake-build/bin/clang
OBJDUMP=/opt/llvm-project/llvm/cmake-build/bin/llvm-objdump
#NM=/opt/llvm-project/llvm/cmake-build/bin/llvm-nm
CFLAGS=--target=z80-unknown-none-code16 -fintegrated-as -c -nostdlib -static

all: fib fib.z80.disassembly.txt fib.z80.optimized.disassembly.txt fib_optimized.asm fib.asm

fib.z80.disassembly.txt: fib
	echo "Disassembly for Z80:" > $@
	$(OBJDUMP) --arch-name=z80 --section=.text -DC $^ >> $@
	echo "Code size:" >> $@
	$(OBJDUMP) --arch-name=z80 -h $^ >> $@
	echo "The size (hexadecimal) of the .text section is the size of our fib function" >> $@

fib.z80.optimized.disassembly.txt: fib_optimized
	echo "Disassembly for Z80 (with -Oz):" > $@
	$(OBJDUMP) --arch-name=z80 --section=.text -DC $^ >> $@
	echo "Code size:" >> $@
	$(OBJDUMP) --arch-name=z80 -h $^ >> $@
	echo "The size (hexadecimal) of the .text section is the size of our fib function" >> $@


fib: ../programs/fib.c
	$(CC) $(CFLAGS) $^ -o $@
	rm -f fib-*.tmp

fib_optimized: ../programs/fib.c
	$(CC) $(CFLAGS) -Oz $^ -o $@
	rm -f fib-*.tmp

fib.asm: ../programs/fib.c
	$(CC) $(CFLAGS) $^ -S -o $@
	rm -f fib-*.tmp

fib_optimized.asm: ../programs/fib.c
	$(CC) $(CFLAGS) -Oz $^ -S -o $@
	rm -f fib-*.tmp

.PHONY:
dependencies:
	bash ./install.sh

.PHONY:
clean:
	rm -f fib fib_optimized fib*.asm fib.*.disassembly.txt fib-*.tmp

