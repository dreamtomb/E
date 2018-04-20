#include "iostream"  
#include "vector"  
#include "cmath"  
using namespace std;  
  
vector<long long> temp, result;  
  
int main(void)  
{  
    long long n;  
    bool flag = true;  
  
    cin >> n;  
  
    long long sqrtN;  
    unsigned int count = 0;  
  
    sqrtN = static_cast<long long>(sqrt(n));  
  
    for (long long i = sqrtN + 1; flag && i > 1; i--)  
    {  
        if (n % i == 0)  
        {  
            temp.push_back(i);  
            long long inN = n / i;  
  
            for (long long k = i - 1; k > 1; k--)  
            {  
                if (inN % k == 0)  
                {  
                    temp.push_back(k);  
                    inN /= k;  
                    if (k == 2)  
                    {  
                        flag = false;  
                    }  
                }  
                else  
                {  
                    break;  
                }  
            }  
  
            if (temp.size() >= count)  
            {  
                count = temp.size();  
                result = temp;  
  
            }  
  
            temp.clear();  
  
  
        }  
    }  
  
    cout << count << endl;  
  
    for (auto it = result.end() - 1; it >= result.begin(); it--)  
    {  
        if (it != result.begin())  
        {  
            cout << *it << "*";  
        }  
        else  
        {  
            cout << *it;  
            break;  
        }  
    }  
  
    system("pause");  
    return 0;  
}  