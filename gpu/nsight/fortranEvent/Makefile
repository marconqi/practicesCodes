target=t
FC=pgf90
FCFLAGS=-Minfo -Mcuda=rdc -O2
OBJ=ideal.o
SOURCE=t.cuf
FCLINK=-L/opt/nvidia/hpc_sdk/Linux_x86_64/20.7/cuda/lib64 -lnvToolsExt

$(target): $(SOURCE)
	$(FC) -o $(target) $(FCFLAGS) $(FCLINK) $(SOURCE)

#$(OBJ): $(SOURCE)
#	$(FC) $(FCFLAGS) $(FCLINK) -c $(SOURCE)

clean: 
	rm -rf $(OBJ)
