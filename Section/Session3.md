/*转换以下mips代码至ｃ代码
 * a -> $s3
 * b -> $s5
 * c -> $s6
 *
 * LOOP:
 * sll $t1 $s3 2 #为什么用 $s3　做offest的时候要左移两位???
 * addu $t1 $t1 $s6 
 * l2 $t0 0($t1)
 * beq $to $s5 EXIT
 * addiu $s3 $s3 1
 * j LOOP
 * EXIT:
 */

int main(){
  int a = 0;
  int b = 0;
  int* c;
  int tmp;

  //初始化...

  while(b != c[a])
  {
    ++a;
  }

  return 0;
}

