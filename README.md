Dev tools Howto

1. AMD APP SDK kernels

The kernels from AMD APP SDK are located in amdappsdk291.
You'll need to setup LLVM_ROOT and M2C in makefile.com first,
then just 'make' in each sub directories to get the kenel
binary.

2. If you want to use your own kernels for testing

Step 1:

	Set path of LLVM_ROOT and M2C in Makefile.com

Step 2:
	
	Usage:
		python new.py PAHT_TO_OPENCL_KERNEL

	e.g:
	python new.py ../VectorAdd.cl

	You'll find a directory named VectorAdd with 
	makefile. Just 'make' to get m2c compiled binary. 
	All immediate files will be saved for easier
	debugging
