CC=arm-linux-gnueabihf-gcc
CFLAGS=-Wall -static -march="armv8-a" -c
NM=arm-linux-gnueabihf-nm

all: fib.arm.disassembly.txt fib.t32.disassembly.txt fib.arm.optimized.disassembly.txt fib.t32.optimized.disassembly.txt

fib.arm.disassembly.txt: fib_arm
	echo "Disassembly for ARM:" > $@
	gdb-multiarch $^ -batch -ex 'disassemble/r fib' >> $@
	echo "Code size:" >> $@
	$(NM) -S -t d $^ | grep "T fib" >> $@
	echo "The second column is the number of bytes (decimal)" >> $@

fib.arm.optimized.disassembly.txt: fib_arm_optimized
	echo "Disassembly for ARM (with -Os):" > $@
	gdb-multiarch $^ -batch -ex 'disassemble/r fib' >> $@
	echo "Code size:" >> $@
	$(NM) -S -t d $^ | grep "T fib" >> $@
	echo "The second column is the number of bytes (decimal)" >> $@

fib.t32.disassembly.txt: fib_t32
	echo "Disassembly for T32:" > $@
	gdb-multiarch $^ -batch -ex 'disassemble/r fib' >> $@
	echo "Code size:" >> $@
	$(NM) -S -t d $^ | grep "T fib" >> $@
	echo "The second column is the number of bytes (decimal)" >> $@

fib.t32.optimized.disassembly.txt: fib_t32_optimized
	echo "Disassembly for T32 (with -Os):" > $@
	gdb-multiarch $^ -batch -ex 'disassemble/r fib' >> $@
	echo "Code size:" >> $@
	$(NM) -S -t d $^ | grep "T fib" >> $@
	echo "The second column is the number of bytes (decimal)" >> $@


fib_arm: ../programs/fib.c
	$(CC) $(CFLAGS) -marm $^ -o $@

fib_arm_optimized: ../programs/fib.c
	$(CC) $(CFLAGS) -Os -marm $^ -o $@

fib_t32: ../programs/fib.c
	$(CC) $(CFLAGS) -mthumb $^ -o $@

fib_t32_optimized: ../programs/fib.c
	$(CC) $(CFLAGS) -Os -mthumb $^ -o $@

.PHONY:
dependencies:
	sudo apt install gcc-arm-linux-gnueabihf gdb-multiarch

.PHONY:
clean:
	rm -f fib.*.disassembly.txt fib_*
