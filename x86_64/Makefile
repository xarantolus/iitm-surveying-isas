CC=gcc
CFLAGS=-Wall -static -c
NM=nm

all: fib.x86_64.disassembly.txt fib.x86_64.optimized.disassembly.txt fib.i386.disassembly.txt fib.i386.optimized.disassembly.txt

fib.x86_64.disassembly.txt: fib
	echo "Disassembly for x86_64:" > $@
	gdb-multiarch $^ -batch -ex 'disassemble/r fib' >> $@
	echo "Code size:" >> $@
	$(NM) -S -t d $^ | grep "T fib" >> $@
	echo "The second column is the number of bytes (decimal)" >> $@


fib.x86_64.optimized.disassembly.txt: fib_optimized
	echo "Disassembly for x86_64 (with -Os):" > $@
	gdb-multiarch $^ -batch -ex 'disassemble/r fib' >> $@
	echo "Code size:" >> $@
	$(NM) -S -t d $^ | grep "T fib" >> $@
	echo "The second column is the number of bytes (decimal)" >> $@

fib.i386.disassembly.txt: fib_minimal
	echo "Disassembly for i386:" > $@
	gdb-multiarch $^ -batch -ex 'disassemble/r fib' >> $@
	echo "Code size:" >> $@
	$(NM) -S -t d $^ | grep "T fib" >> $@
	echo "The second column is the number of bytes (decimal)" >> $@

fib.i386.optimized.disassembly.txt: fib_minimal_optimized
	echo "Disassembly for i386 (with -Os):" > $@
	gdb-multiarch $^ -batch -ex 'disassemble/r fib' >> $@
	echo "Code size:" >> $@
	$(NM) -S -t d $^ | grep "T fib" >> $@
	echo "The second column is the number of bytes (decimal)" >> $@



fib: ../programs/fib.c
	$(CC) $(CFLAGS) $^ -o $@

fib_optimized: ../programs/fib.c
	$(CC) $(CFLAGS) -Os $^ -o $@

fib_minimal: ../programs/fib.c
	$(CC) $(CFLAGS) -m32 -march=i386 $^ -o $@

fib_minimal_optimized: ../programs/fib.c
	$(CC) $(CFLAGS) -m32 -march=i386 -Os $^ -o $@

.PHONY:
dependencies:
	sudo apt-get install gcc gdb-multiarch

.PHONY:
clean:
	rm -f fib.*.disassembly.txt fib fib_optimized fib_minimal fib_minimal_optimized
