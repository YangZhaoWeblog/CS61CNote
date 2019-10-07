# C 与 MIPS 代码转换练习

## 1.
```c
// $s0 -> a,
//$s1 -> b
//$s2 -> c
//$s3 -> z
int a=4, b=5, c=6, z;
z = a+b+c+10;
```
```
add $s0  $zero 4
add $s1  $zero 5
add $s2  $zero 6

addi $s2 $zero 10  //c += 10
add $t0 $s1 $s2 //t0 = b+c
add $s3 $s0 $t0 //z = a+t0
```
错误: addi 参数也必须有三个 , $0 常被用来做参数. 已修改

## 2.
```c
// $s0 -> int *p = intArr;
// $s1 -> a
p[0] = 0;
int a = 2;
p[1] = a;
p[a] = a;
```
```
sw $zero 0($s0)
addi $s1 $s0 2
sw $s1 4($s0)

sll $t0 $s1 2 //*4 == adress
add $t0 $t0 $s0
sw $s1 0($t0)
```
错误: 忘记ｓｗ指令的offtest 只能是常数.已修改


## 3.
```c
// $s0 -> a, 
//$s1 -> b
int a = 5, b = 10;
if (a + a == b) 
{
 a = 0;
}
else
{
 b = a - 1;
}
```
```
addiu $s0 $zero 5
addiu $s1 $zero 10

sll $t0 $s0 1
beq $t0 $s1 LOOP
addiu $s1 $s0 -1
j END:

LOOP:
sw $zero $s0
END: #done!
```

错误: 
将 addiu 写成 add, 实在该打
将 sll 只写了两个操作数
疑惑:
为什么更多的使用 bne 而不是 beq
为什么更多的使用 addiu 而不是 addi

## 4. 
```
 addi $s0, $0, 0
 addi $s1, $0, 1
 addi $t0, $0, 30
loop: beq $s0, $t0, done
 add $s1, $s1, $s1
 addi $s0, $s0, 1
 j loop
done: # done!
```
```c
//a ->$s0
//b ->$s1
int a = 0;
int b = a+1;

while(a == b)
{
    b <<= 1;
    a += 1;
}

```
# 5. 
```c
int sum(int n)
{
  return n ? n + sum(n - 1) : 0;
}
// use recursion in your MIPS!
```
```
int 
```
