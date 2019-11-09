# CS61c  回忆笔记
     学习课程为 Cs61c Spring 2014(因为c语言部分相对较少)
     学习此课程后将习得:
     1. c 语言(spring 2014 中对ｃ的教学相对较少)以及 GDB,git,valgringd 等工具
     2. mips32 汇编语言(2019 cs61c 讲的是 RISC-V 汇编)

## 第1周
> 计算机中数值的表示及其转换

### Lecture Topic 
分为两部分:  计算机历史即计算机组成介绍、 数值转换及其表示
### Reading

### Section 
四种表示法:
1. Sign and ..
2. one's complete 
3. basic 
4. two's complete 

### Lab0
五个游戏，举例其中最有意思的两个:
1.  给你1000个1$的纸币，和10个信封, 并把钱放到信封里。要求可以给出1-1000$间任意一个数目的$, 并把装有了相应数目的钱的若干信封，交给取款人.
Solution: 早在初中的答题卡上就有了体现, 用与涂考号的框不会给你 10 个，成本过高，而会给你 0 1 2 4 8 足以表示 0~9.
2. Nim 游戏
链接: https://blog.csdn.net/pursue_my_life/article/details/101211953
## Assignment  Due
自我情况: 学生统计情况的了解
##小结
本周课程为基础，难度相对较小


---

## 第二周
c 语言的学习, 和 MIPS基础(我重点要学的)

### Lecture Topic 
c语言基础、Mips基础及其 Harvey 笔记
#### MIPS 基础
指令集结构、精简复杂指令集，寄存器的介绍

### reading
C编程语言第几章
软硬件接口 2.1~2.3 章

#### Harvey 的笔记
> 着重讲述了历史(BCD以及数值表示的发展历史)，c语言的陷阱

##### 1. 课程概述
  61c 对操作系统、体系结构、编译原理而言及其重要    
  61A SICP 对于      图形学 至关重要   
  61B 数据结构与算法 对于人工智能及其重要    
##### 2. c 语言部分 
  c 语言的数组仅仅是 *指针上特定类型算数运算的名称*   
  extern 表示变量的声明来自于外部   
  static 三个作用:   
    (1) 局部静态变量（C)   
    (2) 外部静态变量/函数（C) -- 不能被其它文件访问的全局变量和函数, 常用来做保护.   
    (3) 静态数据成员/成员函数（C++）   
  void 是c实现泛型的重要手段之一.


### Section

### Lab1
c语言和进制转换，跳过
### Assignment
1. 表示数的几种方式
2. c中的 & | ^ 操作 

---
## 第三周
> lw、sw 指令. MIPS 指令三种格式, <= , switch 等指令

### Lecture Topic 
lw、sw 指令. MIPS 指令三种格式, 比较 , switch 等指令

### reading
COD 第2中的绝大部分都要读完

### Section
体型分为一下几种:
 1. MIPS 与 c 代码中的相互转换(难点在于用 MIPS 表示函数，这里还没有学到)
 2. sign extend 与  unsign extend 的区别, 以及使用场景
    Ans: sign extend 常被用于有符号数操作(不会改变值), unsign extend 常被用于无符号数操作
 3. 用MIPS 表示 < = > <= >= 等等
 4. 在 MIPS 中, unsigned 的三个含义是什么???
     未完成, 由于不会用MIPS 表示函数，所以我决定去先学校下一张的部分内容，并学习 Mars 模拟器的使用，
     Mars 模拟器的使用教程 具体见: 链接待给出
                                     --2019.10.8
### Lab2
> 总共有四个实验, 分别为:

1. GDB 的使用
2. GDB 找出一个c程序 的bug.
3. 判断单链表是否有环(folyd 判圈法-用来检测链表是否有环)
    利用佛洛依德判圈法可以解决很多引申出来的问题
4. 数组操作

### Assignment
  实现　正则表达式匹配器!!!! CS61c Rocks. 

---
## 第四周
> 后面再写  

### Lecture Topic 
1. instruction format 的补充以及，32 位立即数(过大)的操作, 以及分支语句详解、地址、最大可跳转范围、伪指令

###### I format
eg: 分支跳转语句属于 I Format instruction
```asm
loop:
beq $9 $0 END:
addu $8 $8 $10
addui $9 $9 -1
j Loop
END:
```
所以我们得出
opcode == 4
rs == 9
rd == 0
immediate == 3(因为 beq 和 end 之间有 *3* 条指令)

所以引出两个问题:
1. 如果我们删除了一些代码，其 immediate 项的值是否会发生变化？？？
    会
2. mips 立即数最大为 32 bits==16 word, 如果跳转距离大于 2^15 word 怎么办？？？
```asm
beq $s0 $s0 Far　
可以转换为:
bne $s0 $s0 next 
j Far 
```

#### c 语言内存碎片问题
>  这里介绍的过于浅显，下文有更为详细的解释

https://cloud.tencent.com/developer/article/1084794

### READING
 Bonus slide 教学, 包含汇编和反汇编练习
 mips 编程规范:
 + If function R calls function E, then function R must
save any temporary registers that it may be using
onto the stack before making a jal call.


### Section
> 此处要求从　汇编　--> 二进制机器码　--> 十六进制机器码
分两段
一段中特别有意思的使用 Mips 实现斐波那契数列，但我自己写成了递归版本的，挺锻炼人的.
代码链接: 
另一端是 format 转换练习

### Lab
> 让学生学会c动态内存分配
> Mars 模拟器的介绍
> Mips transfor C
这段最有用的是让我学会了使用 Valgrind.



修改，一天学两个部分的话
11.7就能完成所有
计划已经制定，执行!!!
###### Valgrind 教程
> valgrind 是一款重量级软件
> Valgrind是一套Linux下，开放源代码（GPL V2）的仿真调试工具的集合。Valgrind由内核（core）以及基于内核的其他调试工具组成。内核类似于一个框架（framework），它模拟了一个CPU环境，并提供服务给其他工具；而其他工具则类似于插件 (plug-in)，利用内核提供的服务完成各种特定的内存调试任务。Valgrind的体系结构如下图所示：

https://www.ibm.com/developerworks/cn/linux/l-cn-valgrind/index.html


--- 
# 第五周
>  Cache 的详细解释

### Lecture Topic 
1. Cache 介绍、三种映射方式.
2. Cache rate、Miss、replace 等等概念 
3. Cache 相关的计算

### READING

