Dev tools

Howto:

1. Modify Makefile.com
	Set path of LLVM_ROOT and M2C

2. Use 
	python new.py PAHT_TO_OPENCL_KERNEL

	e.g:
	python new.py ../VectorAdd.cl

	You'll find a directory named VectorAdd with 
	makefile. Just 'make' to get m2c compiled binary. 
	All immediate files will be saved for easier
	debugging
