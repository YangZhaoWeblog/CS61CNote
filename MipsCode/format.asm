MIPS Control Flow
一. What are the instructions to branch on each of the following conditions?
1. $s0 < $s1

```asm
slt $t0 $s0 $s1
bne $t0 $zero samll
```

2. $s0 <= $s1
```asm
slt $t0 $s1 $s0
beq $t0 $zero samll_or_equall
```

3. $s0 > 1
```asm 
addi $t1 $s0 1
slti $t0 $t1 $s1 
bne  $t0 $zero xxx
```

4. $s0 >= 1
```asm 
addi $t1 $s0 1
slti $t0 $s0 $t1
beq  $t0 $zero xxx
```

二. complete the MIPS so that it flows like the c
1. bne $t1 $zero Loop 
   add $t4 $zero $zero

2. 

