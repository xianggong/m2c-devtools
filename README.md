Dev tools Howto

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
