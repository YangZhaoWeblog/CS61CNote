#include <iostream>
using  std::cout;
using  std::cin;
using  std::endl;


double func_rolling(const size_t size)
{
    size_t sum = 0;;
    for(size_t i = 0; i < size; ++i)
    {
        sum += 8;
    }
    return sum;


}
int main()
{
    auto start =  clock();
    cout << func_rolling(10000) << endl;
    auto end = clock();
    cout << static_cast<double>(end - start) / static_cast<double>(CLOCKS_PER_SEC) * 1000  << "ms" << endl;
    return 0;
}
