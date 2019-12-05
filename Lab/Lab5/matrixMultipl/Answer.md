# 答案
gcc -ggdb -Wall -pedantic -std=gnu99 -O3    matrixMultiply.c   -o matrixMultiply
gcc -o matrixMultiply -ggdb -Wall -pedantic -std=gnu99 -O3 matrixMultiply.c
./matrixMultiply
Running Part A...

n = 10, 1.000 Gflop/s
n = 14, 1.372 Gflop/s
n = 19, 1.372 Gflop/s
n = 26, 1.255 Gflop/s
n = 35, 1.243 Gflop/s
n = 47, 1.099 Gflop/s
n = 63, 1.064 Gflop/s
n = 85, 0.962 Gflop/s
n = 114, 0.960 Gflop/s
n = 153, 1.155 Gflop/s
n = 205, 1.696 Gflop/s
n = 274, 1.706 Gflop/s
n = 366, 1.920 Gflop/s
n = 489, 2.006 Gflop/s
n = 653, 1.993 Gflop/s
n = 871, 1.970 Gflop/s
n = 1000, 1.959 Gflop/s


./matrixMultiply 2
Running Part B...

ijk:	n = 1000, 1.826 Gflop/s
ikj:	n = 1000, 0.551 Gflop/s
jik:	n = 1000, 1.329 Gflop/s
jki:	n = 1000, 3.735 Gflop/s
kij:	n = 1000, 0.551 Gflop/s
kji:	n = 1000, 5.288 Gflop/s

## 结果分析
a. Why does Gflop/s performance drop for large values of n?
答: 因为 Cache 空间有限，当数据过大时需要不停的换入换出数据.导致Cache命中率下降.

b. The second run of matrixMultiply runs all 6 different loop orderings. Which ordering(s) perform best for 1000-by-1000 matrices? Which ordering(s) perform the worst? How does the way we stride through the matrices with respect to the innermost loop affect performance?
答: 跨列访问的次数越大，性能就越差.由于内层循环执行次数最大，我们只需要让内存循环更多的做行访问操作而不是列访问，让最外层循环来访问行，效率会大大提升. kji将列的访问循环放到了最外面, 更好的遵守了空间局部性原理,所以性能过得了质的提升.
    Cache 常常一次置换一个 block, 即使数据没有一个 block 那么大，也会将其周围的数据一起置换.
