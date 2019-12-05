#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <time.h>

void transpose( int n, int blocksize, int *dst, int *src )
{
    //int i, j;
    //优化前的代码
    //for(i = 0; i < n; i++)
    //    for(j = 0; j < n; j++)
    //        dst[j + i*n] = src[i + j*n];
    /* TO DO: implement blocking (two more loops) */
    //int min_optertion_num = blocksize / sizeof(int);//block大小为61B == 16个int
    //printf("%d\n", min_optertion_num);
    //int min_optertion_size = min_optertion_num/4; //block大小为4*4,也就是说一次可以操纵 4*4 int的小矩阵

    //我们要兼容的处理奇数块
    //确保分的每一个小步骤里操作的数不超过 16个int, 2000*2000 ==> 4*4 == 我们将小步骤执行 500 次即可
    for (int j = 0; j < n; j += blocksize)
    {
        for (int i = 0; i < n; i += blocksize)
        {
            // transpose the block beginning at [i,j]
            for (int k = i; k < i + blocksize; ++k)
            {
                for (int l = j; l < j + blocksize; ++l)
                {
                    dst[k + l * n] = src[l + k * n];
                }
            }
        }
    }

}

int main( int argc, char **argv )
{
    int n = 2000, i, j;
    //int blocksize = 64; /* to do: find a better block size 我的 Cache line 大小为 64B, 可以容纳　64/4 == 16个int 型的变量*/
    int blocksize = 4; /* to do: find a better block size 我的 Cache line 大小为 64B, 可以容纳　64/4 == 16个int 型的变量*/

    /* allocate an n*n block of integers for the matrices */
    int *A = (int*)malloc( n * n * sizeof(int) );
    int *B = (int*)malloc( n * n * sizeof(int) );

    /* initialize A,B to random integers */
    srand48( time( NULL ) );
    for( i = 0; i < n * n; i++ ) A[i] = lrand48( );
    for( i = 0; i < n * n; i++ ) B[i] = lrand48( );

    /* measure performance */
    struct timeval start, end;

    gettimeofday( &start, NULL );
    transpose( n, blocksize, B, A );
    gettimeofday( &end, NULL );

    double seconds = (end.tv_sec - start.tv_sec) +
                     1.0e-6 * (end.tv_usec - start.tv_usec);
    printf( "%g milliseconds\n", seconds * 1e3 );

    /* check correctness */
    for( i = 0; i < n; i++ )
        for( j = 0; j < n; j++ )
            if( B[j + i * n] != A[i + j * n] )
            {
                printf("Error!!!! Transpose does not result in correct answer!!\n");
                exit( -1 );
            }

    /* release resources */
    free( A );
    free( B );
    return 0;
}

