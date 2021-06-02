target=amt
FC=nvfortran
FCFLAGS=-Minfo -Mcuda=nordc -O2 -Mallocatable=95
SOURCE=amt.cuf
FCLINK=-L/opt/nvidia/hpc_sdk/Linux_x86_64/20.7/cuda/lib64 -lnvToolsExt -L/opt/nvidia/hpc_sdk/Linux_x86_64/20.7/math_libs/lib64 

$(target): $(SOURCE)
	$(FC) -o $(target) $(FCFLAGS) $(FCLINK) $(SOURCE)

#$(OBJ): $(SOURCE)
#	$(FC) $(FCFLAGS) $(FCLINK) -c $(SOURCE)

clean: 
	rm -rf $(target)
