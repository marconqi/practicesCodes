```
mpi with 4k file POSIX
4
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 07:04:22 2022
Command line        : ior -i 1 -t 4k -b 1024k -s 4096 -C -F -e
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 07:04:22 2022
Path                : /data/testdata
FS                  : 87.3 TiB   Used FS: 1.0%   Inodes: 87.3 Mi   Used Inodes: 0.5%

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
write     2030.54    519844     0.030358    1024.00    4.00       0.001463   8.07       1.13       8.07       0   
read      1968.99    504065     0.032355    1024.00    4.00       0.000037   8.32       0.055648   8.32       0   
remove    -          -          -           -          -          -          -          -          0.001426   0   
Max Write: 2030.54 MiB/sec (2129.18 MB/sec)
Max Read:  1968.99 MiB/sec (2064.63 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write        2030.54    2030.54    2030.54       0.00  519818.29  519818.29  519818.29       0.00    8.06879         NA            NA     0      4   4    1   1     1        1         0    0   4096  1048576     4096   16384.0 POSIX      0
read         1968.99    1968.99    1968.99       0.00  504060.67  504060.67  504060.67       0.00    8.32103         NA            NA     0      4   4    1   1     1        1         0    0   4096  1048576     4096   16384.0 POSIX      0
Finished            : Wed Jan 19 07:04:38 2022
16
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 07:04:39 2022
Command line        : ior -i 1 -t 4k -b 1024k -s 1024 -C -F -e
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 07:04:39 2022
Path                : /data/testdata
FS                  : 87.3 TiB   Used FS: 1.0%   Inodes: 87.3 Mi   Used Inodes: 0.5%

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
write     2123.50    543658     0.029112    1024.00    4.00       0.003692   7.71       0.449139   7.72       0   
read      2024.99    518400     0.031565    1024.00    4.00       0.000095   8.09       0.275973   8.09       0   
remove    -          -          -           -          -          -          -          -          0.004767   0   
Max Write: 2123.50 MiB/sec (2226.65 MB/sec)
Max Read:  2024.99 MiB/sec (2123.35 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write        2123.50    2123.50    2123.50       0.00  543615.86  543615.86  543615.86       0.00    7.71557         NA            NA     0     16  16    1   1     1        1         0    0   1024  1048576     4096   16384.0 POSIX      0
read         2024.99    2024.99    2024.99       0.00  518397.02  518397.02  518397.02       0.00    8.09091         NA            NA     0     16  16    1   1     1        1         0    0   1024  1048576     4096   16384.0 POSIX      0
Finished            : Wed Jan 19 07:04:55 2022
32
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 07:04:57 2022
Command line        : ior -i 1 -t 4k -b 1024k -s 512 -C -F -e
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 07:04:57 2022
Path                : /data/testdata
FS                  : 87.3 TiB   Used FS: 1.0%   Inodes: 87.3 Mi   Used Inodes: 0.5%

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
write     2043.10    523076     0.030100    1024.00    4.00       0.018503   8.02       1.34       8.02       0   
read      2044.54    523407     0.029630    1024.00    4.00       0.000264   8.01       0.736614   8.01       0   
remove    -          -          -           -          -          -          -          -          0.006829   0   
Max Write: 2043.10 MiB/sec (2142.34 MB/sec)
Max Read:  2044.54 MiB/sec (2143.86 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write        2043.10    2043.10    2043.10       0.00  523032.37  523032.37  523032.37       0.00    8.01921         NA            NA     0     32  32    1   1     1        1         0    0    512  1048576     4096   16384.0 POSIX      0
read         2044.54    2044.54    2044.54       0.00  523403.11  523403.11  523403.11       0.00    8.01353         NA            NA     0     32  32    1   1     1        1         0    0    512  1048576     4096   16384.0 POSIX      0
Finished            : Wed Jan 19 07:05:13 2022
mpi with 4k file directly POSIX
4
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 07:05:14 2022
Command line        : ior -i 1 -t 4k -b 1024k -s 4096 -C -F -e --posix.odirect
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 07:05:14 2022
Path                : /data/testdata
FS                  : 87.3 TiB   Used FS: 1.0%   Inodes: 87.3 Mi   Used Inodes: 0.5%

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
write     10.30      2635.59    6.16        1024.00    4.00       0.001029   1591.41    13.79      1591.41    0   
read      144.48     36987      0.442968    1024.00    4.00       0.000049   113.40     3.89       113.40     0   
remove    -          -          -           -          -          -          -          -          0.001985   0   
Max Write: 10.30 MiB/sec (10.80 MB/sec)
Max Read:  144.48 MiB/sec (151.50 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write          10.30      10.30      10.30       0.00    2635.59    2635.59    2635.59       0.00 1591.40870         NA            NA     0      4   4    1   1     1        1         0    0   4096  1048576     4096   16384.0 POSIX      0
read          144.48     144.48     144.48       0.00   36986.84   36986.84   36986.84       0.00  113.39991         NA            NA     0      4   4    1   1     1        1         0    0   4096  1048576     4096   16384.0 POSIX      0
Finished            : Wed Jan 19 07:33:38 2022
16
IOR-3.3.0: MPI Coordinated Test of Parallel I/O
Began               : Wed Jan 19 07:33:39 2022
Command line        : ior -i 1 -t 4k -b 1024k -s 1024 -C -F -e --posix.odirect
Machine             : Linux gpfs01
TestID              : 0
StartTime           : Wed Jan 19 07:33:39 2022
Path                : /data/testdata
FS                  : 87.3 TiB   Used FS: 1.0%   Inodes: 87.3 Mi   Used Inodes: 0.5%

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
```
