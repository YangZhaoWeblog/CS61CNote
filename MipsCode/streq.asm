#int streq(char *s1, char *s2) 
#{
#    do 
#    {
#        if(*s1 != *s2) 
#        {
#        return 0;
#        }
#    }while(*s1++ && *s2++);
#    return 1;
#}

.data 
tip: .asciiz "please input String:\n"

.text
main:
li $v0 4
la $a0 tip #la 的原版指令是什么????
syscall

li $v0 8
li $a1 10 #$a0 = address of input buffer $a1 = maximum number of characters to read
syscall 
la $s0 0($a0) #将　a0 所保存字符串的地址复制给s0寄存器
#la $a0 0($a3) #将 a0 保存的字符串的地址更换 

li $v0 8
li $a1 10 #$a0 = address of input buffer $a1 = maximum number of characters to read
syscall 
la $s1 0($a0)


#li $v0 4 #测试我输入的字符串
#syscall

addu $a0 $zero $s0
addu $a1 $zero $s1
jal streq

add $a0 $zero $v0
li $v0 1
syscall #输出返回值

li  $v0 10 
syscall #exit main 函数


streq:
lb $t0 0($a0)
lb $t1 0($a1)

bne $t0 $t1 NOT_EQUALL

beq $t1 $zero EQUALL #if char1 == char2 == 0

addi $a0 $a0 1
addi $a1 $a1 1
j streq

NOT_EQUALL:
addi $v0 $zero 0
jr $ra

EQUALL:
addi $v0 $zero 1
jr $ra

