
# Porblem 2

# 前提：
32bits-float
6bits expoent
bias 31

###### a. Convert -25.25 to floating point format. Write your answer in hexadecimal.
答:
```
25.25 == 11001.01
nomalized: 1001.01 == 1.1100101 * 2^5
exponent 移码化: 5 + 31 == 36 --> 100100
binary code:   1 100100 1001010000000000000000000
Hexadecimal:    1100 1001 0010 1000 0000 0000 0000 0000
                0X-C9280000 
```
###### b. What's the smallest positive integer (an integer has nothing to the right of the decimal) it CANNOT represent? Leave your answer in terms of powers of 2.
答: 最小不能表示的正数为: -1*2^-126 == 1.175494e-38

###### c. What's the smallest positive value it can represent that is not a denorm? Leave your answer as a power of 2. (Does the implicit exponent make sense?) 
答:

postive --> sign == 0
expoent == 1-127 == -126(exponent=0、255, 这两个值不能使用)
significant == 0
最小正数为: (-1)s* 1*2^-126 == 1.175494e-38

4. What's the smallest positive value it can represent? Leave your answer as a power of 2.
答: 不懂和第三个问题的区别


# Problem 3: Caches - 4pts
Assume we have 16 bit byte-addresses. A very tiny direct-mapped cache holds a total of 32 bytes and each cache block is a word wide.

##### 信息提取
Cache Block Size == 1 word == 4 bytes
Cache Area == 32 bytes
每个地址 16 位

###### a. How many bits are used for the tag?
tag 
== all bits - index bits - offest bits
== 32 - log2^(32/4) - log2^4 
== 32 -3 - 2 == 27

###### b. Which other bytes would share a block with the byte at address 0x75? 其他哪个字节将与地址为0x75的字节共享一个块？
> 能与 0x75 共享 Cache 中同一个 block 的地址，解决方法为:
> 1. 找到这个地址所处的 block
> 2. 所有这个 blcok 所映射的主存中的 block 皆共享这个 block.

0x75会被映射到第几块：(地址/CacheWidth)mod(Cache块数)
0X75/4%(32/4) == 117/4%8 == 29.5%8  == 5 
**地址 0x75 会被映射到第 5 块**


###### c. The block containing the byte at 0x75 is in the cache. What memory accesses are guaranteed to get a cache miss? You may describe what addresses, but be specific.

###### d. The hit time is a clock cycle, and the miss penalty is 100. If the miss rate is 50%, what is the AMAT?

# Problem 4: Cache Memory Accesses (from P&H Computer Org. & Design) - 5pts
## 前言
Cache大小为: 256 WORD --> 1024 Byte
Block Size: 8 WORD --> 32 Byte 
Block 数目: 32 个

## Question
```c
int i,j,c,stride,array[512];
...
for(i=0; i<10000; i++)
    for (j=0; j<512; j+=stride)
        c += i%(array[j]);
```
if stride = 256?
if stride = 255?

## 解答
本题侧重于考察 Cache 未命中 所带来的效率损耗.
命中: 需要的数据在 Cache 中找到
缺失: 需要的数据不在 Cache 中, 需要从 MM 中读取
空间局部性: Cache 替换规则为每次替换一个 block. 在本题中，每次可以取 8 个 int.
缺失率: 缺失次数/总次数 x100% 
命中率: 不说了

Cache 大小为: 1024 Byte
要访问的数组总大小为: 512个 --> 2048 Byte
我们可以看出，要想遍历整个数组，必须发生替换.

if stride = 256?
    会执行以下两句:
    c += array[0]   //访问 array[0]的时候会将 [array[0],array[8]) 加载进 Cache 中的一个 block.
    c += array[256] //访问 array[256]的时候会将 [array[256],array[264]) 加载进 Cache 中的一个 block.
总读写次数为2，缺失次数为 2, 缺失率为 2/2*100% == 100%

if stride = 255?
    会执行以下三句:
    c += array[0]   //访问 array[0]的时候会将 [array[0],array[8]) 加载进 Cache 中的一个 block.
    c += array[255] //访问 array[255]的时候会将 [array[255],array[263]) 加载进 Cache 中的一个 block.
    c += array[500] //访问 array[500]的时候会将 [array[500],array[508]) 加载进 Cache 中的一个 block.
总读写次数为3，缺失次数为 3, 缺失率为 3/3*100% == 100%




