#include <iostream>
#include <cstring>
using namespace std;
//对方已经摆好了棋盘，且为非平衡态，请把棋盘局面变为平衡态.

//0011
//1000
//0001
//^
//1010  atmp
//--------------------------------
//0000

//1010
//1111 ||
//----
//1111

//   2. 对方一定会尽量的阻止平衡状态的出现,

int aI[1000];
int MaxBitsLength;
int Max_ax_Index;
int n;

int SizeOfBitLength(int bits)
{
    int bits_length = 0;
    while(bits)
    {
        bits >>= 1;
        ++bits_length;
    }
    return bits_length;
}

int input( )
{
    int result_of_all_row_xor = 0;
    aI[0] = 0;
    for( int  i = 1; i <= n; ++i)
    {
        cin >> aI[i];
        result_of_all_row_xor ^= aI[i];

        if(aI[i] > aI[i - 1] )
        {
            MaxBitsLength = SizeOfBitLength( aI[i] );
            Max_ax_Index = i;
        }
    }
    return result_of_all_row_xor;
}


int main()
{

    //输入地图
    while( cin >> n )
    {
        int result_of_all_row_xor  = input();

        //cout << "result_of_all_row_xor: " << result_of_all_row_xor << endl;

        int atmp;
        //cout << MaxBitsLength << endl;

        int all_bit_is_1 = ~(1 << ( MaxBitsLength - 1 )) ^ (-1 << ( MaxBitsLength - 1 )); //希望是 15

        //cout << "all_bit_is_1: " << all_bit_is_1 << endl;
        if(  result_of_all_row_xor == 0)
        {
            cout << " 你已经输了，蠢货!!, 有我知道还能错" << endl;
            continue;
        }

        for(atmp = 1; atmp <= all_bit_is_1; ++atmp)
        {
            if( (result_of_all_row_xor ^ atmp) == 0 ) //即状态平衡了
            {
                break;
            }
        }

        int shoud_do;
        int i;
        for(i = 1; i <= n; ++i)
        {
            shoud_do = aI[i] ^ atmp;
            if(shoud_do <= aI[i] )
            {
                break;
            }
        }

        //cout << aI[Max_ax_Index] << ' ' <<  atmp << endl;

        cout << "将第" << i << "行" << "减少到" << shoud_do << "位" << endl;
        cout << " -------------------------- " << endl;
    }


}


