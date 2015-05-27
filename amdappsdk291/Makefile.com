LLVM_ROOT = 
M2C = 
CLANG = $(LLVM_ROOT)/clang
LLVM_AS = $(LLVM_ROOT)/llvm-as
LLVM_DIS = $(LLVM_ROOT)/llvm-dis
OPT = $(LLVM_ROOT)/opt

CLANG_INC  = -I ../include -include ../include/m2c_buildin_fix.h
CLANG_INC += -include ../include/clc/clc.h
CLANG_PAR  = -S -emit-llvm -D cl_clang_storage_class_specifiers
CLANG_PAR += -O0 -target r600
