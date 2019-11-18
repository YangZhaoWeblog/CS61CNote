#addi sp -16
#sw $ra 12($sp)#保留可能用到的变量
#sw $s0 8($sp)
#sw $a1 4($sp)
#sw $a2 0($sp)

.data
Num:.word 3,0,2,7,4,-99,2,6,9,32

.text
main:
la $s0 Num #加载数组
move $a1 $s0 #传参数
addiu $a2 $s0 40 #硬~!!??  编码 如何更好的解决

jal PrintFunc #调用函数打印数组初始结果

move $a1 $s0 #传参数
addiu $a2 $s0 40 #硬~!!??  编码 如何更好的解决
jal InsertionSort

move $a1 $s0 #传参数
addiu $a2 $s0 40 #硬~!!??  编码 如何更好的解决
jal PrintFunc#调用函数打印数组末结果

li $v0 10 #return 0
syscall

PrintFunc:
move $t1 $a1#int* left = &Arrayaddr
move $t2 $a2#int* right= &Arrayaddr+40

move $t3 $t1#int* i = left
InLoop:
beq  $t3 $t2 PrintReturn #循环的判断

  lw $a0 0($t3)
  li $v0 1 #printf %d
  syscall

  li $a0 ' '
  li $v0 11 #printf ' '
  syscall

addiu $t3 $t3 4
j InLoop

PrintReturn:
li $a0 '\n'
li $v0 11 #printf '\n'
syscall
jr $ra


InsertionSort:
move $t1 $a1 #int* left = &Arrayaddr
move $t2 $a2 #int* right= &Arrayaddr+40
slt $t3 $a1 $a2  #t3 = left < right ?1:0;
beq $t3 $zero InsertionSortReturn #return;

addiu $t3 $t1 4 #int* i = left + 1
InLoop1:
beq $t3 $t2 InsertionSortReturn #循环判断 i == right 则跳出

lw $t4 0($t3) #int tmp = *i;
addiu $t5 $t3 -4 #int j = i-1;

InLoop2:
lw $t6 0($t5) #$t6 = *j
slt $t0 $t4 $t6 #$t0=tmp<*j?1:0;
slt $t7 $t5 $t1 #$t7=j<left?1:0;
not $t7 $t7    #让 j >= left 为1
and $t7 $t7 $t0

beq $t7 $zero OutLoop2#在这里我们期待 $t0为1且$t7为0, 满足这个条件即就循环,不满足即跳出次循环
sw $t6 4($t5)    #*(j+1) = *j  --> sw *j *(j+1)
addiu $t5 $t5 -4 #--j
j InLoop2
OutLoop2:

sw $t4 4($t5) #*(j+1) = tmp
addiu $t3 $t3 4 #++i
j InLoop1


InsertionSortReturn:
jr $ra


