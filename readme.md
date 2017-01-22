#IR-Examples

Just a collection of some simple Crystal, C and C++ programs and their corresponding LLVM IR for learning purposes.

```bash
crystal build file.cr --emit llvm-ir --prelude=empty #for crystal files
crystal build file.cr --emit llvm-ir #for http.cr
clang -S -emit-llvm file.c #for c files
clang -cc1 -S -emit-llvm file.cpp #for cpp files
```
