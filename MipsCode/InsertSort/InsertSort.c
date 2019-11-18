#include <stdio.h>

void insert_sort(int *left, int *right)
{
    if(left < right)//对这种情况而言, 所有在此作用域外的，都是这个情况的反面
    {
        for(int *i = left + 1; i != right; ++i)//从无序数开始
        {
            //3 0 2 7 4 -99 2 6 9 32
            int tmp = *i;
            int *j = i - 1;

            while(tmp < *j && j >= left)//在每个有序数中倒叙对比寻找
            {
                *(j + 1) = *j;
                --j;
            }
            *(j + 1) = tmp;
        }
    }

}

void print_result(int *left, int *right)
{
    for(int *i = left; i != right; ++i)
    {
        printf("%d ", *i);
    }
    putchar('\n');
}


int main()
{
    int num[10] = {3, 0, 2, 7, 4, -99, 2, 6, 9, 32 };
    print_result(num, num + 10);//寄存器相对寻址
    insert_sort(num, num + 10);
    print_result(num, num + 10);
    return 0;
}

