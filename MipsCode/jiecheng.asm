#--------------------------------
#int fact(int n)
#{
#    if(n < 1)
#       return (1);
#    else 
#       return (n*fact(n-1));
#}
#n $a0

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
addi $sp, $sp, 8
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


