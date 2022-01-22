```bash
[root@gpfs01 testdata]# ls
1024x1GiB       1048576x1KiB    1048576x2KiB   1048576x512KiB  128x8GiB     16x64GiB     256x4GiB     32768x32MiB  4x256GiB     64x16GiB     8x128GiB      nohup.out
1048576x128KiB  1048576x1MiB    1048576x32KiB  1048576x64KiB   131072x8MiB  1x1024GiB    262144x4MiB  32x32GiB     512x2GiB     65536x16MiB  elbsep.sh     out
1048576x16KiB   1048576x256KiB  1048576x4KiB   1048576x8KiB    16384x64MiB  2048x512MiB  2x512GiB     4096x256MiB  524288x2MiB  8192x128MiB  mpiiotest.sh
[root@gpfs01 testdata]# mv nohup.out  nvmenohup
[root@gpfs01 testdata]# nohup ./mpiiotest.sh 
nohup: ignoring input and appending output to 'nohup.out'
^Z
[1]+  Stopped                 nohup ./mpiiotest.sh
[root@gpfs01 testdata]# bg %1
[1]+ nohup ./mpiiotest.sh &
[root@gpfs01 testdata]# tail -f nohup.out 
clients per node    : 16
repetitions         : 1
xfersize            : 4096 bytes
blocksize           : 1 MiB
aggregate filesize  : 16 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     4202       1075716    0.012566    1024.00    4.00       0.005457   3.90       0.837799   3.90       0   
read      5043       1291015    0.010682    1024.00    4.00       0.000098   3.25       0.557566   3.25       0   
remove    -          -          -           -          -          -          -          -          0.004206   0   
Max Write: 4201.52 MiB/sec (4405.61 MB/sec)
Max Read:  5042.94 MiB/sec (5287.91 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write        4201.52    4201.52    4201.52       0.00 1075588.13 1075588.13 1075588.13       0.00    3.89954         NA            NA     0     16  16    1   1     1        1         0    0   1024  1048576     4096   16384.0 POSIX      0
read         5042.94    5042.94    5042.94       0.00 1290992.69 1290992.69 1290992.69       0.00    3.24890         NA            NA     0     16  16    1   1     1        1         0    0   1024  1048576     4096   16384.0 POSIX      0
Finished            : Wed Jan 19 10:45:48 2022
32
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 10:45:49 2022
Command line        : ior -i 1 -t 4k -b 1024k -s 512 -C -F -e
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 10:45:49 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 1.0%   Inodes: 46.6 Mi   Used Inodes: 0.9%

Options: 
api                 : POSIX
apiVersion          : 
test filename       : testFile
access              : file-per-process
type                : independent
segments            : 512
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 32
clients per node    : 32
repetitions         : 1
xfersize            : 4096 bytes
blocksize           : 1 MiB
aggregate filesize  : 16 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     5424       1388718    0.011400    1024.00    4.00       0.007593   3.02       0.240793   3.02       0   
read      6938       1776156    0.008367    1024.00    4.00       0.000230   2.36       0.284159   2.36       0   
remove    -          -          -           -          -          -          -          -          0.004485   0   
Max Write: 5424.11 MiB/sec (5687.59 MB/sec)
Max Read:  6937.97 MiB/sec (7274.98 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write        5424.11    5424.11    5424.11       0.00 1388572.48 1388572.48 1388572.48       0.00    3.02059         NA            NA     0     32  32    1   1     1        1         0    0    512  1048576     4096   16384.0 POSIX      0
read         6937.97    6937.97    6937.97       0.00 1776119.05 1776119.05 1776119.05       0.00    2.36150         NA            NA     0     32  32    1   1     1        1         0    0    512  1048576     4096   16384.0 POSIX      0
Finished            : Wed Jan 19 10:45:55 2022
mpi with 4k file directly POSIX
4
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 10:45:55 2022
Command line        : ior -i 1 -t 4k -b 1024k -s 4096 -C -F -e --posix.odirect
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 10:45:55 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 1.0%   Inodes: 46.6 Mi   Used Inodes: 0.9%

Options: 
api                 : POSIX
apiVersion          : 
test filename       : testFile
access              : file-per-process
type                : independent
segments            : 4096
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 4
clients per node    : 4
repetitions         : 1
xfersize            : 4096 bytes
blocksize           : 1 MiB
aggregate filesize  : 16 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     27.49      7038       2.32        1024.00    4.00       0.000607   595.93     2.51       595.93     0   
read      76.81      19663      0.833239    1024.00    4.00       0.000030   213.31     2.93       213.31     0   
remove    -          -          -           -          -          -          -          -          0.000554   0   
Max Write: 27.49 MiB/sec (28.83 MB/sec)
Max Read:  76.81 MiB/sec (80.54 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write          27.49      27.49      27.49       0.00    7038.28    7038.28    7038.28       0.00  595.92727         NA            NA     0      4   4    1   1     1        1         0    0   4096  1048576     4096   16384.0 POSIX      0
read           76.81      76.81      76.81       0.00   19663.02   19663.02   19663.02       0.00  213.30925         NA            NA     0      4   4    1   1     1        1         0    0   4096  1048576     4096   16384.0 POSIX      0
Finished            : Wed Jan 19 10:59:25 2022
16
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 10:59:26 2022
Command line        : ior -i 1 -t 4k -b 1024k -s 1024 -C -F -e --posix.odirect
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 10:59:26 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 1.0%   Inodes: 46.6 Mi   Used Inodes: 0.9%

Options: 
api                 : POSIX
apiVersion          : 
test filename       : testFile
access              : file-per-process
type                : independent
segments            : 1024
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 16
clients per node    : 16
repetitions         : 1
xfersize            : 4096 bytes
blocksize           : 1 MiB
aggregate filesize  : 16 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     68.42      17515      0.934662    1024.00    4.00       0.003206   239.47     1.94       239.47     0   
read      196.17     50220      0.319533    1024.00    4.00       0.000065   83.52      2.51       83.52      0   
remove    -          -          -           -          -          -          -          -          0.002402   0   
Max Write: 68.42 MiB/sec (71.74 MB/sec)
Max Read:  196.17 MiB/sec (205.70 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write          68.42      68.42      68.42       0.00   17515.19   17515.19   17515.19       0.00  239.46667         NA            NA     0     16  16    1   1     1        1         0    0   1024  1048576     4096   16384.0 POSIX      0
read          196.17     196.17     196.17       0.00   50220.21   50220.21   50220.21       0.00   83.51825         NA            NA     0     16  16    1   1     1        1         0    0   1024  1048576     4096   16384.0 POSIX      0
Finished            : Wed Jan 19 11:04:49 2022
32
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 11:04:50 2022
Command line        : ior -i 1 -t 4k -b 1024k -s 512 -C -F -e --posix.odirect
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 11:04:50 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 1.0%   Inodes: 46.6 Mi   Used Inodes: 0.9%

Options: 
api                 : POSIX
apiVersion          : 
test filename       : testFile
access              : file-per-process
type                : independent
segments            : 512
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 32
clients per node    : 32
repetitions         : 1
xfersize            : 4096 bytes
blocksize           : 1 MiB
aggregate filesize  : 16 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     72.59      18582      0.880426    1024.00    4.00       0.007304   225.72     0.679017   225.72     0   
read      214.95     55027      0.292386    1024.00    4.00       0.000269   76.22      2.20       76.22      0   
remove    -          -          -           -          -          -          -          -          0.007041   0   
Max Write: 72.59 MiB/sec (76.11 MB/sec)
Max Read:  214.95 MiB/sec (225.39 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write          72.59      72.59      72.59       0.00   18582.03   18582.03   18582.03       0.00  225.71833         NA            NA     0     32  32    1   1     1        1         0    0    512  1048576     4096   16384.0 POSIX      0
read          214.95     214.95     214.95       0.00   55027.02   55027.02   55027.02       0.00   76.22262         NA            NA     0     32  32    1   1     1        1         0    0    512  1048576     4096   16384.0 POSIX      0
Finished            : Wed Jan 19 11:09:52 2022
------------------------------------
-- started at 01/19/2022 11:09:53 --

mdtest-3.3.0 was launched with 1 total task(s) on 1 node(s)
Command line used: mdtest '-n' '100' '-I' '10' '-z' '5' '-b' '2' '-R' '-P' '-Y'
Path: /nvmedata/testdata
FS: 46.6 TiB   Used FS: 1.0%   Inodes: 46.6 Mi   Used Inodes: 0.9%

Nodemap: 1
random seed: 1642561793
1 tasks, 6300 files/directories

SUMMARY rate: (of 1 iterations)
   Operation                      Max            Min           Mean        Std Dev
   ---------                      ---            ---           ----        -------
   Directory creation        :        143.807        143.807        143.807          0.000
   Directory stat            :       2080.895       2080.895       2080.895          0.000
   Directory removal         :         23.191         23.191         23.191          0.000
   File creation             :       3309.966       3309.966       3309.966          0.000
   File stat                 :     103960.103     103960.103     103960.103          0.000
   File read                 :     335943.006     335943.006     335943.006          0.000
   File removal              :       1572.257       1572.257       1572.257          0.000
   Tree creation             :       1176.637       1176.637       1176.637          0.000
   Tree removal              :        261.399        261.399        261.399          0.000

SUMMARY time: (of 1 iterations)
   Operation                      Max            Min           Mean        Std Dev
   ---------                      ---            ---           ----        -------
   Directory creation        :          0.695          0.695          0.695          0.000
   Directory stat            :          0.048          0.048          0.048          0.000
   Directory removal         :          4.312          4.312          4.312          0.000
   File creation             :          1.903          1.903          1.903          0.000
   File stat                 :          0.061          0.061          0.061          0.000
   File read                 :          0.019          0.019          0.019          0.000
   File removal              :          4.007          4.007          4.007          0.000
   Tree creation             :          0.054          0.054          0.054          0.000
   Tree removal              :          0.241          0.241          0.241          0.000
-- finished at 01/19/2022 11:10:04 --

------------------------------------
mpi with 4k file MPIIO
4
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 11:10:04 2022
Command line        : ior -i 1 -t 4k -b 1024k -s 4096 -C -e -a MPIIO
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 11:10:04 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 1.0%   Inodes: 46.6 Mi   Used Inodes: 0.9%

Options: 
api                 : MPIIO
apiVersion          : (3.1)
test filename       : testFile
access              : single-shared-file
type                : independent
segments            : 4096
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 4
clients per node    : 4
repetitions         : 1
xfersize            : 4096 bytes
blocksize           : 1 MiB
aggregate filesize  : 16 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     376.95     96502      0.169779    1024.00    4.00       0.000778   43.46      1.03       43.46      0   
read      536.97     137467     0.072402    1024.00    4.00       0.000145   30.51      11.98      30.51      0   
remove    -          -          -           -          -          -          -          -          0.000318   0   
Max Write: 376.95 MiB/sec (395.26 MB/sec)
Max Read:  536.97 MiB/sec (563.06 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write         376.95     376.95     376.95       0.00   96499.02   96499.02   96499.02       0.00   43.46473         NA            NA     0      4   4    1   0     1        1         0    0   4096  1048576     4096   16384.0 MPIIO      0
read          536.97     536.97     536.97       0.00  137464.77  137464.77  137464.77       0.00   30.51185         NA            NA     0      4   4    1   0     1        1         0    0   4096  1048576     4096   16384.0 MPIIO      0
Finished            : Wed Jan 19 11:11:18 2022
16
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 11:11:19 2022
Command line        : ior -i 1 -t 4k -b 1024k -s 1024 -C -e -a MPIIO
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 11:11:19 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 1.0%   Inodes: 46.6 Mi   Used Inodes: 0.9%

Options: 
api                 : MPIIO
apiVersion          : (3.1)
test filename       : testFile
access              : single-shared-file
type                : independent
segments            : 1024
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 16
clients per node    : 16
repetitions         : 1
xfersize            : 4096 bytes
blocksize           : 1 MiB
aggregate filesize  : 16 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     325.55     83344      0.196087    1024.00    4.00       0.001333   50.33      8.70       50.33      0   
read      3199.88    819343     0.017959    1024.00    4.00       0.000417   5.12       1.23       5.12       0   
remove    -          -          -           -          -          -          -          -          0.000351   0   
Max Write: 325.55 MiB/sec (341.36 MB/sec)
Max Read:  3199.88 MiB/sec (3355.32 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write         325.55     325.55     325.55       0.00   83340.48   83340.48   83340.48       0.00   50.32733         NA            NA     0     16  16    1   0     1        1         0    0   1024  1048576     4096   16384.0 MPIIO      0
read         3199.88    3199.88    3199.88       0.00  819169.49  819169.49  819169.49       0.00    5.12019         NA            NA     0     16  16    1   0     1        1         0    0   1024  1048576     4096   16384.0 MPIIO      0
Finished            : Wed Jan 19 11:12:15 2022
32
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 11:12:17 2022
Command line        : ior -i 1 -t 4k -b 1024k -s 512 -C -e -a MPIIO
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 11:12:17 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 1.0%   Inodes: 46.6 Mi   Used Inodes: 0.9%

Options: 
api                 : MPIIO
apiVersion          : (3.1)
test filename       : testFile
access              : single-shared-file
type                : independent
segments            : 512
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 32
clients per node    : 32
repetitions         : 1
xfersize            : 4096 bytes
blocksize           : 1 MiB
aggregate filesize  : 16 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     330.13     84524      0.189157    1024.00    4.00       0.003530   49.62      19.14      49.63      0   
read      3519.67    901683     0.014779    1024.00    4.00       0.000844   4.65       0.870713   4.65       0   
remove    -          -          -           -          -          -          -          -          0.000593   0   
Max Write: 330.13 MiB/sec (346.16 MB/sec)
Max Read:  3519.67 MiB/sec (3690.65 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write         330.13     330.13     330.13       0.00   84512.43   84512.43   84512.43       0.00   49.62943         NA            NA     0     32  32    1   0     1        1         0    0    512  1048576     4096   16384.0 MPIIO      0
read         3519.67    3519.67    3519.67       0.00  901036.72  901036.72  901036.72       0.00    4.65498         NA            NA     0     32  32    1   0     1        1         0    0    512  1048576     4096   16384.0 MPIIO      0
Finished            : Wed Jan 19 11:13:11 2022
mpi with big file without -F MPIIO
4
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 11:13:12 2022
Command line        : ior -i 1 -t 1m -b 8m -s 8192 -C -e -a MPIIO
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 11:13:12 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 1.0%   Inodes: 46.6 Mi   Used Inodes: 0.9%

Options: 
api                 : MPIIO
apiVersion          : (3.1)
test filename       : testFile
access              : single-shared-file
type                : independent
segments            : 8192
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 4
clients per node    : 4
repetitions         : 1
xfersize            : 1 MiB
blocksize           : 8 MiB
aggregate filesize  : 256 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     8079       8080       3.52        8192       1024.00    0.000939   32.45      4.33       32.45      0   
read      7734       7734       4.24        8192       1024.00    0.000143   33.89      0.001671   33.89      0   
remove    -          -          -           -          -          -          -          -          0.000448   0   
Max Write: 8078.94 MiB/sec (8471.38 MB/sec)
Max Read:  7734.06 MiB/sec (8109.75 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write        8078.94    8078.94    8078.94       0.00    8078.94    8078.94    8078.94       0.00   32.44784         NA            NA     0      4   4    1   0     1        1         0    0   8192  8388608  1048576  262144.0 MPIIO      0
read         7734.06    7734.06    7734.06       0.00    7734.06    7734.06    7734.06       0.00   33.89476         NA            NA     0      4   4    1   0     1        1         0    0   8192  8388608  1048576  262144.0 MPIIO      0
Finished            : Wed Jan 19 11:14:18 2022
16
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 11:14:19 2022
Command line        : ior -i 1 -t 1m -b 8m -s 2048 -C -e -a MPIIO
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 11:14:19 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 1.0%   Inodes: 46.6 Mi   Used Inodes: 0.9%

Options: 
api                 : MPIIO
apiVersion          : (3.1)
test filename       : testFile
access              : single-shared-file
type                : independent
segments            : 2048
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 16
clients per node    : 16
repetitions         : 1
xfersize            : 1 MiB
blocksize           : 8 MiB
aggregate filesize  : 256 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     8663       8664       2.42        8192       1024.00    0.001638   30.26      10.93      30.26      0   
read      13794      13795      1.69        8192       1024.00    0.000302   19.00      7.66       19.00      0   
remove    -          -          -           -          -          -          -          -          0.000395   0   
Max Write: 8662.91 MiB/sec (9083.72 MB/sec)
Max Read:  13793.66 MiB/sec (14463.70 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write        8662.91    8662.91    8662.91       0.00    8662.91    8662.91    8662.91       0.00   30.26051         NA            NA     0     16  16    1   0     1        1         0    0   2048  8388608  1048576  262144.0 MPIIO      0
read        13793.66   13793.66   13793.66       0.00   13793.66   13793.66   13793.66       0.00   19.00468         NA            NA     0     16  16    1   0     1        1         0    0   2048  8388608  1048576  262144.0 MPIIO      0
Finished            : Wed Jan 19 11:15:08 2022
32
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 11:15:10 2022
Command line        : ior -i 1 -t 1m -b 8m -s 1024 -C -e -a MPIIO
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 11:15:10 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 1.0%   Inodes: 46.6 Mi   Used Inodes: 0.9%

Options: 
api                 : MPIIO
apiVersion          : (3.1)
test filename       : testFile
access              : single-shared-file
type                : independent
segments            : 1024
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 32
clients per node    : 32
repetitions         : 1
xfersize            : 1 MiB
blocksize           : 8 MiB
aggregate filesize  : 256 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     8012       8017       4.08        8192       1024.00    0.003116   32.70      1.92       32.72      0   
read      13889      13892      1.01        8192       1024.00    0.000736   18.87      11.13      18.87      0   
remove    -          -          -           -          -          -          -          -          0.000274   0   
Max Write: 8012.20 MiB/sec (8401.40 MB/sec)
Max Read:  13889.02 MiB/sec (14563.69 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write        8012.20    8012.20    8012.20       0.00    8012.20    8012.20    8012.20       0.00   32.71811         NA            NA     0     32  32    1   0     1        1         0    0   1024  8388608  1048576  262144.0 MPIIO      0
read        13889.02   13889.02   13889.02       0.00   13889.02   13889.02   13889.02       0.00   18.87419         NA            NA     0     32  32    1   0     1        1         0    0   1024  8388608  1048576  262144.0 MPIIO      0
Finished            : Wed Jan 19 11:16:02 2022
------------------------------------
-- started at 01/19/2022 11:21:00 --

mdtest-3.3.0 was launched with 1 total task(s) on 1 node(s)
Command line used: mdtest '-n' '200' '-I' '10' '-z' '5' '-b' '2' '-R' '-P' '-Y'
Path: /nvmedata/testdata
FS: 46.6 TiB   Used FS: 0.1%   Inodes: 46.6 Mi   Used Inodes: 0.0%

Nodemap: 1
random seed: 1642562460
1 tasks, 12600 files/directories

SUMMARY rate: (of 1 iterations)
   Operation                      Max            Min           Mean        Std Dev
   ---------                      ---            ---           ----        -------
   Directory creation        :        101.731        101.731        101.731          0.000
   Directory stat            :        912.881        912.881        912.881          0.000
   Directory removal         :         22.240         22.240         22.240          0.000
   File creation             :       3132.313       3132.313       3132.313          0.000
   File stat                 :      64469.413      64469.413      64469.413          0.000
   File read                 :     572735.395     572735.395     572735.395          0.000
   File removal              :       1416.848       1416.848       1416.848          0.000
   Tree creation             :        402.465        402.465        402.465          0.000
   Tree removal              :         98.768         98.768         98.768          0.000

SUMMARY time: (of 1 iterations)
   Operation                      Max            Min           Mean        Std Dev
   ---------                      ---            ---           ----        -------
   Directory creation        :          1.966          1.966          1.966          0.000
   Directory stat            :          0.219          0.219          0.219          0.000
   Directory removal         :          8.993          8.993          8.993          0.000
   File creation             :          4.023          4.023          4.023          0.000
   File stat                 :          0.195          0.195          0.195          0.000
   File read                 :          0.022          0.022          0.022          0.000
   File removal              :          8.893          8.893          8.893          0.000
   Tree creation             :          0.157          0.157          0.157          0.000
   Tree removal              :          0.638          0.638          0.638          0.000
-- finished at 01/19/2022 11:21:25 --

------------------------------------
mpi with big file POSIX
4
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 11:21:26 2022
Command line        : ior -i 1 -t 1m -b 8m -s 8192 -C -F -e
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 11:21:26 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 0.1%   Inodes: 46.6 Mi   Used Inodes: 0.0%

Options: 
api                 : POSIX
apiVersion          : 
test filename       : testFile
access              : file-per-process
type                : independent
segments            : 8192
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 4
clients per node    : 4
repetitions         : 1
xfersize            : 1 MiB
blocksize           : 8 MiB
aggregate filesize  : 256 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     8879       8879       3.62        8192       1024.00    0.000676   29.52      1.12       29.52      0   
read      17170      17170      1.87        8192       1024.00    0.000030   15.27      0.682081   15.27      0   
remove    -          -          -           -          -          -          -          -          0.000700   0   
Max Write: 8879.21 MiB/sec (9310.53 MB/sec)
Max Read:  17169.69 MiB/sec (18003.73 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write        8879.21    8879.21    8879.21       0.00    8879.21    8879.21    8879.21       0.00   29.52333         NA            NA     0      4   4    1   1     1        1         0    0   8192  8388608  1048576  262144.0 POSIX      0
read        17169.69   17169.69   17169.69       0.00   17169.69   17169.69   17169.69       0.00   15.26783         NA            NA     0      4   4    1   1     1        1         0    0   8192  8388608  1048576  262144.0 POSIX      0
Finished            : Wed Jan 19 11:22:10 2022
16
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 11:22:11 2022
Command line        : ior -i 1 -t 1m -b 8m -s 2048 -C -F -e
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 11:22:11 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 0.1%   Inodes: 46.6 Mi   Used Inodes: 0.0%

Options: 
api                 : POSIX
apiVersion          : 
test filename       : testFile
access              : file-per-process
type                : independent
segments            : 2048
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 16
clients per node    : 16
repetitions         : 1
xfersize            : 1 MiB
blocksize           : 8 MiB
aggregate filesize  : 256 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     8540       8540       3.80        8192       1024.00    0.004602   30.70      11.07      30.70      0   
read      19116      19116      1.68        8192       1024.00    0.000066   13.71      1.83       13.71      0   
remove    -          -          -           -          -          -          -          -          0.003007   0   
Max Write: 8539.96 MiB/sec (8954.80 MB/sec)
Max Read:  19115.76 MiB/sec (20044.33 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write        8539.96    8539.96    8539.96       0.00    8539.96    8539.96    8539.96       0.00   30.69615         NA            NA     0     16  16    1   1     1        1         0    0   2048  8388608  1048576  262144.0 POSIX      0
read        19115.76   19115.76   19115.76       0.00   19115.76   19115.76   19115.76       0.00   13.71350         NA            NA     0     16  16    1   1     1        1         0    0   2048  8388608  1048576  262144.0 POSIX      0
Finished            : Wed Jan 19 11:22:56 2022
32
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 11:22:58 2022
Command line        : ior -i 1 -t 1m -b 8m -s 1024 -C -F -e
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 11:22:58 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 0.1%   Inodes: 46.6 Mi   Used Inodes: 0.0%

Options: 
api                 : POSIX
apiVersion          : 
test filename       : testFile
access              : file-per-process
type                : independent
segments            : 1024
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 32
clients per node    : 32
repetitions         : 1
xfersize            : 1 MiB
blocksize           : 8 MiB
aggregate filesize  : 256 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     8557       8557       3.76        8192       1024.00    0.013809   30.63      3.14       30.63      0   
read      18936      18937      1.70        8192       1024.00    0.000357   13.84      1.02       13.84      0   
remove    -          -          -           -          -          -          -          -          0.005531   0   
Max Write: 8557.24 MiB/sec (8972.92 MB/sec)
Max Read:  18936.46 MiB/sec (19856.32 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write        8557.24    8557.24    8557.24       0.00    8557.24    8557.24    8557.24       0.00   30.63417         NA            NA     0     32  32    1   1     1        1         0    0   1024  8388608  1048576  262144.0 POSIX      0
read        18936.46   18936.46   18936.46       0.00   18936.46   18936.46   18936.46       0.00   13.84335         NA            NA     0     32  32    1   1     1        1         0    0   1024  8388608  1048576  262144.0 POSIX      0
Finished            : Wed Jan 19 11:23:42 2022
mpi with big file directly POSIX
4
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 11:23:43 2022
Command line        : ior -i 1 -t 1m -b 8m -s 8192 -C -F -e --posix.odirect
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 11:23:43 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 0.1%   Inodes: 46.6 Mi   Used Inodes: 0.0%

Options: 
api                 : POSIX
apiVersion          : 
test filename       : testFile
access              : file-per-process
type                : independent
segments            : 8192
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 4
clients per node    : 4
repetitions         : 1
xfersize            : 1 MiB
blocksize           : 8 MiB
aggregate filesize  : 256 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     2731.18    2731.19    9.95        8192       1024.00    0.000694   95.98      16.39      95.98      0   
read      4575       4575       7.10        8192       1024.00    0.000039   57.30      0.642475   57.30      0   
remove    -          -          -           -          -          -          -          -          0.000736   0   
Max Write: 2731.18 MiB/sec (2863.85 MB/sec)
Max Read:  4574.61 MiB/sec (4796.82 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write        2731.18    2731.18    2731.18       0.00    2731.18    2731.18    2731.18       0.00   95.98191         NA            NA     0      4   4    1   1     1        1         0    0   8192  8388608  1048576  262144.0 POSIX      0
read         4574.61    4574.61    4574.61       0.00    4574.61    4574.61    4574.61       0.00   57.30415         NA            NA     0      4   4    1   1     1        1         0    0   8192  8388608  1048576  262144.0 POSIX      0
Finished            : Wed Jan 19 11:26:16 2022
16
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 11:26:17 2022
Command line        : ior -i 1 -t 1m -b 8m -s 2048 -C -F -e --posix.odirect
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 11:26:17 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 0.1%   Inodes: 46.6 Mi   Used Inodes: 0.0%

Options: 
api                 : POSIX
apiVersion          : 
test filename       : testFile
access              : file-per-process
type                : independent
segments            : 2048
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 16
clients per node    : 16
repetitions         : 1
xfersize            : 1 MiB
blocksize           : 8 MiB
aggregate filesize  : 256 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     6716       6716       4.59        8192       1024.00    0.003788   39.03      8.83       39.03      0   
read      16989      16989      1.91        8192       1024.00    0.000105   15.43      0.223876   15.43      0   
remove    -          -          -           -          -          -          -          -          0.002743   0   
Max Write: 6716.20 MiB/sec (7042.45 MB/sec)
Max Read:  16989.27 MiB/sec (17814.54 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write        6716.20    6716.20    6716.20       0.00    6716.20    6716.20    6716.20       0.00   39.03158         NA            NA     0     16  16    1   1     1        1         0    0   2048  8388608  1048576  262144.0 POSIX      0
read        16989.27   16989.27   16989.27       0.00   16989.27   16989.27   16989.27       0.00   15.42997         NA            NA     0     16  16    1   1     1        1         0    0   2048  8388608  1048576  262144.0 POSIX      0
Finished            : Wed Jan 19 11:27:12 2022
32
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 11:27:14 2022
Command line        : ior -i 1 -t 1m -b 8m -s 1024 -C -F -e --posix.odirect
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 11:27:14 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 0.1%   Inodes: 46.6 Mi   Used Inodes: 0.0%

Options: 
api                 : POSIX
apiVersion          : 
test filename       : testFile
access              : file-per-process
type                : independent
segments            : 1024
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 32
clients per node    : 32
repetitions         : 1
xfersize            : 1 MiB
blocksize           : 8 MiB
aggregate filesize  : 256 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     7767       7767       4.17        8192       1024.00    0.014471   33.75      4.00       33.75      0   
read      22874      22874      1.43        8192       1024.00    0.000224   11.46      0.125295   11.46      0   
remove    -          -          -           -          -          -          -          -          0.006248   0   
Max Write: 7767.22 MiB/sec (8144.52 MB/sec)
Max Read:  22873.94 MiB/sec (23985.07 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write        7767.22    7767.22    7767.22       0.00    7767.22    7767.22    7767.22       0.00   33.75005         NA            NA     0     32  32    1   1     1        1         0    0   1024  8388608  1048576  262144.0 POSIX      0
read        22873.94   22873.94   22873.94       0.00   22873.94   22873.94   22873.94       0.00   11.46038         NA            NA     0     32  32    1   1     1        1         0    0   1024  8388608  1048576  262144.0 POSIX      0
Finished            : Wed Jan 19 11:27:59 2022
------------------------------------
-- started at 01/19/2022 11:27:59 --

mdtest-3.3.0 was launched with 1 total task(s) on 1 node(s)
Command line used: mdtest '-n' '300' '-I' '10' '-z' '5' '-b' '2' '-R' '-P' '-Y'
Path: /nvmedata/testdata
FS: 46.6 TiB   Used FS: 0.2%   Inodes: 46.6 Mi   Used Inodes: 0.0%

Nodemap: 1
random seed: 1642562879
1 tasks, 18900 files/directories

SUMMARY rate: (of 1 iterations)
   Operation                      Max            Min           Mean        Std Dev
   ---------                      ---            ---           ----        -------
   Directory creation        :         99.910         99.910         99.910          0.000
   Directory stat            :       1029.991       1029.991       1029.991          0.000
   Directory removal         :         22.725         22.725         22.725          0.000
   File creation             :       3158.938       3158.938       3158.938          0.000
   File stat                 :      65315.701      65315.701      65315.701          0.000
   File read                 :     489653.035     489653.035     489653.035          0.000
   File removal              :       1308.708       1308.708       1308.708          0.000
   Tree creation             :        319.278        319.278        319.278          0.000
   Tree removal              :         68.936         68.936         68.936          0.000

SUMMARY time: (of 1 iterations)
   Operation                      Max            Min           Mean        Std Dev
   ---------                      ---            ---           ----        -------
   Directory creation        :          3.003          3.003          3.003          0.000
   Directory stat            :          0.291          0.291          0.291          0.000
   Directory removal         :         13.201         13.201         13.201          0.000
   File creation             :          5.983          5.983          5.983          0.000
   File stat                 :          0.289          0.289          0.289          0.000
   File read                 :          0.039          0.039          0.039          0.000
   File removal              :         14.442         14.442         14.442          0.000
   Tree creation             :          0.197          0.197          0.197          0.000
   Tree removal              :          0.914          0.914          0.914          0.000
-- finished at 01/19/2022 11:28:38 --

------------------------------------
```



```bash
mpi with 4k file POSIX
4
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 10:45:29 2022
Command line        : ior -i 1 -t 4k -b 1024k -s 4096 -C -F -e
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 10:45:29 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 1.0%   Inodes: 46.6 Mi   Used Inodes: 0.9%

Options: 
api                 : POSIX
apiVersion          : 
test filename       : testFile
access              : file-per-process
type                : independent
segments            : 4096
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 4
clients per node    : 4
repetitions         : 1
xfersize            : 4096 bytes
blocksize           : 1 MiB
aggregate filesize  : 16 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     2579.47    660468     0.024804    1024.00    4.00       0.002970   6.35       0.542121   6.35       0   
read      3482.68    891581     0.018376    1024.00    4.00       0.000031   4.70       0.401563   4.70       0   
remove    -          -          -           -          -          -          -          -          0.001748   0   
Max Write: 2579.47 MiB/sec (2704.77 MB/sec)
Max Read:  3482.68 MiB/sec (3651.85 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write        2579.47    2579.47    2579.47       0.00  660343.61  660343.61  660343.61       0.00    6.35170         NA            NA     0      4   4    1   1     1        1         0    0   4096  1048576     4096   16384.0 POSIX      0
read         3482.68    3482.68    3482.68       0.00  891565.26  891565.26  891565.26       0.00    4.70443         NA            NA     0      4   4    1   1     1        1         0    0   4096  1048576     4096   16384.0 POSIX      0
Finished            : Wed Jan 19 10:45:40 2022
16
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 10:45:40 2022
Command line        : ior -i 1 -t 4k -b 1024k -s 1024 -C -F -e
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 10:45:40 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 1.0%   Inodes: 46.6 Mi   Used Inodes: 0.9%

Options: 
api                 : POSIX
apiVersion          : 
test filename       : testFile
access              : file-per-process
type                : independent
segments            : 1024
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 16
clients per node    : 16
repetitions         : 1
xfersize            : 4096 bytes
blocksize           : 1 MiB
aggregate filesize  : 16 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     4202       1075716    0.012566    1024.00    4.00       0.005457   3.90       0.837799   3.90       0   
read      5043       1291015    0.010682    1024.00    4.00       0.000098   3.25       0.557566   3.25       0   
remove    -          -          -           -          -          -          -          -          0.004206   0   
Max Write: 4201.52 MiB/sec (4405.61 MB/sec)
Max Read:  5042.94 MiB/sec (5287.91 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write        4201.52    4201.52    4201.52       0.00 1075588.13 1075588.13 1075588.13       0.00    3.89954         NA            NA     0     16  16    1   1     1        1         0    0   1024  1048576     4096   16384.0 POSIX      0
read         5042.94    5042.94    5042.94       0.00 1290992.69 1290992.69 1290992.69       0.00    3.24890         NA            NA     0     16  16    1   1     1        1         0    0   1024  1048576     4096   16384.0 POSIX      0
Finished            : Wed Jan 19 10:45:48 2022
32
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 10:45:49 2022
Command line        : ior -i 1 -t 4k -b 1024k -s 512 -C -F -e
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 10:45:49 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 1.0%   Inodes: 46.6 Mi   Used Inodes: 0.9%

Options: 
api                 : POSIX
apiVersion          : 
test filename       : testFile
access              : file-per-process
type                : independent
segments            : 512
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 32
clients per node    : 32
repetitions         : 1
xfersize            : 4096 bytes
blocksize           : 1 MiB
aggregate filesize  : 16 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     5424       1388718    0.011400    1024.00    4.00       0.007593   3.02       0.240793   3.02       0   
read      6938       1776156    0.008367    1024.00    4.00       0.000230   2.36       0.284159   2.36       0   
remove    -          -          -           -          -          -          -          -          0.004485   0   
Max Write: 5424.11 MiB/sec (5687.59 MB/sec)
Max Read:  6937.97 MiB/sec (7274.98 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write        5424.11    5424.11    5424.11       0.00 1388572.48 1388572.48 1388572.48       0.00    3.02059         NA            NA     0     32  32    1   1     1        1         0    0    512  1048576     4096   16384.0 POSIX      0
read         6937.97    6937.97    6937.97       0.00 1776119.05 1776119.05 1776119.05       0.00    2.36150         NA            NA     0     32  32    1   1     1        1         0    0    512  1048576     4096   16384.0 POSIX      0
Finished            : Wed Jan 19 10:45:55 2022
mpi with 4k file directly POSIX
4
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 10:45:55 2022
Command line        : ior -i 1 -t 4k -b 1024k -s 4096 -C -F -e --posix.odirect
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 10:45:55 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 1.0%   Inodes: 46.6 Mi   Used Inodes: 0.9%

Options: 
api                 : POSIX
apiVersion          : 
test filename       : testFile
access              : file-per-process
type                : independent
segments            : 4096
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 4
clients per node    : 4
repetitions         : 1
xfersize            : 4096 bytes
blocksize           : 1 MiB
aggregate filesize  : 16 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     27.49      7038       2.32        1024.00    4.00       0.000607   595.93     2.51       595.93     0   
read      76.81      19663      0.833239    1024.00    4.00       0.000030   213.31     2.93       213.31     0   
remove    -          -          -           -          -          -          -          -          0.000554   0   
Max Write: 27.49 MiB/sec (28.83 MB/sec)
Max Read:  76.81 MiB/sec (80.54 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write          27.49      27.49      27.49       0.00    7038.28    7038.28    7038.28       0.00  595.92727         NA            NA     0      4   4    1   1     1        1         0    0   4096  1048576     4096   16384.0 POSIX      0
read           76.81      76.81      76.81       0.00   19663.02   19663.02   19663.02       0.00  213.30925         NA            NA     0      4   4    1   1     1        1         0    0   4096  1048576     4096   16384.0 POSIX      0
Finished            : Wed Jan 19 10:59:25 2022
16
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 10:59:26 2022
Command line        : ior -i 1 -t 4k -b 1024k -s 1024 -C -F -e --posix.odirect
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 10:59:26 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 1.0%   Inodes: 46.6 Mi   Used Inodes: 0.9%

Options: 
api                 : POSIX
apiVersion          : 
test filename       : testFile
access              : file-per-process
type                : independent
segments            : 1024
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 16
clients per node    : 16
repetitions         : 1
xfersize            : 4096 bytes
blocksize           : 1 MiB
aggregate filesize  : 16 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     68.42      17515      0.934662    1024.00    4.00       0.003206   239.47     1.94       239.47     0   
read      196.17     50220      0.319533    1024.00    4.00       0.000065   83.52      2.51       83.52      0   
remove    -          -          -           -          -          -          -          -          0.002402   0   
Max Write: 68.42 MiB/sec (71.74 MB/sec)
Max Read:  196.17 MiB/sec (205.70 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write          68.42      68.42      68.42       0.00   17515.19   17515.19   17515.19       0.00  239.46667         NA            NA     0     16  16    1   1     1        1         0    0   1024  1048576     4096   16384.0 POSIX      0
read          196.17     196.17     196.17       0.00   50220.21   50220.21   50220.21       0.00   83.51825         NA            NA     0     16  16    1   1     1        1         0    0   1024  1048576     4096   16384.0 POSIX      0
Finished            : Wed Jan 19 11:04:49 2022
32
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 11:04:50 2022
Command line        : ior -i 1 -t 4k -b 1024k -s 512 -C -F -e --posix.odirect
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 11:04:50 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 1.0%   Inodes: 46.6 Mi   Used Inodes: 0.9%

Options: 
api                 : POSIX
apiVersion          : 
test filename       : testFile
access              : file-per-process
type                : independent
segments            : 512
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 32
clients per node    : 32
repetitions         : 1
xfersize            : 4096 bytes
blocksize           : 1 MiB
aggregate filesize  : 16 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     72.59      18582      0.880426    1024.00    4.00       0.007304   225.72     0.679017   225.72     0   
read      214.95     55027      0.292386    1024.00    4.00       0.000269   76.22      2.20       76.22      0   
remove    -          -          -           -          -          -          -          -          0.007041   0   
Max Write: 72.59 MiB/sec (76.11 MB/sec)
Max Read:  214.95 MiB/sec (225.39 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write          72.59      72.59      72.59       0.00   18582.03   18582.03   18582.03       0.00  225.71833         NA            NA     0     32  32    1   1     1        1         0    0    512  1048576     4096   16384.0 POSIX      0
read          214.95     214.95     214.95       0.00   55027.02   55027.02   55027.02       0.00   76.22262         NA            NA     0     32  32    1   1     1        1         0    0    512  1048576     4096   16384.0 POSIX      0
Finished            : Wed Jan 19 11:09:52 2022
------------------------------------
-- started at 01/19/2022 11:09:53 --

mdtest-3.3.0 was launched with 1 total task(s) on 1 node(s)
Command line used: mdtest '-n' '100' '-I' '10' '-z' '5' '-b' '2' '-R' '-P' '-Y'
Path: /nvmedata/testdata
FS: 46.6 TiB   Used FS: 1.0%   Inodes: 46.6 Mi   Used Inodes: 0.9%

Nodemap: 1
random seed: 1642561793
1 tasks, 6300 files/directories

SUMMARY rate: (of 1 iterations)
   Operation                      Max            Min           Mean        Std Dev
   ---------                      ---            ---           ----        -------
   Directory creation        :        143.807        143.807        143.807          0.000
   Directory stat            :       2080.895       2080.895       2080.895          0.000
   Directory removal         :         23.191         23.191         23.191          0.000
   File creation             :       3309.966       3309.966       3309.966          0.000
   File stat                 :     103960.103     103960.103     103960.103          0.000
   File read                 :     335943.006     335943.006     335943.006          0.000
   File removal              :       1572.257       1572.257       1572.257          0.000
   Tree creation             :       1176.637       1176.637       1176.637          0.000
   Tree removal              :        261.399        261.399        261.399          0.000

SUMMARY time: (of 1 iterations)
   Operation                      Max            Min           Mean        Std Dev
   ---------                      ---            ---           ----        -------
   Directory creation        :          0.695          0.695          0.695          0.000
   Directory stat            :          0.048          0.048          0.048          0.000
   Directory removal         :          4.312          4.312          4.312          0.000
   File creation             :          1.903          1.903          1.903          0.000
   File stat                 :          0.061          0.061          0.061          0.000
   File read                 :          0.019          0.019          0.019          0.000
   File removal              :          4.007          4.007          4.007          0.000
   Tree creation             :          0.054          0.054          0.054          0.000
   Tree removal              :          0.241          0.241          0.241          0.000
-- finished at 01/19/2022 11:10:04 --

------------------------------------
mpi with 4k file MPIIO
4
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 11:10:04 2022
Command line        : ior -i 1 -t 4k -b 1024k -s 4096 -C -e -a MPIIO
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 11:10:04 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 1.0%   Inodes: 46.6 Mi   Used Inodes: 0.9%

Options: 
api                 : MPIIO
apiVersion          : (3.1)
test filename       : testFile
access              : single-shared-file
type                : independent
segments            : 4096
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 4
clients per node    : 4
repetitions         : 1
xfersize            : 4096 bytes
blocksize           : 1 MiB
aggregate filesize  : 16 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     376.95     96502      0.169779    1024.00    4.00       0.000778   43.46      1.03       43.46      0   
read      536.97     137467     0.072402    1024.00    4.00       0.000145   30.51      11.98      30.51      0   
remove    -          -          -           -          -          -          -          -          0.000318   0   
Max Write: 376.95 MiB/sec (395.26 MB/sec)
Max Read:  536.97 MiB/sec (563.06 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write         376.95     376.95     376.95       0.00   96499.02   96499.02   96499.02       0.00   43.46473         NA            NA     0      4   4    1   0     1        1         0    0   4096  1048576     4096   16384.0 MPIIO      0
read          536.97     536.97     536.97       0.00  137464.77  137464.77  137464.77       0.00   30.51185         NA            NA     0      4   4    1   0     1        1         0    0   4096  1048576     4096   16384.0 MPIIO      0
Finished            : Wed Jan 19 11:11:18 2022
16
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 11:11:19 2022
Command line        : ior -i 1 -t 4k -b 1024k -s 1024 -C -e -a MPIIO
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 11:11:19 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 1.0%   Inodes: 46.6 Mi   Used Inodes: 0.9%

Options: 
api                 : MPIIO
apiVersion          : (3.1)
test filename       : testFile
access              : single-shared-file
type                : independent
segments            : 1024
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 16
clients per node    : 16
repetitions         : 1
xfersize            : 4096 bytes
blocksize           : 1 MiB
aggregate filesize  : 16 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     325.55     83344      0.196087    1024.00    4.00       0.001333   50.33      8.70       50.33      0   
read      3199.88    819343     0.017959    1024.00    4.00       0.000417   5.12       1.23       5.12       0   
remove    -          -          -           -          -          -          -          -          0.000351   0   
Max Write: 325.55 MiB/sec (341.36 MB/sec)
Max Read:  3199.88 MiB/sec (3355.32 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write         325.55     325.55     325.55       0.00   83340.48   83340.48   83340.48       0.00   50.32733         NA            NA     0     16  16    1   0     1        1         0    0   1024  1048576     4096   16384.0 MPIIO      0
read         3199.88    3199.88    3199.88       0.00  819169.49  819169.49  819169.49       0.00    5.12019         NA            NA     0     16  16    1   0     1        1         0    0   1024  1048576     4096   16384.0 MPIIO      0
Finished            : Wed Jan 19 11:12:15 2022
32
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 11:12:17 2022
Command line        : ior -i 1 -t 4k -b 1024k -s 512 -C -e -a MPIIO
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 11:12:17 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 1.0%   Inodes: 46.6 Mi   Used Inodes: 0.9%

Options: 
api                 : MPIIO
apiVersion          : (3.1)
test filename       : testFile
access              : single-shared-file
type                : independent
segments            : 512
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 32
clients per node    : 32
repetitions         : 1
xfersize            : 4096 bytes
blocksize           : 1 MiB
aggregate filesize  : 16 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     330.13     84524      0.189157    1024.00    4.00       0.003530   49.62      19.14      49.63      0   
read      3519.67    901683     0.014779    1024.00    4.00       0.000844   4.65       0.870713   4.65       0   
remove    -          -          -           -          -          -          -          -          0.000593   0   
Max Write: 330.13 MiB/sec (346.16 MB/sec)
Max Read:  3519.67 MiB/sec (3690.65 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write         330.13     330.13     330.13       0.00   84512.43   84512.43   84512.43       0.00   49.62943         NA            NA     0     32  32    1   0     1        1         0    0    512  1048576     4096   16384.0 MPIIO      0
read         3519.67    3519.67    3519.67       0.00  901036.72  901036.72  901036.72       0.00    4.65498         NA            NA     0     32  32    1   0     1        1         0    0    512  1048576     4096   16384.0 MPIIO      0
Finished            : Wed Jan 19 11:13:11 2022
mpi with big file without -F MPIIO
4
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 11:13:12 2022
Command line        : ior -i 1 -t 1m -b 8m -s 8192 -C -e -a MPIIO
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 11:13:12 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 1.0%   Inodes: 46.6 Mi   Used Inodes: 0.9%

Options: 
api                 : MPIIO
apiVersion          : (3.1)
test filename       : testFile
access              : single-shared-file
type                : independent
segments            : 8192
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 4
clients per node    : 4
repetitions         : 1
xfersize            : 1 MiB
blocksize           : 8 MiB
aggregate filesize  : 256 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     8079       8080       3.52        8192       1024.00    0.000939   32.45      4.33       32.45      0   
read      7734       7734       4.24        8192       1024.00    0.000143   33.89      0.001671   33.89      0   
remove    -          -          -           -          -          -          -          -          0.000448   0   
Max Write: 8078.94 MiB/sec (8471.38 MB/sec)
Max Read:  7734.06 MiB/sec (8109.75 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write        8078.94    8078.94    8078.94       0.00    8078.94    8078.94    8078.94       0.00   32.44784         NA            NA     0      4   4    1   0     1        1         0    0   8192  8388608  1048576  262144.0 MPIIO      0
read         7734.06    7734.06    7734.06       0.00    7734.06    7734.06    7734.06       0.00   33.89476         NA            NA     0      4   4    1   0     1        1         0    0   8192  8388608  1048576  262144.0 MPIIO      0
Finished            : Wed Jan 19 11:14:18 2022
16
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 11:14:19 2022
Command line        : ior -i 1 -t 1m -b 8m -s 2048 -C -e -a MPIIO
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 11:14:19 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 1.0%   Inodes: 46.6 Mi   Used Inodes: 0.9%

Options: 
api                 : MPIIO
apiVersion          : (3.1)
test filename       : testFile
access              : single-shared-file
type                : independent
segments            : 2048
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 16
clients per node    : 16
repetitions         : 1
xfersize            : 1 MiB
blocksize           : 8 MiB
aggregate filesize  : 256 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     8663       8664       2.42        8192       1024.00    0.001638   30.26      10.93      30.26      0   
read      13794      13795      1.69        8192       1024.00    0.000302   19.00      7.66       19.00      0   
remove    -          -          -           -          -          -          -          -          0.000395   0   
Max Write: 8662.91 MiB/sec (9083.72 MB/sec)
Max Read:  13793.66 MiB/sec (14463.70 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write        8662.91    8662.91    8662.91       0.00    8662.91    8662.91    8662.91       0.00   30.26051         NA            NA     0     16  16    1   0     1        1         0    0   2048  8388608  1048576  262144.0 MPIIO      0
read        13793.66   13793.66   13793.66       0.00   13793.66   13793.66   13793.66       0.00   19.00468         NA            NA     0     16  16    1   0     1        1         0    0   2048  8388608  1048576  262144.0 MPIIO      0
Finished            : Wed Jan 19 11:15:08 2022
32
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 11:15:10 2022
Command line        : ior -i 1 -t 1m -b 8m -s 1024 -C -e -a MPIIO
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 11:15:10 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 1.0%   Inodes: 46.6 Mi   Used Inodes: 0.9%

Options: 
api                 : MPIIO
apiVersion          : (3.1)
test filename       : testFile
access              : single-shared-file
type                : independent
segments            : 1024
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 32
clients per node    : 32
repetitions         : 1
xfersize            : 1 MiB
blocksize           : 8 MiB
aggregate filesize  : 256 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     8012       8017       4.08        8192       1024.00    0.003116   32.70      1.92       32.72      0   
read      13889      13892      1.01        8192       1024.00    0.000736   18.87      11.13      18.87      0   
remove    -          -          -           -          -          -          -          -          0.000274   0   
Max Write: 8012.20 MiB/sec (8401.40 MB/sec)
Max Read:  13889.02 MiB/sec (14563.69 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write        8012.20    8012.20    8012.20       0.00    8012.20    8012.20    8012.20       0.00   32.71811         NA            NA     0     32  32    1   0     1        1         0    0   1024  8388608  1048576  262144.0 MPIIO      0
read        13889.02   13889.02   13889.02       0.00   13889.02   13889.02   13889.02       0.00   18.87419         NA            NA     0     32  32    1   0     1        1         0    0   1024  8388608  1048576  262144.0 MPIIO      0
Finished            : Wed Jan 19 11:16:02 2022
------------------------------------
-- started at 01/19/2022 11:21:00 --

mdtest-3.3.0 was launched with 1 total task(s) on 1 node(s)
Command line used: mdtest '-n' '200' '-I' '10' '-z' '5' '-b' '2' '-R' '-P' '-Y'
Path: /nvmedata/testdata
FS: 46.6 TiB   Used FS: 0.1%   Inodes: 46.6 Mi   Used Inodes: 0.0%

Nodemap: 1
random seed: 1642562460
1 tasks, 12600 files/directories

SUMMARY rate: (of 1 iterations)
   Operation                      Max            Min           Mean        Std Dev
   ---------                      ---            ---           ----        -------
   Directory creation        :        101.731        101.731        101.731          0.000
   Directory stat            :        912.881        912.881        912.881          0.000
   Directory removal         :         22.240         22.240         22.240          0.000
   File creation             :       3132.313       3132.313       3132.313          0.000
   File stat                 :      64469.413      64469.413      64469.413          0.000
   File read                 :     572735.395     572735.395     572735.395          0.000
   File removal              :       1416.848       1416.848       1416.848          0.000
   Tree creation             :        402.465        402.465        402.465          0.000
   Tree removal              :         98.768         98.768         98.768          0.000

SUMMARY time: (of 1 iterations)
   Operation                      Max            Min           Mean        Std Dev
   ---------                      ---            ---           ----        -------
   Directory creation        :          1.966          1.966          1.966          0.000
   Directory stat            :          0.219          0.219          0.219          0.000
   Directory removal         :          8.993          8.993          8.993          0.000
   File creation             :          4.023          4.023          4.023          0.000
   File stat                 :          0.195          0.195          0.195          0.000
   File read                 :          0.022          0.022          0.022          0.000
   File removal              :          8.893          8.893          8.893          0.000
   Tree creation             :          0.157          0.157          0.157          0.000
   Tree removal              :          0.638          0.638          0.638          0.000
-- finished at 01/19/2022 11:21:25 --

------------------------------------
mpi with big file POSIX
4
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 11:21:26 2022
Command line        : ior -i 1 -t 1m -b 8m -s 8192 -C -F -e
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 11:21:26 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 0.1%   Inodes: 46.6 Mi   Used Inodes: 0.0%

Options: 
api                 : POSIX
apiVersion          : 
test filename       : testFile
access              : file-per-process
type                : independent
segments            : 8192
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 4
clients per node    : 4
repetitions         : 1
xfersize            : 1 MiB
blocksize           : 8 MiB
aggregate filesize  : 256 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     8879       8879       3.62        8192       1024.00    0.000676   29.52      1.12       29.52      0   
read      17170      17170      1.87        8192       1024.00    0.000030   15.27      0.682081   15.27      0   
remove    -          -          -           -          -          -          -          -          0.000700   0   
Max Write: 8879.21 MiB/sec (9310.53 MB/sec)
Max Read:  17169.69 MiB/sec (18003.73 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write        8879.21    8879.21    8879.21       0.00    8879.21    8879.21    8879.21       0.00   29.52333         NA            NA     0      4   4    1   1     1        1         0    0   8192  8388608  1048576  262144.0 POSIX      0
read        17169.69   17169.69   17169.69       0.00   17169.69   17169.69   17169.69       0.00   15.26783         NA            NA     0      4   4    1   1     1        1         0    0   8192  8388608  1048576  262144.0 POSIX      0
Finished            : Wed Jan 19 11:22:10 2022
16
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 11:22:11 2022
Command line        : ior -i 1 -t 1m -b 8m -s 2048 -C -F -e
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 11:22:11 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 0.1%   Inodes: 46.6 Mi   Used Inodes: 0.0%

Options: 
api                 : POSIX
apiVersion          : 
test filename       : testFile
access              : file-per-process
type                : independent
segments            : 2048
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 16
clients per node    : 16
repetitions         : 1
xfersize            : 1 MiB
blocksize           : 8 MiB
aggregate filesize  : 256 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     8540       8540       3.80        8192       1024.00    0.004602   30.70      11.07      30.70      0   
read      19116      19116      1.68        8192       1024.00    0.000066   13.71      1.83       13.71      0   
remove    -          -          -           -          -          -          -          -          0.003007   0   
Max Write: 8539.96 MiB/sec (8954.80 MB/sec)
Max Read:  19115.76 MiB/sec (20044.33 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write        8539.96    8539.96    8539.96       0.00    8539.96    8539.96    8539.96       0.00   30.69615         NA            NA     0     16  16    1   1     1        1         0    0   2048  8388608  1048576  262144.0 POSIX      0
read        19115.76   19115.76   19115.76       0.00   19115.76   19115.76   19115.76       0.00   13.71350         NA            NA     0     16  16    1   1     1        1         0    0   2048  8388608  1048576  262144.0 POSIX      0
Finished            : Wed Jan 19 11:22:56 2022
32
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 11:22:58 2022
Command line        : ior -i 1 -t 1m -b 8m -s 1024 -C -F -e
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 11:22:58 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 0.1%   Inodes: 46.6 Mi   Used Inodes: 0.0%

Options: 
api                 : POSIX
apiVersion          : 
test filename       : testFile
access              : file-per-process
type                : independent
segments            : 1024
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 32
clients per node    : 32
repetitions         : 1
xfersize            : 1 MiB
blocksize           : 8 MiB
aggregate filesize  : 256 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     8557       8557       3.76        8192       1024.00    0.013809   30.63      3.14       30.63      0   
read      18936      18937      1.70        8192       1024.00    0.000357   13.84      1.02       13.84      0   
remove    -          -          -           -          -          -          -          -          0.005531   0   
Max Write: 8557.24 MiB/sec (8972.92 MB/sec)
Max Read:  18936.46 MiB/sec (19856.32 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write        8557.24    8557.24    8557.24       0.00    8557.24    8557.24    8557.24       0.00   30.63417         NA            NA     0     32  32    1   1     1        1         0    0   1024  8388608  1048576  262144.0 POSIX      0
read        18936.46   18936.46   18936.46       0.00   18936.46   18936.46   18936.46       0.00   13.84335         NA            NA     0     32  32    1   1     1        1         0    0   1024  8388608  1048576  262144.0 POSIX      0
Finished            : Wed Jan 19 11:23:42 2022
mpi with big file directly POSIX
4
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 11:23:43 2022
Command line        : ior -i 1 -t 1m -b 8m -s 8192 -C -F -e --posix.odirect
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 11:23:43 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 0.1%   Inodes: 46.6 Mi   Used Inodes: 0.0%

Options: 
api                 : POSIX
apiVersion          : 
test filename       : testFile
access              : file-per-process
type                : independent
segments            : 8192
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 4
clients per node    : 4
repetitions         : 1
xfersize            : 1 MiB
blocksize           : 8 MiB
aggregate filesize  : 256 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     2731.18    2731.19    9.95        8192       1024.00    0.000694   95.98      16.39      95.98      0   
read      4575       4575       7.10        8192       1024.00    0.000039   57.30      0.642475   57.30      0   
remove    -          -          -           -          -          -          -          -          0.000736   0   
Max Write: 2731.18 MiB/sec (2863.85 MB/sec)
Max Read:  4574.61 MiB/sec (4796.82 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write        2731.18    2731.18    2731.18       0.00    2731.18    2731.18    2731.18       0.00   95.98191         NA            NA     0      4   4    1   1     1        1         0    0   8192  8388608  1048576  262144.0 POSIX      0
read         4574.61    4574.61    4574.61       0.00    4574.61    4574.61    4574.61       0.00   57.30415         NA            NA     0      4   4    1   1     1        1         0    0   8192  8388608  1048576  262144.0 POSIX      0
Finished            : Wed Jan 19 11:26:16 2022
16
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 11:26:17 2022
Command line        : ior -i 1 -t 1m -b 8m -s 2048 -C -F -e --posix.odirect
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 11:26:17 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 0.1%   Inodes: 46.6 Mi   Used Inodes: 0.0%

Options: 
api                 : POSIX
apiVersion          : 
test filename       : testFile
access              : file-per-process
type                : independent
segments            : 2048
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 16
clients per node    : 16
repetitions         : 1
xfersize            : 1 MiB
blocksize           : 8 MiB
aggregate filesize  : 256 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     6716       6716       4.59        8192       1024.00    0.003788   39.03      8.83       39.03      0   
read      16989      16989      1.91        8192       1024.00    0.000105   15.43      0.223876   15.43      0   
remove    -          -          -           -          -          -          -          -          0.002743   0   
Max Write: 6716.20 MiB/sec (7042.45 MB/sec)
Max Read:  16989.27 MiB/sec (17814.54 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write        6716.20    6716.20    6716.20       0.00    6716.20    6716.20    6716.20       0.00   39.03158         NA            NA     0     16  16    1   1     1        1         0    0   2048  8388608  1048576  262144.0 POSIX      0
read        16989.27   16989.27   16989.27       0.00   16989.27   16989.27   16989.27       0.00   15.42997         NA            NA     0     16  16    1   1     1        1         0    0   2048  8388608  1048576  262144.0 POSIX      0
Finished            : Wed Jan 19 11:27:12 2022
32
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 11:27:14 2022
Command line        : ior -i 1 -t 1m -b 8m -s 1024 -C -F -e --posix.odirect
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 11:27:14 2022
Path                : /nvmedata/testdata
FS                  : 46.6 TiB   Used FS: 0.1%   Inodes: 46.6 Mi   Used Inodes: 0.0%

Options: 
api                 : POSIX
apiVersion          : 
test filename       : testFile
access              : file-per-process
type                : independent
segments            : 1024
ordering in a file  : sequential
ordering inter file : constant task offset
task offset         : 1
nodes               : 1
tasks               : 32
clients per node    : 32
repetitions         : 1
xfersize            : 1 MiB
blocksize           : 8 MiB
aggregate filesize  : 256 GiB

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     7767       7767       4.17        8192       1024.00    0.014471   33.75      4.00       33.75      0   
read      22874      22874      1.43        8192       1024.00    0.000224   11.46      0.125295   11.46      0   
remove    -          -          -           -          -          -          -          -          0.006248   0   
Max Write: 7767.22 MiB/sec (8144.52 MB/sec)
Max Read:  22873.94 MiB/sec (23985.07 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write        7767.22    7767.22    7767.22       0.00    7767.22    7767.22    7767.22       0.00   33.75005         NA            NA     0     32  32    1   1     1        1         0    0   1024  8388608  1048576  262144.0 POSIX      0
read        22873.94   22873.94   22873.94       0.00   22873.94   22873.94   22873.94       0.00   11.46038         NA            NA     0     32  32    1   1     1        1         0    0   1024  8388608  1048576  262144.0 POSIX      0
Finished            : Wed Jan 19 11:27:59 2022
------------------------------------
-- started at 01/19/2022 11:27:59 --

mdtest-3.3.0 was launched with 1 total task(s) on 1 node(s)
Command line used: mdtest '-n' '300' '-I' '10' '-z' '5' '-b' '2' '-R' '-P' '-Y'
Path: /nvmedata/testdata
FS: 46.6 TiB   Used FS: 0.2%   Inodes: 46.6 Mi   Used Inodes: 0.0%

Nodemap: 1
random seed: 1642562879
1 tasks, 18900 files/directories

SUMMARY rate: (of 1 iterations)
   Operation                      Max            Min           Mean        Std Dev
   ---------                      ---            ---           ----        -------
   Directory creation        :         99.910         99.910         99.910          0.000
   Directory stat            :       1029.991       1029.991       1029.991          0.000
   Directory removal         :         22.725         22.725         22.725          0.000
   File creation             :       3158.938       3158.938       3158.938          0.000
   File stat                 :      65315.701      65315.701      65315.701          0.000
   File read                 :     489653.035     489653.035     489653.035          0.000
   File removal              :       1308.708       1308.708       1308.708          0.000
   Tree creation             :        319.278        319.278        319.278          0.000
   Tree removal              :         68.936         68.936         68.936          0.000

SUMMARY time: (of 1 iterations)
   Operation                      Max            Min           Mean        Std Dev
   ---------                      ---            ---           ----        -------
   Directory creation        :          3.003          3.003          3.003          0.000
   Directory stat            :          0.291          0.291          0.291          0.000
   Directory removal         :         13.201         13.201         13.201          0.000
   File creation             :          5.983          5.983          5.983          0.000
   File stat                 :          0.289          0.289          0.289          0.000
   File read                 :          0.039          0.039          0.039          0.000
   File removal              :         14.442         14.442         14.442          0.000
   Tree creation             :          0.197          0.197          0.197          0.000
   Tree removal              :          0.914          0.914          0.914          0.000
-- finished at 01/19/2022 11:28:38 --

------------------------------------
```