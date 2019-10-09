# 历史
>An IDE for MIPS Assembly Language Programming.
> MARS是一个轻量级的交互式开发环境（IDE），用于使用MIPS汇编语言进行编程，旨在与Patterson和Hennessy的计算机组织和设计一起用于教育级别。）

# 我为什么要自己写这篇教程???
> 之前通过学习cs61c 也已经掌握了不少的 mips 汇编指令, 但都只是在纸上写，没有真正的验证. 于是乎下载了 Mars, 却无法做到完整的汇编出 mips 代码，所以想要知根知底的搞清楚，要怎样用怎样的格式写才能被 Mars　所接受.  在网上看过不少的基础教程，但都没有讲到Mars的编写格式与特斯特性。所以就有了这篇文章。

# 基础知识
> 在了解基本使用之前，需要了解一些基础知识


宏汇编语言有3类基本指令：符号指令、伪指令和宏指令。
1. 伪指令
  伪指令只为汇编程序将符号指令翻译成机器指令提供信息，没有 与它们对应的机器指令

    .set push/.set pop等等。
2. 宏指令
  把一个指令序列定义为一条宏指令, 便于书写
3. 符号指令 
```
指令
li $t1,40
是一条伪指令，在汇编器中会转换成
addi $t1,$zero,40
但是
li $t1,-4000000
因为数字太大，需要拆开，则会被转换成
lui $at,0xffc2
ori $t1,$at,0xf700
这之中，$at就作为一个中间变量来用的
```
>  必须这样写 Mars 成功汇编

## 一.  MIPS程序结构

1.Data Declarations

在.data指令之后：将程序将使用的数据存储在RAM中。

2.Code

在.text指令后：包括程序代码，其中程序代码的起点是main:指令，并用syscall结束程序。

3.Comments
注释不用说了 ~注释符号是#

## 二. 如何输入输出??? 
> Use syscall to call operating system routine call, 把对应的系统服务编码放进$v0中，再syscall就可以调用相应的系统服务。
> 系统调用是操作系统提供的一组服务。要使用系统调用，需要将调用代码放入$ v0寄存器以进行所需操作。如果系统调用有参数，则将它们放在$ a0- $ a2寄存器中。

    Syscall 是Mars 中输出的方式. 通过将 $v0 设置成不同的值来在控制台输出 不同register中的值(会以不同的输出方式), 详情见下表:
    http://courses.missouristate.edu/KenVollmar/mars/Help/SyscallHelp.html
这里提供给一个程序范例:

#### 输出
```asm
.data
.text
main:
    addi $a0 $zero 666
    addi $v0 $zero 1 #v0设置为1,  代表 syscall 将输出 $a0 register 的值在控制台上.
    syscall
```
结果输出: 666

#### 输入
```asm
data
.text
main:
    li $v0 5 #v0设置为5,  代表 syscall 将从键盘缓冲区读入一个数进v0
    syscall

    add $a0 $v0 $zero
    li $v0 1
    syscall
```

#### 输出

## 二. Mars 的新手"陷阱"

### 1. main 函数的返回值
实际上为
```c
int main()
{
   func();
   return 0;
}
```
在 MIPS 中要写成如下形式:
```asm
main:
jal func
addi $v0 $v0 10 #v0设置为10,  代表 syscall 将执行 exit
syscall
```
这是因为　main 没有其调用者, 所以 $ra 为 0, 关于 $ra,  The correct way to end a program on MARS is using the "exit" syscall.
即:
```asm
addi $v0 $v0 10
syscall
```
并且将　main 过程放在所有函数之前.

### 2. mips 调用子程序
- 主程序与子程序之间的转返
    调用:jal func 
    返回:jr $ra   

- 主程序与子程序间的信息传递
- 主程序和子程序公用寄存器的问题


