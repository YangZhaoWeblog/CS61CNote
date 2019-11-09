#include <stdio.h>
//0 1 2 3 4 5 6
//1 1 2 3 5 8 13

int Fabonacii(int n)
{
    if(n == 0)
        return 1;
    if(n == 1)
        return 1;
    return Fabo(n - 1) + Fabo(n - 2);
    //3 4
    //2 4
    //1 4
    //-----
    //1 2
    //1 0
}

int main(  )
{
    printf("%d\n", Fabonacii(4));
    return 0;
}




