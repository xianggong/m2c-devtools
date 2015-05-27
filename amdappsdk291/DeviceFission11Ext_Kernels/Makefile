include ../Makefile.com

ifndef LLVM_ROOT
$(error LLVM_ROOT is not set in Makefile.com)
endif

ifndef M2C
$(error M2C is not set in Makefile.com)
endif

all: gen_ir mcp_ir asm_ir opt_ir dis_ir gen_asm gen_bin

gen_ir: DeviceFission11Ext_Kernels.cl
	@-$(CLANG) $(CLANG_INC) $(CLANG_PAR) $< > log.0 2>&1 

mcp_ir:
	@-python ../misc/m2c_compatible_pass.py DeviceFission11Ext_Kernels.ll > log.1 2>&1 

asm_ir:
	@-$(LLVM_AS) DeviceFission11Ext_Kernels.ll -o DeviceFission11Ext_Kernels.bc $< > log.2 2>&1 

opt_ir:
	@-$(OPT) -mem2reg DeviceFission11Ext_Kernels.bc -o DeviceFission11Ext_Kernels.opt.bc $< > log.3 2>&1

dis_ir:
	@-$(LLVM_DIS) DeviceFission11Ext_Kernels.opt.bc -o DeviceFission11Ext_Kernels.opt.ll $< > log.4 2>&1

gen_asm:
	@-$(M2C) --llvm2si DeviceFission11Ext_Kernels.opt.bc > log.5 2>&1

gen_bin:
	@-$(M2C) --si2bin DeviceFission11Ext_Kernels.opt.s > log.6 2>&1

clean:
	rm -rf *.bc *.ll log* *.s *.bin
