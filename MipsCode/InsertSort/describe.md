# 关于 c 数组表示与 Mips 实际做法的一种解释
> 在将 c 数组转换为 Mips 代码的过程中，产生了非常多的疑问. 

eg:
```c
int Print(int* left, int*right)
{
  for(int i* = left; i != right; ++i)
  {
        printf("%d ", *i);
  }
  putchar('\n');
}
```

转换:
```asm
Print:
move $t0 $a1
move $t1 $a2

move $t3 $t0
InLoop:
beq  $t3 $t1 OutLoop

  lw $a0 0($t3)
  li $v0 1 #printf %d
  syscall

  li $a0 ' '
  li $v0 11 #printf ' '
  syscall

addiu $t3 $t3 4
j InLoop

OutLoop:
li $a0 '\n'
li $v0 11 #printf '\n'
syscall
jr $ra
```

