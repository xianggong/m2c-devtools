include ../Makefile.com

ifndef LLVM_ROOT
$(error LLVM_ROOT is not set in Makefile.com)
endif

ifndef M2C
$(error M2C is not set in Makefile.com)
endif

all: gen_ir mcp_ir asm_ir opt_ir dis_ir gen_asm gen_bin

gen_ir: MatrixTranspose_Kernels.cl
	@-$(CLANG) $(CLANG_INC) $(CLANG_PAR) $< > log.0 2>&1 

mcp_ir:
	@-python ../misc/m2c_compatible_pass.py MatrixTranspose_Kernels.ll > log.1 2>&1 

asm_ir:
	@-$(LLVM_AS) MatrixTranspose_Kernels.ll -o MatrixTranspose_Kernels.bc $< > log.2 2>&1 

opt_ir:
	@-$(OPT) -mem2reg MatrixTranspose_Kernels.bc -o MatrixTranspose_Kernels.opt.bc $< > log.3 2>&1

dis_ir:
	@-$(LLVM_DIS) MatrixTranspose_Kernels.opt.bc -o MatrixTranspose_Kernels.opt.ll $< > log.4 2>&1

gen_asm:
	@-$(M2C) --llvm2si MatrixTranspose_Kernels.opt.bc > log.5 2>&1

gen_bin:
	@-$(M2C) --si2bin MatrixTranspose_Kernels.opt.s > log.6 2>&1

clean:
	rm -rf *.bc *.ll log* *.s *.bin
