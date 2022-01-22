# whole range sweep

```bash
elbencho
Version: 2.0-7
Net protocol version: 2.0.11
Build date: Jan  5 2022 22:47:01
Included optional build features: backtrace s3 mimalloc 
Excluded optional build features: cuda cufile/gds 
graph_sweep.sh is installed at /usr/local/bin/graph_sweep.sh
mtelbencho.sh is installed at /usr/local/bin/mtelbencho.sh
range_to_sweep  : 
threads         : 32
src_data_dir    : /nvmedata/testdata
fs_block_size   : 4
block_size      : 16
num_sweep       : 1
output_dir      : /var/tmp/full
buffered        : 
verbose         : 1
traditional     : 
push_button_plot: 1
dry_run         : 
sweep_csv       : /var/tmp/full/sweep.csv
sweep_gplt      : /var/tmp/full/sweep.gplt
sweep_svg       : /var/tmp/full/sweep.svg
Space availability now is: 50704588734464 bytes.
Minimal requirement is   : 2000000000000 bytes.
===> Getting ready to sweep...
***> This is 1st sweep
range_to_sweep: 
threads       : 32
src_data_dir  : /nvmedata/testdata
fs_block_size : 4
block_size    : 16m
buffered      : 
verbose       : 1
dry_run       : 
cmd           : 
Space availability now is: 50704588734464 bytes.
Minimal requirement is   : 2000000000000 bytes.
Working on /nvmedata/testdata/1048576x1KiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         86
---
MKDIRS    Elapsed ms       :          1          2
          Dirs/s           :       9606      12441
          Dirs total       :         11         32
---
DROPCACHE Elapsed ms       :          0         18
---
WRITE     Elapsed ms       :     169100     170210
          Files/s          :       6163       6160
          Throughput MiB/s :          6          6
          Total MiB        :       1017       1024
          Files total      :    1042336    1048576
---
DROPCACHE Elapsed ms       :          0         41
---
RMFILES   Elapsed ms       :     889461     889783
          Files/s          :       1178       1178
          Files total      :    1047992    1048576
---
DROPCACHE Elapsed ms       :          0        393
---
Working on /nvmedata/testdata/1048576x2KiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         19
---
MKDIRS    Elapsed ms       :          0          0
          Dirs/s           :      68965      39457
          Dirs total       :         30         32
---
DROPCACHE Elapsed ms       :          0         16
---
WRITE     Elapsed ms       :     170631     171168
          Files/s          :       6127       6125
          Throughput MiB/s :         11         11
          Total MiB        :       2041       2048
          Files total      :    1045482    1048576
---
DROPCACHE Elapsed ms       :          0         36
---
RMFILES   Elapsed ms       :     893087     893557
          Files/s          :       1173       1173
          Files total      :    1047821    1048576
---
DROPCACHE Elapsed ms       :          0        422
---
Working on /nvmedata/testdata/1048576x4KiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         20
---
MKDIRS    Elapsed ms       :          0          0
          Dirs/s           :      37914      33229
          Dirs total       :         32         32
---
DROPCACHE Elapsed ms       :          0         16
---
WRITE     Elapsed ms       :     186438     187389
          Files/s          :       5600       5595
          Throughput MiB/s :         21         21
          Total MiB        :       4078       4096
          Files total      :    1044131    1048576
---
DROPCACHE Elapsed ms       :          0         36
---
RMFILES   Elapsed ms       :     893599     893893
          Files/s          :       1172       1173
          Files total      :    1048133    1048576
---
DROPCACHE Elapsed ms       :          0        379
---
Working on /nvmedata/testdata/1048576x8KiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         21
---
MKDIRS    Elapsed ms       :          0          0
          Dirs/s           :      59590      48265
          Dirs total       :         32         32
---
DROPCACHE Elapsed ms       :          0         19
---
WRITE     Elapsed ms       :     186573     187742
          Files/s          :       5592       5585
          Throughput MiB/s :         43         43
          Total MiB        :       8151       8192
          Files total      :    1043407    1048576
---
DROPCACHE Elapsed ms       :          0         32
---
RMFILES   Elapsed ms       :     885811     886049
          Files/s          :       1183       1183
          Files total      :    1048175    1048576
---
DROPCACHE Elapsed ms       :          0        383
---
Working on /nvmedata/testdata/1048576x16KiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         20
---
MKDIRS    Elapsed ms       :          1          1
          Dirs/s           :      28880      24205
          Dirs total       :         32         32
---
DROPCACHE Elapsed ms       :          0         16
---
WRITE     Elapsed ms       :     186035     186839
          Files/s          :       5618       5612
          Throughput MiB/s :         87         87
          Total MiB        :      16331      16384
          Files total      :    1045233    1048576
---
DROPCACHE Elapsed ms       :          0         35
---
RMFILES   Elapsed ms       :     895980     896667
          Files/s          :       1168       1169
          Files total      :    1047286    1048576
---
DROPCACHE Elapsed ms       :          0        412
---
Working on /nvmedata/testdata/1048576x32KiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         17
---
MKDIRS    Elapsed ms       :          1         59
          Dirs/s           :      27003        540
          Dirs total       :         31         32
---
DROPCACHE Elapsed ms       :          0         14
---
WRITE     Elapsed ms       :     185480     186344
          Files/s          :       5633       5627
          Throughput MiB/s :        176        175
          Total MiB        :      32653      32768
          Files total      :    1044895    1048576
---
DROPCACHE Elapsed ms       :          0         35
---
RMFILES   Elapsed ms       :     893301     893469
          Files/s          :       1173       1173
          Files total      :    1048313    1048576
---
DROPCACHE Elapsed ms       :          0        389
---
Working on /nvmedata/testdata/1048576x64KiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         18
---
MKDIRS    Elapsed ms       :          0          1
          Dirs/s           :      39845      31403
          Dirs total       :         31         32
---
DROPCACHE Elapsed ms       :          0         14
---
WRITE     Elapsed ms       :     187562     188486
          Files/s          :       5566       5563
          Throughput MiB/s :        347        347
          Total MiB        :      65254      65536
          Files total      :    1044065    1048576
---
DROPCACHE Elapsed ms       :          0         35
---
RMFILES   Elapsed ms       :     896820     896969
          Files/s          :       1168       1169
          Files total      :    1048332    1048576
---
DROPCACHE Elapsed ms       :          0        416
---
Working on /nvmedata/testdata/1048576x128KiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         97
---
MKDIRS    Elapsed ms       :          1          1
          Dirs/s           :       9090      19912
          Dirs total       :         10         32
---
DROPCACHE Elapsed ms       :          0         16
---
WRITE     Elapsed ms       :     188942     189989
          Files/s          :       5528       5519
          Throughput MiB/s :        691        689
          Total MiB        :     130562     131072
          Files total      :    1044497    1048576
---
DROPCACHE Elapsed ms       :          0         35
---
RMFILES   Elapsed ms       :     895485     895706
          Files/s          :       1170       1170
          Files total      :    1048194    1048576
---
DROPCACHE Elapsed ms       :          0        380
---
Working on /nvmedata/testdata/1048576x256KiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         16
---
MKDIRS    Elapsed ms       :          0          1
          Dirs/s           :      40178      28802
          Dirs total       :         18         32
---
DROPCACHE Elapsed ms       :          0         14
---
WRITE     Elapsed ms       :     192470     193631
          Files/s          :       5422       5415
          Throughput MiB/s :       1355       1353
          Total MiB        :     260906     262144
          Files total      :    1043627    1048576
---
DROPCACHE Elapsed ms       :          0         38
---
RMFILES   Elapsed ms       :     876004     879267
          Files/s          :       1191       1192
          Files total      :    1044095    1048576
---
DROPCACHE Elapsed ms       :          0        396
---
Working on /nvmedata/testdata/1048576x512KiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         16
---
MKDIRS    Elapsed ms       :          1          1
          Dirs/s           :      21505      23880
          Dirs total       :         22         32
---
DROPCACHE Elapsed ms       :          0         14
---
WRITE     Elapsed ms       :     184939     186268
          Files/s          :       5640       5629
          Throughput MiB/s :       2820       2814
          Total MiB        :     521564     524288
          Files total      :    1043128    1048576
---
DROPCACHE Elapsed ms       :          0         34
---
RMFILES   Elapsed ms       :     899162     899582
          Files/s          :       1165       1165
          Files total      :    1047811    1048576
---
DROPCACHE Elapsed ms       :          0        421
---
Working on /nvmedata/testdata/1048576x1MiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         20
---
MKDIRS    Elapsed ms       :          0          1
          Dirs/s           :       8353      21843
          Dirs total       :          7         32
---
DROPCACHE Elapsed ms       :          0         16
---
WRITE     Elapsed ms       :     190062     193626
          Files/s          :       5423       5415
          Throughput MiB/s :       5423       5415
          Total MiB        :    1030884    1048576
          Files total      :    1030884    1048576
---
DROPCACHE Elapsed ms       :          0         35
---
RMFILES   Elapsed ms       :     913282     913495
          Files/s          :       1147       1147
          Files total      :    1048247    1048576
---
DROPCACHE Elapsed ms       :          0        393
---
Working on /nvmedata/testdata/524288x2MiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         17
---
MKDIRS    Elapsed ms       :          1          1
          Dirs/s           :      25304      24596
          Dirs total       :         27         32
---
DROPCACHE Elapsed ms       :          0         14
---
WRITE     Elapsed ms       :     113484     137520
          Files/s          :       3894       3812
          Throughput MiB/s :       7788       7624
          Total MiB        :     883840    1048576
          Files total      :     441920     524288
---
DROPCACHE Elapsed ms       :          0         34
---
RMFILES   Elapsed ms       :     456548     456698
          Files/s          :       1147       1147
          Files total      :     524080     524288
---
DROPCACHE Elapsed ms       :          0        220
---
Working on /nvmedata/testdata/262144x4MiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         16
---
MKDIRS    Elapsed ms       :          0          0
          Dirs/s           :      28288      32955
          Dirs total       :         20         32
---
DROPCACHE Elapsed ms       :          0         14
---
WRITE     Elapsed ms       :      67100     129480
          Files/s          :       2076       2024
          Throughput MiB/s :       8306       8098
          Total MiB        :     557372    1048576
          Files total      :     139343     262144
---
DROPCACHE Elapsed ms       :          0         35
---
RMFILES   Elapsed ms       :     229170     229279
          Files/s          :       1143       1143
          Files total      :     261998     262144
---
DROPCACHE Elapsed ms       :          0        119
---
Working on /nvmedata/testdata/131072x8MiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         16
---
MKDIRS    Elapsed ms       :          0          0
          Dirs/s           :      41134      35242
          Dirs total       :         29         32
---
DROPCACHE Elapsed ms       :          0         14
---
WRITE     Elapsed ms       :     162222     174754
          Files/s          :        749        750
          Throughput MiB/s :       5997       6000
          Total MiB        :     972976    1048576
          Files total      :     121622     131072
---
DROPCACHE Elapsed ms       :          0         36
---
RMFILES   Elapsed ms       :     109421     109534
          Files/s          :       1196       1196
          Files total      :     130900     131072
---
DROPCACHE Elapsed ms       :          0         73
---
Working on /nvmedata/testdata/65536x16MiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         16
---
MKDIRS    Elapsed ms       :          0          1
          Dirs/s           :      32225      28268
          Dirs total       :         32         32
---
DROPCACHE Elapsed ms       :          0         13
---
WRITE     Elapsed ms       :      46181     174285
          Files/s          :        487        376
          Throughput MiB/s :       7794       6016
          Total MiB        :     359952    1048576
          Files total      :      22497      65536
---
DROPCACHE Elapsed ms       :          0         35
---
RMFILES   Elapsed ms       :      57901      57979
          Files/s          :       1129       1130
          Files total      :      65412      65536
---
DROPCACHE Elapsed ms       :          0         51
---
Working on /nvmedata/testdata/32768x32MiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         15
---
MKDIRS    Elapsed ms       :          1          1
          Dirs/s           :      22471      24672
          Dirs total       :         24         32
---
DROPCACHE Elapsed ms       :          0         14
---
WRITE     Elapsed ms       :     230011     236496
          Files/s          :        137        138
          IOPS             :        275        277
          Throughput MiB/s :       4407       4433
          Total MiB        :    1013872    1048576
          Files total      :      31677      32768
---
DROPCACHE Elapsed ms       :          0         29
---
RMFILES   Elapsed ms       :      28760      29193
          Files/s          :       1121       1122
          Files total      :      32242      32768
---
DROPCACHE Elapsed ms       :          0         34
---
Working on /nvmedata/testdata/16384x64MiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         16
---
MKDIRS    Elapsed ms       :          0          1
          Dirs/s           :      29666      30680
          Dirs total       :         24         32
---
DROPCACHE Elapsed ms       :          0         14
---
WRITE     Elapsed ms       :     228345     238072
          Files/s          :         68         68
          IOPS             :        273        275
          Throughput MiB/s :       4369       4404
          Total MiB        :     997712    1048576
          Files total      :      15577      16384
---
DROPCACHE Elapsed ms       :          0         27
---
RMFILES   Elapsed ms       :      13751      13772
          Files/s          :       1188       1189
          Files total      :      16338      16384
---
DROPCACHE Elapsed ms       :          0         23
---
Working on /nvmedata/testdata/8192x128MiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         16
---
MKDIRS    Elapsed ms       :          0          0
          Dirs/s           :      58287      45133
          Dirs total       :         32         32
---
DROPCACHE Elapsed ms       :          0         14
---
WRITE     Elapsed ms       :     218966     236488
          Files/s          :         34         34
          IOPS             :        274        277
          Throughput MiB/s :       4396       4433
          Total MiB        :     962768    1048576
          Files total      :       7508       8192
---
DROPCACHE Elapsed ms       :          0         30
---
RMFILES   Elapsed ms       :       5768       6285
          Files/s          :       1306       1303
          Files total      :       7537       8192
---
DROPCACHE Elapsed ms       :          0         20
---
Working on /nvmedata/testdata/4096x256MiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         15
---
MKDIRS    Elapsed ms       :          0          0
          Dirs/s           :      37558      32653
          Dirs total       :         32         32
---
DROPCACHE Elapsed ms       :          0         13
---
WRITE     Elapsed ms       :      89076     163552
          Files/s          :         26         25
          IOPS             :        427        400
          Throughput MiB/s :       6842       6411
          Total MiB        :     609520    1048576
          Files total      :       2365       4096
---
DROPCACHE Elapsed ms       :          0         27
---
RMFILES   Elapsed ms       :       1892       2029
          Files/s          :       2035       2017
          Files total      :       3852       4096
---
DROPCACHE Elapsed ms       :          0         19
---
Working on /nvmedata/testdata/2048x512MiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         15
---
MKDIRS    Elapsed ms       :          0          0
          Dirs/s           :      49230      40868
          Dirs total       :         32         32
---
DROPCACHE Elapsed ms       :          0         13
---
WRITE     Elapsed ms       :     170248     177622
          Files/s          :         11         11
          IOPS             :        366        368
          Throughput MiB/s :       5859       5903
          Total MiB        :     997520    1048576
          Files total      :       1935       2048
---
DROPCACHE Elapsed ms       :          0         24
---
RMFILES   Elapsed ms       :        296        525
          Files/s          :       3859       3895
          Files total      :       1143       2048
---
DROPCACHE Elapsed ms       :          0         17
---
Working on /nvmedata/testdata/1024x1GiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         15
---
WRITE     Elapsed ms       :      34425     204558
          IOPS             :        440        320
          Throughput MiB/s :       7044       5126
          Total MiB        :     242496    1048576
---
DROPCACHE Elapsed ms       :          0         21
---
RMFILES   Elapsed ms       :        138        181
          Files/s          :       7541     180499
          Files total      :       1043      32768
---
DROPCACHE Elapsed ms       :          0         17
---
Working on /nvmedata/testdata/512x2GiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         16
---
WRITE     Elapsed ms       :     229611     242367
          IOPS             :        269        270
          Throughput MiB/s :       4309       4326
          Total MiB        :     989456    1048576
---
DROPCACHE Elapsed ms       :          0         21
---
RMFILES   Elapsed ms       :         75         94
          Files/s          :      15825     172943
          Files total      :       1189      16384
---
DROPCACHE Elapsed ms       :          0         16
---
Working on /nvmedata/testdata/256x4GiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         16
---
WRITE     Elapsed ms       :     149947     169697
          IOPS             :        377        386
          Throughput MiB/s :       6039       6179
          Total MiB        :     905568    1048576
---
DROPCACHE Elapsed ms       :          0         20
---
RMFILES   Elapsed ms       :         35         50
          Files/s          :       7647     163555
          Files total      :        275       8192
---
DROPCACHE Elapsed ms       :          0         16
---
Working on /nvmedata/testdata/128x8GiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         16
---
WRITE     Elapsed ms       :     230078     241317
          IOPS             :        269        271
          Throughput MiB/s :       4313       4345
          Total MiB        :     992464    1048576
---
DROPCACHE Elapsed ms       :          0         21
---
RMFILES   Elapsed ms       :         20         24
          Files/s          :      37474     165281
          Files total      :        752       4096
---
DROPCACHE Elapsed ms       :          0         12
---
Working on /nvmedata/testdata/64x16GiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         20
---
WRITE     Elapsed ms       :     220554     239940
          IOPS             :        271        273
          Throughput MiB/s :       4339       4370
          Total MiB        :     957072    1048576
---
DROPCACHE Elapsed ms       :          0         21
---
RMFILES   Elapsed ms       :          9         12
          Files/s          :       9280     166870
          Files total      :         87       2048
---
DROPCACHE Elapsed ms       :          0         11
---
Working on /nvmedata/testdata/32x32GiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         15
---
WRITE     Elapsed ms       :      79433     170173
          IOPS             :        433        385
          Throughput MiB/s :       6930       6161
          Total MiB        :     550480    1048576
---
DROPCACHE Elapsed ms       :          0         21
---
RMFILES   Elapsed ms       :          2          3
          Files/s          :      43926     265284
          Files total      :        115       1024
---
DROPCACHE Elapsed ms       :          0         15
---
Working on /nvmedata/testdata/16x64GiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         16
---
WRITE     Elapsed ms       :     118745     156055
          IOPS             :        407        419
          Throughput MiB/s :       6519       6719
          Total MiB        :     774112    1048576
---
DROPCACHE Elapsed ms       :          0         23
---
RMFILES   Elapsed ms       :          1          2
          Files/s          :      70214     219836
          Files total      :         95        512
---
DROPCACHE Elapsed ms       :          0         16
---
Working on /nvmedata/testdata/8x128GiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         15
---
WRITE     Elapsed ms       :      43087     183121
          IOPS             :        487        357
          Throughput MiB/s :       7801       5726
          Total MiB        :     336160    1048576
---
DROPCACHE Elapsed ms       :          0         22
---
RMFILES   Elapsed ms       :          1          2
          Files/s          :      59973     117055
          Files total      :         92        256
---
DROPCACHE Elapsed ms       :          0         14
---
Working on /nvmedata/testdata/4x256GiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         16
---
WRITE     Elapsed ms       :     135590     140283
          IOPS             :        466        467
          Throughput MiB/s :       7461       7474
          Total MiB        :    1011648    1048576
---
DROPCACHE Elapsed ms       :          0         20
---
RMFILES   Elapsed ms       :          0          1
          Files/s          :      70938      93567
          Files total      :         31        128
---
DROPCACHE Elapsed ms       :          0         14
---
Working on /nvmedata/testdata/2x512GiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         15
---
WRITE     Elapsed ms       :      36289      64564
          IOPS             :        515        507
          Throughput MiB/s :       8254       8120
          Total MiB        :     299552     524288
---
DROPCACHE Elapsed ms       :          0         20
---
RMFILES   Elapsed ms       :          0          1
          Files/s          :      22312      20592
          Files total      :         11         32
---
DROPCACHE Elapsed ms       :          0         14
---
Working on /nvmedata/testdata/1x1024GiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         15
---
WRITE     Elapsed ms       :     106186     129556
          IOPS             :        505        505
          Throughput MiB/s :       8088       8093
          Total MiB        :     858944    1048576
---
DROPCACHE Elapsed ms       :          0         21
---
RMFILES   Elapsed ms       :          0          0
          Files/s          :      29411      33542
          Files total      :          6         32
---
DROPCACHE Elapsed ms       :          0         14
---
===> /usr/local/bin/mtelbencho.sh all done :)
Total test time: 4h:33m:29s
===> Sweeps done. Extracting results...
===> Results extracted. Plotting...
===> /usr/local/bin/graph_sweep.sh all done :)
Total test time: 4h:33m:29s
```

# sweep on data mount point
```
elbencho
Version: 2.0-7
Net protocol version: 2.0.11
Build date: Jan  5 2022 22:47:01
Included optional build features: backtrace s3 mimalloc 
Excluded optional build features: cuda cufile/gds 
graph_sweep.sh is installed at /usr/local/bin/graph_sweep.sh
mtelbencho.sh is installed at /usr/local/bin/mtelbencho.sh
range_to_sweep  : 
threads         : 32
src_data_dir    : /data/testdata
fs_block_size   : 4
block_size      : 16
num_sweep       : 1
output_dir      : /var/tmp/full
buffered        : 
verbose         : 1
traditional     : 
push_button_plot: 1
dry_run         : 
sweep_csv       : /var/tmp/full/sweep.csv
sweep_gplt      : /var/tmp/full/sweep.gplt
sweep_svg       : /var/tmp/full/sweep.svg
Space availability now is: 95066307690496 bytes.
Minimal requirement is   : 2000000000000 bytes.
===> Getting ready to sweep...
***> This is 1st sweep
range_to_sweep: 
threads       : 32
src_data_dir  : /data/testdata
fs_block_size : 4
block_size    : 16m
buffered      : 
verbose       : 1
dry_run       : 
cmd           : 
Space availability now is: 95066307690496 bytes.
Minimal requirement is   : 2000000000000 bytes.
Working on /data/testdata/1048576x1KiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0        166
---
MKDIRS    Elapsed ms       :         22         22
          Dirs/s           :        222       1391
          Dirs total       :          5         32
---
DROPCACHE Elapsed ms       :          0         18
---
WRITE     Elapsed ms       :     301149     304074
          Files/s          :       3466       3448
          Throughput MiB/s :          3          3
          Total MiB        :       1019       1024
          Files total      :    1044080    1048576
---
DROPCACHE Elapsed ms       :          0         36
---
RMFILES   Elapsed ms       :    1194686    1195886
          Files/s          :        876        876
          Files total      :    1047132    1048576
---
DROPCACHE Elapsed ms       :          0        426
---
Working on /data/testdata/1048576x2KiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         17
---
MKDIRS    Elapsed ms       :          0         59
          Dirs/s           :      44862        542
          Dirs total       :         31         32
---
DROPCACHE Elapsed ms       :          0         14
---
WRITE     Elapsed ms       :     307973     310941
          Files/s          :       3390       3372
          Throughput MiB/s :          6          6
          Total MiB        :       2039       2048
          Files total      :    1044273    1048576
---
DROPCACHE Elapsed ms       :          0         40
---
RMFILES   Elapsed ms       :    1182273    1182723
          Files/s          :        886        886
          Files total      :    1047916    1048576
---
DROPCACHE Elapsed ms       :          0        396
---
Working on /data/testdata/1048576x4KiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         17
---
MKDIRS    Elapsed ms       :          0          0
          Dirs/s           :      78431      59590
          Dirs total       :         32         32
---
DROPCACHE Elapsed ms       :          0         14
---
WRITE     Elapsed ms       :     446255     454580
          Files/s          :       2322       2306
          Throughput MiB/s :          9          9
          Total MiB        :       4048       4096
          Files total      :    1036517    1048576
---
DROPCACHE Elapsed ms       :          0         35
---
RMFILES   Elapsed ms       :    1371728    1374746
          Files/s          :        762        762
          Files total      :    1045690    1048576
---
DROPCACHE Elapsed ms       :          0        411
---
Working on /data/testdata/1048576x8KiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         17
---
MKDIRS    Elapsed ms       :          1          1
          Dirs/s           :      17101      20969
          Dirs total       :         19         32
---
DROPCACHE Elapsed ms       :          0         14
---
WRITE     Elapsed ms       :     452995     460173
          Files/s          :       2287       2278
          Throughput MiB/s :         17         17
          Total MiB        :       8097       8192
          Files total      :    1036447    1048576
---
DROPCACHE Elapsed ms       :          0         36
---
RMFILES   Elapsed ms       :    1289202    1290548
          Files/s          :        812        812
          Files total      :    1047324    1048576
---
DROPCACHE Elapsed ms       :          0        377
---
Working on /data/testdata/1048576x16KiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         21
---
MKDIRS    Elapsed ms       :          1          1
          Dirs/s           :      22857      23255
          Dirs total       :         24         32
---
DROPCACHE Elapsed ms       :          0         16
---
WRITE     Elapsed ms       :     516373     524502
          Files/s          :       2006       1999
          Throughput MiB/s :         31         31
          Total MiB        :      16190      16384
          Files total      :    1036221    1048576
---
DROPCACHE Elapsed ms       :          0         38
---
RMFILES   Elapsed ms       :    1334357    1338235
          Files/s          :        782        783
          Files total      :    1044764    1048576
---
DROPCACHE Elapsed ms       :          0        400
---
Working on /data/testdata/1048576x32KiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         16
---
MKDIRS    Elapsed ms       :          0          1
          Dirs/s           :      16414      28193
          Dirs total       :         13         32
---
DROPCACHE Elapsed ms       :          0         14
---
WRITE     Elapsed ms       :     604258     612937
          Files/s          :       1717       1710
          Throughput MiB/s :         53         53
          Total MiB        :      32438      32768
          Files total      :    1038020    1048576
---
DROPCACHE Elapsed ms       :          0         37
---
RMFILES   Elapsed ms       :    1350240    1352849
          Files/s          :        774        775
          Files total      :    1045996    1048576
---
DROPCACHE Elapsed ms       :          0        396
---
Working on /data/testdata/1048576x64KiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         16
---
MKDIRS    Elapsed ms       :          0          1
          Dirs/s           :      30368      27705
          Dirs total       :         28         32
---
DROPCACHE Elapsed ms       :          0         14
---
WRITE     Elapsed ms       :     807456     820919
          Files/s          :       1281       1277
          Throughput MiB/s :         80         79
          Total MiB        :      64678      65536
          Files total      :    1034848    1048576
---
DROPCACHE Elapsed ms       :          0         37
---
RMFILES   Elapsed ms       :    1311481    1313396
          Files/s          :        798        798
          Files total      :    1046794    1048576
---
DROPCACHE Elapsed ms       :          0        415
---
Working on /data/testdata/1048576x128KiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         17
---
MKDIRS    Elapsed ms       :          1         52
          Dirs/s           :      25291        613
          Dirs total       :         26         32
---
DROPCACHE Elapsed ms       :          0         13
---
WRITE     Elapsed ms       :     948025     965266
          Files/s          :       1092       1086
          Throughput MiB/s :        136        135
          Total MiB        :     129419     131072
          Files total      :    1035357    1048576
---
DROPCACHE Elapsed ms       :          0         40
---
RMFILES   Elapsed ms       :    1277351    1278548
          Files/s          :        819        820
          Files total      :    1047059    1048576
---
DROPCACHE Elapsed ms       :          0        381
---
Working on /data/testdata/1048576x256KiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         17
---
MKDIRS    Elapsed ms       :          0          1
          Dirs/s           :      17738      25157
          Dirs total       :         16         32
---
DROPCACHE Elapsed ms       :          0         14
---
WRITE     Elapsed ms       :     620874     629636
          Files/s          :       1675       1665
          Throughput MiB/s :        418        416
          Total MiB        :     260061     262144
          Files total      :    1040245    1048576
---
DROPCACHE Elapsed ms       :          0         39
---
RMFILES   Elapsed ms       :    1236577    1237230
          Files/s          :        847        847
          Files total      :    1047623    1048576
---
DROPCACHE Elapsed ms       :          0        409
---
Working on /data/testdata/1048576x512KiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         17
---
MKDIRS    Elapsed ms       :          0          1
          Dirs/s           :      34934      30947
          Dirs total       :         32         32
---
DROPCACHE Elapsed ms       :          0         14
---
WRITE     Elapsed ms       :     709212     717379
          Files/s          :       1470       1461
          Throughput MiB/s :        735        730
          Total MiB        :     521474     524288
          Files total      :    1042949    1048576
---
DROPCACHE Elapsed ms       :          0         41
---
RMFILES   Elapsed ms       :    1201975    1202374
          Files/s          :        871        872
          Files total      :    1047928    1048576
---
DROPCACHE Elapsed ms       :          0        419
---
Working on /data/testdata/1048576x1MiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         82
---
MKDIRS    Elapsed ms       :          1          1
          Dirs/s           :      23166      25216
          Dirs total       :         24         32
---
DROPCACHE Elapsed ms       :          0         15
---
WRITE     Elapsed ms       :     951428     963007
          Files/s          :       1095       1088
          Throughput MiB/s :       1095       1088
          Total MiB        :    1041818    1048576
          Files total      :    1041818    1048576
---
DROPCACHE Elapsed ms       :          0         38
---
RMFILES   Elapsed ms       :    1228597    1229540
          Files/s          :        852        852
          Files total      :    1047480    1048576
---
DROPCACHE Elapsed ms       :          0        388
---
Working on /data/testdata/524288x2MiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         19
---
MKDIRS    Elapsed ms       :         35         35
          Dirs/s           :        199        892
          Dirs total       :          7         32
---
DROPCACHE Elapsed ms       :          0         17
---
WRITE     Elapsed ms       :     744616     765175
          Files/s          :        694        685
          Throughput MiB/s :       1388       1370
          Total MiB        :    1033998    1048576
          Files total      :     516999     524288
---
DROPCACHE Elapsed ms       :          0         38
---
RMFILES   Elapsed ms       :     614859     615613
          Files/s          :        851        851
          Files total      :     523445     524288
---
DROPCACHE Elapsed ms       :          0        215
---
Working on /data/testdata/262144x4MiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         16
---
MKDIRS    Elapsed ms       :          0          0
          Dirs/s           :      48543      46444
          Dirs total       :         20         32
---
DROPCACHE Elapsed ms       :          0         14
---
WRITE     Elapsed ms       :     660069     678990
          Files/s          :        388        386
          Throughput MiB/s :       1554       1544
          Total MiB        :    1025824    1048576
          Files total      :     256456     262144
---
DROPCACHE Elapsed ms       :          0         47
---
RMFILES   Elapsed ms       :     285063     285341
          Files/s          :        918        918
          Files total      :     261747     262144
---
DROPCACHE Elapsed ms       :          0        125
---
Working on /data/testdata/131072x8MiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         15
---
MKDIRS    Elapsed ms       :          0          1
          Dirs/s           :      26460      28021
          Dirs total       :         24         32
---
DROPCACHE Elapsed ms       :          0         14
---
WRITE     Elapsed ms       :     612067     641707
          Files/s          :        205        204
          Throughput MiB/s :       1647       1634
          Total MiB        :    1008304    1048576
          Files total      :     126038     131072
---
DROPCACHE Elapsed ms       :          0         36
---
RMFILES   Elapsed ms       :     143309     143497
          Files/s          :        912        913
          Files total      :     130809     131072
---
DROPCACHE Elapsed ms       :          0         76
---
Working on /data/testdata/65536x16MiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         15
---
MKDIRS    Elapsed ms       :          0          1
          Dirs/s           :      29484      30303
          Dirs total       :         24         32
---
DROPCACHE Elapsed ms       :          0         14
---
WRITE     Elapsed ms       :     584582     626477
          Files/s          :        105        104
          Throughput MiB/s :       1686       1673
          Total MiB        :     985776    1048576
          Files total      :      61611      65536
---
DROPCACHE Elapsed ms       :          0         39
---
RMFILES   Elapsed ms       :      66677      66868
          Files/s          :        980        980
          Files total      :      65399      65536
---
DROPCACHE Elapsed ms       :          0         52
---
Working on /data/testdata/32768x32MiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         15
---
MKDIRS    Elapsed ms       :         44         44
          Dirs/s           :        521        720
          Dirs total       :         23         32
---
DROPCACHE Elapsed ms       :          0         15
---
WRITE     Elapsed ms       :     592525     633236
          Files/s          :         52         51
          IOPS             :        104        103
          Throughput MiB/s :       1677       1655
          Total MiB        :     994240    1048576
          Files total      :      31061      32768
---
DROPCACHE Elapsed ms       :          0         37
---
RMFILES   Elapsed ms       :      32236      33234
          Files/s          :       1005        985
          Files total      :      32405      32768
---
DROPCACHE Elapsed ms       :          0         34
---
Working on /data/testdata/16384x64MiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         16
---
MKDIRS    Elapsed ms       :          0          0
          Dirs/s           :      56603      44755
          Dirs total       :         30         32
---
DROPCACHE Elapsed ms       :          0         14
---
WRITE     Elapsed ms       :     592609     622819
          Files/s          :         26         26
          IOPS             :        105        105
          Throughput MiB/s :       1691       1683
          Total MiB        :    1002416    1048576
          Files total      :      15652      16384
---
DROPCACHE Elapsed ms       :          0         47
---
RMFILES   Elapsed ms       :      15131      15199
          Files/s          :       1073       1077
          Files total      :      16240      16384
---
DROPCACHE Elapsed ms       :          0         28
---
Working on /data/testdata/8192x128MiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         16
---
MKDIRS    Elapsed ms       :          0          0
          Dirs/s           :      64646      47619
          Dirs total       :         32         32
---
DROPCACHE Elapsed ms       :          0         13
---
WRITE     Elapsed ms       :     587032     625171
          Files/s          :         13         13
          IOPS             :        105        104
          Throughput MiB/s :       1684       1677
          Total MiB        :     989024    1048576
          Files total      :       7712       8192
---
DROPCACHE Elapsed ms       :          0         35
---
RMFILES   Elapsed ms       :       6352       6379
          Files/s          :       1279       1284
          Files total      :       8128       8192
---
DROPCACHE Elapsed ms       :          0         20
---
Working on /data/testdata/4096x256MiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         15
---
MKDIRS    Elapsed ms       :          0          0
          Dirs/s           :      45070      33790
          Dirs total       :         32         32
---
DROPCACHE Elapsed ms       :          0         13
---
WRITE     Elapsed ms       :     597838     634630
          Files/s          :          6          6
          IOPS             :        104        103
          Throughput MiB/s :       1672       1652
          Total MiB        :     999824    1048576
          Files total      :       3892       4096
---
DROPCACHE Elapsed ms       :          0         32
---
RMFILES   Elapsed ms       :       2147       2198
          Files/s          :       1842       1862
          Files total      :       3957       4096
---
DROPCACHE Elapsed ms       :          0         18
---
Working on /data/testdata/2048x512MiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         15
---
MKDIRS    Elapsed ms       :          0          0
          Dirs/s           :      38095      32753
          Dirs total       :         32         32
---
DROPCACHE Elapsed ms       :          0         14
---
WRITE     Elapsed ms       :     594507     621820
          Files/s          :          3          3
          IOPS             :        105        105
          Throughput MiB/s :       1693       1686
          Total MiB        :    1006976    1048576
          Files total      :       1952       2048
---
DROPCACHE Elapsed ms       :          0         30
---
RMFILES   Elapsed ms       :        551        645
          Files/s          :       2955       3171
          Files total      :       1631       2048
---
DROPCACHE Elapsed ms       :          0         16
---
Working on /data/testdata/1024x1GiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         15
---
WRITE     Elapsed ms       :     602506     621031
          IOPS             :        105        105
          Throughput MiB/s :       1689       1688
          Total MiB        :    1017920    1048576
---
DROPCACHE Elapsed ms       :          0         29
---
RMFILES   Elapsed ms       :        137        191
          Files/s          :      17756     171331
          Files total      :       2442      32768
---
DROPCACHE Elapsed ms       :          0         16
---
Working on /data/testdata/512x2GiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         18
---
WRITE     Elapsed ms       :     586020     615248
          IOPS             :        106        106
          Throughput MiB/s :       1708       1704
          Total MiB        :    1001376    1048576
---
DROPCACHE Elapsed ms       :          0         27
---
RMFILES   Elapsed ms       :         72         93
          Files/s          :       7403     175070
          Files total      :        535      16384
---
DROPCACHE Elapsed ms       :          0         16
---
Working on /data/testdata/256x4GiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         16
---
WRITE     Elapsed ms       :     589682     618884
          IOPS             :        106        105
          Throughput MiB/s :       1701       1694
          Total MiB        :    1003376    1048576
---
DROPCACHE Elapsed ms       :          0         26
---
RMFILES   Elapsed ms       :         39         50
          Files/s          :       7680     162426
          Files total      :        307       8192
---
DROPCACHE Elapsed ms       :          0         16
---
Working on /data/testdata/128x8GiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         15
---
WRITE     Elapsed ms       :     602513     623038
          IOPS             :        105        105
          Throughput MiB/s :       1691       1683
          Total MiB        :    1019376    1048576
---
DROPCACHE Elapsed ms       :          0         30
---
RMFILES   Elapsed ms       :         22         29
          Files/s          :       7766     139561
          Files total      :        176       4096
---
DROPCACHE Elapsed ms       :          0         17
---
Working on /data/testdata/64x16GiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         16
---
WRITE     Elapsed ms       :     591306     621993
          IOPS             :        105        105
          Throughput MiB/s :       1693       1685
          Total MiB        :    1001616    1048576
---
DROPCACHE Elapsed ms       :          0         25
---
RMFILES   Elapsed ms       :         17         19
          Files/s          :      62204     105883
          Files total      :       1105       2048
---
DROPCACHE Elapsed ms       :          0         16
---
Working on /data/testdata/32x32GiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         16
---
WRITE     Elapsed ms       :     595168     619265
          IOPS             :        105        105
          Throughput MiB/s :       1693       1693
          Total MiB        :    1007824    1048576
---
DROPCACHE Elapsed ms       :          0         27
---
RMFILES   Elapsed ms       :          4          6
          Files/s          :      32052     160325
          Files total      :        151       1024
---
DROPCACHE Elapsed ms       :          0         16
---
Working on /data/testdata/16x64GiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         16
---
WRITE     Elapsed ms       :     595166     624766
          IOPS             :        105        104
          Throughput MiB/s :       1692       1678
          Total MiB        :    1007488    1048576
---
DROPCACHE Elapsed ms       :          0         29
---
RMFILES   Elapsed ms       :          5          6
          Files/s          :      14189      74657
          Files total      :         82        512
---
DROPCACHE Elapsed ms       :          0         16
---
Working on /data/testdata/8x128GiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         16
---
WRITE     Elapsed ms       :     599697     620973
          IOPS             :        105        105
          Throughput MiB/s :       1684       1688
          Total MiB        :    1010208    1048576
---
DROPCACHE Elapsed ms       :          0         27
---
RMFILES   Elapsed ms       :          2          2
          Files/s          :      22843      86224
          Files total      :         49        256
---
DROPCACHE Elapsed ms       :          0         16
---
Working on /data/testdata/4x256GiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         16
---
WRITE     Elapsed ms       :     599008     625158
          IOPS             :        105        104
          Throughput MiB/s :       1694       1677
          Total MiB        :    1015200    1048576
---
DROPCACHE Elapsed ms       :          0         34
---
RMFILES   Elapsed ms       :          1          2
          Files/s          :      32258      49747
          Files total      :         58        128
---
DROPCACHE Elapsed ms       :          0         16
---
Working on /data/testdata/2x512GiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         16
---
WRITE     Elapsed ms       :     317199     341536
          IOPS             :         95         95
          Throughput MiB/s :       1533       1535
          Total MiB        :     486528     524288
---
DROPCACHE Elapsed ms       :          0         27
---
RMFILES   Elapsed ms       :          0          1
          Files/s          :      33457      25098
          Files total      :          9         32
---
DROPCACHE Elapsed ms       :          0         20
---
Working on /data/testdata/1x1024GiB with 32 threads...
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         16
---
WRITE     Elapsed ms       :     651128     672498
          IOPS             :         97         97
          Throughput MiB/s :       1556       1559
          Total MiB        :    1013264    1048576
---
DROPCACHE Elapsed ms       :          0         27
---
RMFILES   Elapsed ms       :          0          1
          Files/s          :      18987      23862
          Files total      :          6         32
---
DROPCACHE Elapsed ms       :          0         16
---
===> /usr/local/bin/mtelbencho.sh all done :)
Total test time: 9h:33m:18s
===> Sweeps done. Extracting results...
===> Results extracted. Plotting...
===> /usr/local/bin/graph_sweep.sh all done :)
Total test time: 9h:33m:18s
```