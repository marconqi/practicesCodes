# script
```bash
#!/usr/bin/bash


for i in 1 2 4 8 16 24 32;
do
  /usr/local/bin/elbencho.sh -b 1m --direct --dropcache -N$(( 128000 / $i )) -n1 -s 1m -t$i -r -w -d out
done
```

# Results
```bash
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :         59         59
---
MKDIRS    Elapsed ms       :         50         50
          Dirs/s           :         19         19
          Dirs total       :          1          1
---
DROPCACHE Elapsed ms       :         20         20
---
WRITE     Elapsed ms       :    2386343    2386343
          Files/s          :         53         53
          Throughput MiB/s :         53         53
          Total MiB        :     128000     128000
          Files total      :     128000     128000
---
DROPCACHE Elapsed ms       :         55         55
---
READ      Elapsed ms       :    2426346    2426346
          Files/s          :         52         52
          Throughput MiB/s :         52         52
          Total MiB        :     128000     128000
          Files total      :     128000     128000
---
DROPCACHE Elapsed ms       :         43         43
---
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         36
---
MKDIRS    Elapsed ms       :         72         80
          Dirs/s           :         13         24
          Dirs total       :          1          2
---
DROPCACHE Elapsed ms       :          0         20
---
WRITE     Elapsed ms       :    1355553    1431312
          Files/s          :         91         89
          Throughput MiB/s :         91         89
          Total MiB        :     123882     128000
          Files total      :     123882     128000
---
DROPCACHE Elapsed ms       :          0         45
---
READ      Elapsed ms       :     952990    1100590
          Files/s          :        124        116
          Throughput MiB/s :        124        116
          Total MiB        :     118928     128000
          Files total      :     118928     128000
---
DROPCACHE Elapsed ms       :          0         45
---
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         34
---
MKDIRS    Elapsed ms       :         55         56
          Dirs/s           :         17         70
          Dirs total       :          1          4
---
DROPCACHE Elapsed ms       :          0         20
---
WRITE     Elapsed ms       :     689770     699420
          Files/s          :        184        183
          Throughput MiB/s :        184        183
          Total MiB        :     127556     128000
          Files total      :     127556     128000
---
DROPCACHE Elapsed ms       :          0         40
---
READ      Elapsed ms       :     402087     415528
          Files/s          :        312        308
          Throughput MiB/s :        312        308
          Total MiB        :     125824     128000
          Files total      :     125824     128000
---
DROPCACHE Elapsed ms       :          0         38
---
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         35
---
MKDIRS    Elapsed ms       :         90         92
          Dirs/s           :         55         86
          Dirs total       :          5          8
---
DROPCACHE Elapsed ms       :          0         21
---
WRITE     Elapsed ms       :     331493     368962
          Files/s          :        371        346
          Throughput MiB/s :        371        346
          Total MiB        :     123214     128000
          Files total      :     123214     128000
---
DROPCACHE Elapsed ms       :          0         42
---
READ      Elapsed ms       :     239507     253683
          Files/s          :        523        504
          Throughput MiB/s :        523        504
          Total MiB        :     125272     128000
          Files total      :     125272     128000
---
DROPCACHE Elapsed ms       :          0         42
---
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          1         37
---
MKDIRS    Elapsed ms       :         64         64
          Dirs/s           :        248        247
          Dirs total       :         16         16
---
DROPCACHE Elapsed ms       :          1         23
---
WRITE     Elapsed ms       :     206397     236774
          Files/s          :        587        540
          Throughput MiB/s :        587        540
          Total MiB        :     121219     128000
          Files total      :     121219     128000
---
DROPCACHE Elapsed ms       :          0         43
---
READ      Elapsed ms       :     174985     194180
          Files/s          :        702        659
          Throughput MiB/s :        702        659
          Total MiB        :     122905     128000
          Files total      :     122905     128000
---
DROPCACHE Elapsed ms       :          0         40
---
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          2         37
---
MKDIRS    Elapsed ms       :         85         88
          Dirs/s           :        245        271
          Dirs total       :         21         24
---
DROPCACHE Elapsed ms       :          2         23
---
WRITE     Elapsed ms       :     186292     209569
          Files/s          :        617        610
          Throughput MiB/s :        617        610
          Total MiB        :     115098     127992
          Files total      :     115098     127992
---
DROPCACHE Elapsed ms       :          0         40
---
READ      Elapsed ms       :     177357     198422
          Files/s          :        661        645
          Throughput MiB/s :        661        645
          Total MiB        :     117383     127992
          Files total      :     117383     127992
---
DROPCACHE Elapsed ms       :          0         42
---
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          2         38
---
MKDIRS    Elapsed ms       :         69         77
          Dirs/s           :        389        415
          Dirs total       :         27         32
---
DROPCACHE Elapsed ms       :          2         24
---
WRITE     Elapsed ms       :     160786     193646
          Files/s          :        699        660
          Throughput MiB/s :        699        660
          Total MiB        :     112402     128000
          Files total      :     112402     128000
---
DROPCACHE Elapsed ms       :          0         43
---
READ      Elapsed ms       :     143007     190332
          Files/s          :        729        672
          Throughput MiB/s :        729        672
          Total MiB        :     104331     128000
          Files total      :     104331     128000
---
DROPCACHE Elapsed ms       :          2         52
---
```

## nvmedata
```bash
# cat nohup.out 
1 threads
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :         54         54
---
MKDIRS    Elapsed ms       :          0          0
          Dirs/s           :       1253       1253
          Dirs total       :          1          1
---
DROPCACHE Elapsed ms       :         16         16
---
WRITE     Elapsed ms       :     285549     285549
          Files/s          :        448        448
          Throughput MiB/s :        448        448
          Total MiB        :     128000     128000
          Files total      :     128000     128000
---
DROPCACHE Elapsed ms       :         38         38
---
READ      Elapsed ms       :     216722     216722
          Files/s          :        590        590
          Throughput MiB/s :        590        590
          Total MiB        :     128000     128000
          Files total      :     128000     128000
---
DROPCACHE Elapsed ms       :         36         36
---
2 threads
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         19
---
MKDIRS    Elapsed ms       :          0          1
          Dirs/s           :       2094       1970
          Dirs total       :          2          2
---
DROPCACHE Elapsed ms       :          0         16
---
WRITE     Elapsed ms       :     103421     143601
          Files/s          :       1063        891
          Throughput MiB/s :       1063        891
          Total MiB        :     110002     128000
          Files total      :     110002     128000
---
DROPCACHE Elapsed ms       :          0         36
---
READ      Elapsed ms       :     107982     112216
          Files/s          :       1160       1140
          Throughput MiB/s :       1160       1140
          Total MiB        :     125333     128000
          Files total      :     125333     128000
---
DROPCACHE Elapsed ms       :          0         36
---
4 threads
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         19
---
MKDIRS    Elapsed ms       :          0          1
          Dirs/s           :       7874       2190
          Dirs total       :          1          4
---
DROPCACHE Elapsed ms       :          0         16
---
WRITE     Elapsed ms       :      53507      79622
          Files/s          :       1957       1607
          Throughput MiB/s :       1957       1607
          Total MiB        :     104715     128000
          Files total      :     104715     128000
---
DROPCACHE Elapsed ms       :          0         37
---
READ      Elapsed ms       :      54181      58126
          Files/s          :       2271       2202
          Throughput MiB/s :       2271       2202
          Total MiB        :     123061     128000
          Files total      :     123061     128000
---
DROPCACHE Elapsed ms       :          0         35
---
8 threads
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         18
---
MKDIRS    Elapsed ms       :          0          3
          Dirs/s           :      24390       2361
          Dirs total       :          3          8
---
DROPCACHE Elapsed ms       :          0         15
---
WRITE     Elapsed ms       :      30541      43805
          Files/s          :       3429       2922
          Throughput MiB/s :       3429       2922
          Total MiB        :     104745     128000
          Files total      :     104745     128000
---
DROPCACHE Elapsed ms       :          0         36
---
READ      Elapsed ms       :      30021      32429
          Files/s          :       4089       3947
          Throughput MiB/s :       4089       3947
          Total MiB        :     122781     128000
          Files total      :     122781     128000
---
DROPCACHE Elapsed ms       :          0         35
---
16 threads
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         19
---
MKDIRS    Elapsed ms       :          0          4
          Dirs/s           :      17094       3817
          Dirs total       :          2         16
---
DROPCACHE Elapsed ms       :          0         16
---
WRITE     Elapsed ms       :      18539      25365
          Files/s          :       5824       5046
          Throughput MiB/s :       5824       5046
          Total MiB        :     107984     128000
          Files total      :     107984     128000
---
DROPCACHE Elapsed ms       :          0         31
---
READ      Elapsed ms       :      19848      21653
          Files/s          :       6135       5911
          Throughput MiB/s :       6135       5911
          Total MiB        :     121792     128000
          Files total      :     121792     128000
---
DROPCACHE Elapsed ms       :          0         32
---
24 threads
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         16
---
MKDIRS    Elapsed ms       :          0          4
          Dirs/s           :      38461       5904
          Dirs total       :          4         24
---
DROPCACHE Elapsed ms       :          0         13
---
WRITE     Elapsed ms       :      19097      22855
          Files/s          :       6007       5600
          Throughput MiB/s :       6007       5600
          Total MiB        :     114730     127992
          Files total      :     114730     127992
---
DROPCACHE Elapsed ms       :          0         32
---
READ      Elapsed ms       :      23221      24119
          Files/s          :       5353       5306
          Throughput MiB/s :       5353       5306
          Total MiB        :     124326     127992
          Files total      :     124326     127992
---
DROPCACHE Elapsed ms       :          0         34
---
32 threads
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
DROPCACHE Elapsed ms       :          0         16
---
MKDIRS    Elapsed ms       :          0          4
          Dirs/s           :      38461       6811
          Dirs total       :          4         32
---
DROPCACHE Elapsed ms       :          0         14
---
WRITE     Elapsed ms       :      20805      23655
          Files/s          :       5612       5411
          Throughput MiB/s :       5612       5411
          Total MiB        :     116766     128000
          Files total      :     116766     128000
---
DROPCACHE Elapsed ms       :          0         33
---
READ      Elapsed ms       :      23127      23870
          Files/s          :       5386       5362
          Throughput MiB/s :       5386       5362
          Total MiB        :     124574     128000
          Files total      :     124574     128000
---
DROPCACHE Elapsed ms       :          0         30
---
```

graph_sweep.sh -s /nvmedata/testdata -t 32 -b 16 -p -v -N 1
nohup graph_sweep.sh -s /nvmedata/testdata -t 32 -b 16 -p -v -N 1