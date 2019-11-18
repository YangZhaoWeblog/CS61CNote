## 费曼技巧

1. How should $sp be used? When do we add or subtract from $sp?
答: 常被用来存储　过程调用中的寄存器.

2. Which registers need to be saved or restored before using jr to return from a function?
答: 所有非叶过程中使用过的　$s、$t 、$a、$ra 都应该被保存

3. Which registers need to be saved before using jal?
答: 在所有非叶过程中用到的　$s、$t 、$a、$ra 等等都应该被保存.

4. How do we pass arguments into functions?
答: 通过寄存器 $a0、$a1、$a2、$a3

5. What do we do if there are more than four arguments to a function?
答: 这个我是真的不会.

6. How are values returned by functions?
答: 通过 $v0 寄存器保存返回值即可, 然后使用 $jr 返回


