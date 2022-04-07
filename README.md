# iitm-surveying-isas
This repository contains Makefiles and a C source file for comparing compiled code size on different architectures.

For each architecture there's a subdirectory with a separate `Makefile`.

The Makefile in the same directory as this README can be used to generate files for all architectures at once.

### Quick overview
The following `make` commands assume that you're in the root of this repository.

#### Install dependencies

    make dependencies

* Install all required dependencies for all architectures. This might only work on Ubuntu systems (tested on Ubuntu 20.04.4 LTS x86_64)
* Can take around 6 hours

#### Create disassembled files

    make

* Creates one or more `*.disassembly.txt` files for all architectures and a zip file of all generated disassembly files
* You need to make sure the output does not contain any errors. Sometimes files are generated even though the compilation doesn't work correctly (e.g. if the RISC-V toolchain isn't installed)

The disassembled files follow the following naming scheme:
* `program_name.architecture(.optimized)?.disassembly.txt`
  * program_name: currently only the `fib` function from [programs/fib.c](programs/fib.c)
  * architecture: the architecture used. In some directories (e.g. `arm`) there are multiple architectures
  * `optimized|empty`: files without `optimized` in their name were compiled without any `-O` flags. Those with `optimized` in their name were compiled using `-Oz` to "Optimize aggressively for size rather than speed"<sup>[Source](https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html)</sup> (where available, else `-Os` was used to optimize for size)


#### Clean up

    make clean

* Clean up any generated files



### Reproducibility
The installation and generation of disassemblies etc. also works in the default GitHub Actions Ubuntu environment using [this workflow definition](.github/workflows/build.yml).
