CFLAGS=-Wall -nostdlib -static -mabi=lp64f -c

# If you change any variable here, you also need to update it in install.sh
INSTALL_DIR=/opt/riscv
CC=$(INSTALL_DIR)/bin/riscv64-unknown-linux-gnu-gcc
GDB=$(INSTALL_DIR)/bin/riscv64-unknown-linux-gnu-gdb
NM=$(INSTALL_DIR)/bin/riscv64-unknown-linux-gnu-nm

all: fib.riscv.disassembly.txt fib.riscv.compressed.disassembly.txt fib.riscv.optimized.disassembly.txt fib.riscv.compressed.optimized.disassembly.txt

fib.riscv.disassembly.txt: fib_normal
	echo "Disassembly for RISC-V (normal):" > $@
	$(GDB) $^ -batch -ex 'disassemble/r fib' >> $@
	echo "Code size:" >> $@
	$(NM) -S -t d $^ | grep "T fib" >> $@
	echo "The second column is the number of bytes (decimal)" >> $@

fib.riscv.compressed.disassembly.txt: fib_compressed
	echo "Disassembly for RISC-V (with compressed extension):" > $@
	$(GDB) $^ -batch -ex 'disassemble/r fib' >> $@
	echo "Code size:" >> $@
	$(NM) -S -t d $^ | grep "T fib" >> $@
	echo "The second column is the number of bytes (decimal)" >> $@

fib.riscv.optimized.disassembly.txt: fib_normal_optimized
	echo "Disassembly for RISC-V (normal, with -Os):" > $@
	$(GDB) $^ -batch -ex 'disassemble/r fib' >> $@
	echo "Code size:" >> $@
	$(NM) -S -t d $^ | grep "T fib" >> $@
	echo "The second column is the number of bytes (decimal)" >> $@

fib.riscv.compressed.optimized.disassembly.txt: fib_compressed_optimized
	echo "Disassembly for RISC-V (compressed, with -Os):" > $@
	$(GDB) $^ -batch -ex 'disassemble/r fib' >> $@
	echo "Code size:" >> $@
	$(NM) -S -t d $^ | grep "T fib" >> $@
	echo "The second column is the number of bytes (decimal)" >> $@

# The difference between fib_normal and fib_compressed is the "c" at the end of "-march"
# It basically says to use the "compressed" RISC-V extension
fib_normal: ../programs/fib.c
	$(CC) $(CFLAGS) -march=rv64g $^ -o $@

fib_normal_optimized: ../programs/fib.c
	$(CC) $(CFLAGS) -Os -march=rv64g $^ -o $@

fib_compressed: ../programs/fib.c
	$(CC) $(CFLAGS) -march=rv64gc $^ -o $@

fib_compressed_optimized: ../programs/fib.c
	$(CC) $(CFLAGS) -Os -march=rv64gc $^ -o $@

.PHONY:
# The following installs dependencies for Ubuntu, see
# https://github.com/riscv/riscv-gnu-toolchain for info on other distros
dependencies:
	bash ./install.sh

.PHONY:
clean:
	rm -f fib.*.disassembly.txt fib_*


