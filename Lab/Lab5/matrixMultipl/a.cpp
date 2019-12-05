#include <iostream>
#include <cstring>
using namespace std;

void mul(int n, int *A, int *B, int *C)
{
    for(int k = 0; k < n; ++k)//重新开启一个循环用来计算对应位置
    {
        for(int j = 0; j < n; ++j)
        {
            {
                for(int i = 0; i < n; ++i)
                    //二维数组表示一维数组: a[i][j] = a[i*n+j] i是行下标，n是一列的元素个数，j是列下标
                    //eg: a[2][1] = a[2*3+1]
                    //矩阵乘法运算，对Ｂ来说做列遍历，对Ｃ来说做行遍历
                    C[i * n + j] += A[i * n + k] * B[k * n + j];
                //cout << "C[" << j + i*n << "]" << endl;
            }

        }

    }
    return;
}

int main()
{
    int A[4] = { 2, 1,
                 4, 3
               };
    int B[4] = { 1, 2,
                 1, 0
               };
    int C[4];
    //期待结果
    //3 3
    //5 3
    memset(C, 0, sizeof(C));
    mul(2, A, B, C);

    for(int i = 0; i < 4; ++i)
    {
        cout << C[i] << ' ';
        if(i == 1)
            putchar('\n');
    }
    return 0;
}

