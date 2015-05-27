include ../Makefile.com

ifndef LLVM_ROOT
$(error LLVM_ROOT is not set in Makefile.com)
endif

ifndef M2C
$(error M2C is not set in Makefile.com)
endif

all: gen_ir mcp_ir asm_ir opt_ir dis_ir gen_asm gen_bin

gen_ir: Template_Kernels.cl
	@-$(CLANG) $(CLANG_INC) $(CLANG_PAR) $< > log.0 2>&1 

mcp_ir:
	@-python ../misc/m2c_compatible_pass.py Template_Kernels.ll > log.1 2>&1 

asm_ir:
	@-$(LLVM_AS) Template_Kernels.ll -o Template_Kernels.bc $< > log.2 2>&1 

opt_ir:
	@-$(OPT) -mem2reg Template_Kernels.bc -o Template_Kernels.opt.bc $< > log.3 2>&1

dis_ir:
	@-$(LLVM_DIS) Template_Kernels.opt.bc -o Template_Kernels.opt.ll $< > log.4 2>&1

gen_asm:
	@-$(M2C) --llvm2si Template_Kernels.opt.bc > log.5 2>&1

gen_bin:
	@-$(M2C) --si2bin Template_Kernels.opt.s > log.6 2>&1

clean:
	rm -rf *.bc *.ll log* *.s *.bin
