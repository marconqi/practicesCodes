# GPFS configure
```bash
# mmlsconfig 
Configuration data for cluster cclab.gpfs01:
--------------------------------------------
clusterName cclab.gpfs01
clusterId 4773140940306773714
autoload no
dmapiFileHandleSize 32
minReleaseLevel 5.0.5.1
ccrEnabled yes
cipherList AUTHONLY
verbsRdma enable
verbsPorts mlx5_0/1
maxMBpS 40000
pagepool 4g
scatterBuffers yes
scatterBufferSize 262144
nsdThreadsPerDisk 8
nsdMaxWorkerThreads 512
adminMode central

File systems in cluster cclab.gpfs01:
-------------------------------------
/dev/data
/dev/nvmedata
[root@gpfs01 forTesting]# mmgetstate -a

 Node number  Node name        GPFS state  
-------------------------------------------
       1      gpfs01           active
       2      gpfs02           active

# lscpu
Architecture:          x86_64
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
CPU(s):                64
On-line CPU(s) list:   0-63
Thread(s) per core:    2
Core(s) per socket:    32
Socket(s):             1
NUMA node(s):          1
Vendor ID:             AuthenticAMD
CPU family:            23
Model:                 49
Model name:            AMD EPYC 7532 32-Core Processor
Stepping:              0
CPU MHz:               2400.000
CPU max MHz:           2400.0000
CPU min MHz:           1500.0000
BogoMIPS:              4790.76
Virtualization:        AMD-V
L1d cache:             32K
L1i cache:             32K
L2 cache:              512K
L3 cache:              16384K
NUMA node0 CPU(s):     0-63
Flags:                 fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc art rep_good nopl nonstop_tsc extd_apicid aperfmperf eagerfpu pni pclmulqdq monitor ssse3 fma cx16 sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand lahf_lm cmp_legacy svm extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw ibs skinit wdt tce topoext perfctr_core perfctr_nb bpext perfctr_l2 cpb cat_l3 cdp_l3 hw_pstate retpoline_amd ssbd ibrs ibpb stibp vmmcall fsgsbase bmi1 avx2 smep bmi2 cqm rdt_a rdseed adx smap clflushopt clwb sha_ni xsaveopt xsavec xgetbv1 cqm_llc cqm_occup_llc cqm_mbm_total cqm_mbm_local clzero irperf xsaveerptr arat npt lbrv svm_lock nrip_save tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold avic v_vmsave_vmload vgif umip overflow_recov succor smca
[root@gpfs01 forTesting]# free -g
              total        used        free      shared  buff/cache   available
Mem:            188          10         167           0          10         177
Swap:            31           0          31

# cat /proc/meminfo 
MemTotal:       197823592 kB
MemFree:        175877920 kB
MemAvailable:   185884052 kB
Buffers:          244628 kB
Cached:         10290308 kB
SwapCached:            0 kB
Active:          5948812 kB
Inactive:        5167848 kB
Active(anon):     590776 kB
Inactive(anon):    27376 kB
Active(file):    5358036 kB
Inactive(file):  5140472 kB
Unevictable:     4205088 kB
Mlocked:         4205088 kB
SwapTotal:      33554428 kB
SwapFree:       33554428 kB
Dirty:                 4 kB
Writeback:             0 kB
AnonPages:       4786920 kB
Mapped:           181116 kB
Shmem:             30088 kB
Slab:            1110312 kB
SReclaimable:     556548 kB
SUnreclaim:       553764 kB
KernelStack:       32832 kB
PageTables:        33500 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:    131204656 kB
Committed_AS:    8781808 kB
VmallocTotal:   34359738367 kB
VmallocUsed:      762912 kB
VmallocChunk:   34358736876 kB
Percpu:            15104 kB
HardwareCorrupted:     0 kB
AnonHugePages:   4442112 kB
CmaTotal:              0 kB
CmaFree:               0 kB
HugePages_Total:    1232
HugePages_Free:     1232
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
DirectMap4k:      695548 kB
DirectMap2M:    19075072 kB
DirectMap1G:    181403648 kB


```