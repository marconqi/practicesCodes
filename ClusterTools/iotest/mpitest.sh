#!/bin/bash

echo "mpi with 4k file POSIX"
for i in 4 16  32 64; do echo $i; mpirun -np $i ior -i 3 -t 4k -b 1024k -s $((1024 * 16 / $i))  -C -F -e; done

echo "mpi with 4k file directly POSIX"
for i in 4 16  32 64; do echo $i; mpirun -np $i ior -i 3 -t 4k -b 1024k -s $((1024 * 16 / $i))  -C -F -e --posix.odirect; done

echo "------------------------------------"
mdtest -n 100 -I 10 -z 5 -b 2 -R -P  -Y
echo "------------------------------------"


echo "mpi with 4k file MPIIO"
for i in 4 16 32 64; do echo $i; mpirun -np $i ior -i 3 -t 4k -b 1024k -s $((1024 * 16 / $i))  -C -e -a MPIIO; done

echo "mpi with big file without -F MPIIO"
for i in 4 16 32 64; do echo $i; mpirun -np $i ior -i 3 -t 1m -b 8m -s $((2048 * 16 / $i))  -C -e  -a MPIIO; done

rm -rf out
echo "------------------------------------"
mdtest -n 200 -I 10 -z 5 -b 2 -R -P  -Y
echo "------------------------------------"

echo "mpi with big file POSIX"
for i in 4 16 32 64; do echo $i; mpirun -np $i ior -i 3 -t 1m -b 8m -s $((2048 * 16 / $i))  -C -F -e; done

echo "mpi with big file directly POSIX"
for i in 4 16 32 64; do echo $i; mpirun -np $i ior -i 3 -t 1m -b 8m -s $((2048 * 16 / $i))  -C -F -e --posix.odirect; done

rm -rf out
echo "------------------------------------"
mdtest -n 300 -I 10 -z 5 -b 2 -R -P  -Y
echo "------------------------------------"


