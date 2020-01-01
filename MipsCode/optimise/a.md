# 提升编程性能的主要手段
+ Loop unrolling
+ Cache Blocking
+ 多线程(OpenMP、Intel TBB、)
+ 向量化


# Loop unrolling
> 提升代码尺寸以获得性能上的提升,  但编译器会自动优化, 所以我们不用进行手动展开. 在 gcc 中可以选择 -unloop 参数来选择循环展开.
https://zhuanlan.zhihu.com/p/37582101

# Cache Blocking
> 如果 Cache  中某个 block 中的数据频繁换入换出，是极其低效率的。所以我们编写的程序应该尽量的遵循时间局部性与空间局部性原理.比如：

1. 常见的做法为调换循环顺序，让内存循环(最频繁)优先以行为单位遍历数组而不是以列为单位遍历数组.
2. 内存对齐


# Intel sse 和 Intel avx


