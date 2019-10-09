.data
.text
main:
    li $v0 5 #v0设置为5,  代表 syscall 将从键盘缓冲区读入一个数进v0
    syscall
    
    add $a0 $v0 $zero
    li $v0 1
    syscall
