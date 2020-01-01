#include <iostream>
using  std::cout;
using  std::cin;
using  std::endl;


double func_unrolling(const size_t size)
{
    size_t sum1 = 0;
    size_t sum2 = 0;
    for(size_t i = 0; i < size; i += 2)
    {
        sum1 += 8;
        sum2 += 8;
    }
    return sum1+sum2;
}

int main()
{
    //int a[1] = { 8 };

    auto start =  clock();
    cout << func_unrolling(10000) << endl;
    auto end = clock();
    cout << static_cast<double>(end - start) / static_cast<double>(CLOCKS_PER_SEC) * 1000  << "ms" << endl;
    return 0;
}

