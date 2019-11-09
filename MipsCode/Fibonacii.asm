# int Fibonacii(int n)
# {
#     if(n == 0)return 1;
#     else if(n == 1)return 1;
#     return  Fibonacii(n-1)+Fibonacii(n-2);
# }
#0 1 2 3 4 5 6  7
#1 1 2 3 5 8 13 

.data

.text

main:

li $v0 5
syscall
move $a0 $v0
jal Fabonacii

move $a0 $v0   #输出计算结果
addi $v0 $zero 1
syscall

li $v0 10
syscall 

Fabonacii:
addi $sp $sp -12 #储存此函数的父亲的参数
sw $ra 8($sp)
sw $a0 4($sp)
sw $t1 0($sp)

li $t0 1 #由于这里的 t0 每次都是1,所以我们不用储存
beq $a0 $zero return_special
beq $a0 $t0 return_special

# Fabonacii(n-1)
li $t1 0
addi $a0 $a0 -1
jal Fabonacii                  
add $t1 $t1 $v0 #保存返回值
addi $a0 $a0 1

# Fabonacii(n-2)
addi $a0 $a0 -2
jal Fabonacii
add $v0 $v0 $t1

lw $t1 0($sp)
lw $a0 4($sp)
lw $ra 8($sp)
addi $sp $sp 12 #储存此函数的父亲的参数
jr $ra #mips中 仅仅有返回的作用, 若要有返回值,将其赋值给 $v0 即可

return_special:  #归的起点，即叶过程
li $v0 1
addi $sp $sp 12 #储存此函数的父亲的参数
jr $ra

### 错误总结
#将 sw 与 lw 写成了 lb 与sb
# 忘记返回的时候将栈清空了

## 何时压栈？？何时出栈???

