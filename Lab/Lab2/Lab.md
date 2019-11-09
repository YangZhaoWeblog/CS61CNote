# 无意义-学过的


## 一. GDB 的使用

### 费曼技巧
Q:1. 在 GDB 中, 断点分为几种?? 
A: 三种:　Hard breakpoint, condition breakpoint, common breakpoint

Q:How do you pass command line arguments to a program when using gdb?
A: set args <vlaue>

Q:How do you set a breakpoint which only occurs /when a set of conditions is true (e.g. when certain variables are a certain value)?
A: break <position> <condition>
eg: break 8 if i==666

Q:How do you execute the next line of C code in the program after a break?
A: n

Q:If the next line is a function call, you'll execute the call in one step. How do you execute the C code, line by line, inside the function call?
A: s

Q:How do you continue running the program after breaking?
A: c

Q:How can you see the value of a variable (or even an expression) in gdb?
A:　ｐ <variable name>

Q:How do you configure gdb so it prints the value of a variable after every step?
A: display <variable name>

Q:How do you print a list of all variables and their values in the current function?
A: info local

Q:有一个变量其值被意外地改掉了，通过单步调试或者挨个检查使用该变量的代码工作量会非常大，如何快速地定位到该变量在哪里被修改了？
A: 硬件断点(具体命令这里不写出来，recall is more effective.)

Q: How do you exit out of gdb?
A: quit

Q: whatch 监视的 breakpoint 属于哪种 breakpoint???
A: 一部分属于 hardware point, 另一部分是通过软中断(监视数组)来实现的.
watch 可以用来监视它可以用来监视一个变量或者一段内存(eg:数组), ，当这个变量或者该内存处的值发生变化时，GDB 就会中断下来。被监视的某个变量或者某个内存地址会产生一个 watch point（观察点）。

二. GDB 调试一个c程序 

三. c结构体与指针

四. 数组操作


