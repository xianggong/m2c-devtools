include ../Makefile.com

ifndef LLVM_ROOT
$(error LLVM_ROOT is not set in Makefile.com)
endif

ifndef M2C
$(error M2C is not set in Makefile.com)
endif

all: gen_ir mcp_ir asm_ir opt_ir dis_ir gen_asm gen_bin

gen_ir: KERNEL_NAME.cl
	@-$(CLANG) $(CLANG_INC) $(CLANG_PAR) $< > log.0 2>&1 

mcp_ir:
	@-python ../misc/m2c_compatible_pass.py KERNEL_NAME.ll

asm_ir:
	@-$(LLVM_AS) KERNEL_NAME.ll -o KERNEL_NAME.bc $< > log.1 2>&1 

opt_ir:
	@-$(OPT) -mem2reg KERNEL_NAME.bc -o KERNEL_NAME.opt.bc $< > log.2 2>&1

dis_ir:
	@-$(LLVM_DIS) KERNEL_NAME.opt.bc -o KERNEL_NAME.opt.ll $< > log.3 2>&1

gen_asm:
	@-$(M2C) --llvm2si KERNEL_NAME.opt.bc > log.4 2>&1

gen_bin:
	@-$(M2C) --si2bin KERNEL_NAME.opt.s > log.5 2>&1

clean:
	rm -rf *.bc *.ll log* *.s *.bin
