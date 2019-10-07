# CS61c  Note

## 第一周
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

### Lab 
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
