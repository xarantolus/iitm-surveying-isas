results.zip: all
	rm -f $@
	zip $@ */*.disassembly.txt programs/*

.PHONY:
all:
	find ./*/ -type f -name Makefile -execdir make \;

.PHONY:
dependencies:
	find ./*/ -type f -name Makefile -execdir make dependencies \;

.PHONY:
clean:
	rm -f results.zip
	find ./*/ -type f -name Makefile -execdir make clean \;
