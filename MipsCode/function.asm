# int leaf_example(int g, int h, int i, int j)
# {
#   int f;
#   f = (g+h) - (i + j);
#   return f;
# }
# 参数变量 
# g: $a0
# h: $a1
# i: $a2
# j: $a3
# f: $s0
# 大致逻辑: 保存变量，算出结果，还原变量，跳回

#addi $sp $sp -4  #创建四个寄存器的空间, 因为 mips 大端序, 所以Ｊ看；ｗ　；
#sw $s0 0($sp)
#add $t0 $a0 $a1
#add $t1 $a2 $a3
#sub $s0  $t0 $t1 
#add $v0 $s0 $zero
#lw $s0 0($sp)
#addi $sp $sp 4
#jr $ra

#--------------------------------
#int fact(int n)
#{
#    if(n < 1)
#       return (1);
#    else 
#       return (n*fact(n-1));
#}
#n $a0

# Comment giving name of program and description of function
# 说明下程序的目的和作用（其实和高级语言都差不多了）
# Template.s
#Bare-bones outline of MIPS assembly language program


           .data     

           .text                                                          
main:
addi $a0 $zero 4
jal FACT
addi $a0 $v0 0
addi $v0 $zero 1
syscall

addi $v0 $zero 10 #设置syscall 的 flag 为 exit
syscall #return 0

FACT:
addi $sp, $sp, -8
sw   $ra, 4($sp)
sw   $a0, 0($sp)
slti $t0, $a0, 1  #t0 == (n < 1)?1:0;
beq  $t0, $zero, RECURSIVE#if(n >= 1)


#else(n < 1)
addi $v0, $zero, 1
addi $sp $sp 8
jr  $ra

RECURSIVE:addi $a0, $a0, -1
jal FACT #把当前位置的地址存入 $ra, 再跳转到制定的地址, 可以用 jr $ra 再跳转回当前位置. #开始递归跳转

lw   $a0, 0($sp)
lw   $ra, 4($sp)
addi $sp, $sp, 8
mul $v0, $a0, $v0 
jr $ra

# jr 与 jal 为两个跳转指令，为精髓.
# what is real comparetion between 'jal' and 'jar'???

# End of program, leave a blank line afterwards to make SPIM happy
