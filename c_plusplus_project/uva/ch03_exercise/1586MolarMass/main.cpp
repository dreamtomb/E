#include <iostream>
#include <string.h>
using namespace std;
char s[200];
int main()
{
    int t;
    memset(s,0,sizeof(s));
    scanf("%d", &t);
    for (int i = 0; i < t; i++)
    {
        double wei = 0;
        double temp;
        scanf("%s", s);
        int len = strlen(s);
        for (int j = 0; j < len; j++)
        {
            int num = 0;
            if (s[j] == 'C')
            {
                temp = 12.01;
            }
            else if (s[j] == 'H')
            {
                temp = 1.008;
            }
            else if (s[j] == 'O')
            {
                temp = 16.00;
            }
            else if (s[j] == 'N')
            {
                temp = 14.01;
            }
            if (s[j] >= '1' && s[j] <= '9')
            {
                if (s[j + 1] >= '0' && s[j + 1] <= '9')
                {
                    num = 10 * (s[j]-48) + (s[j + 1]-48);
                    j++;
                }
                else
                {
                    num = (s[j]-48);
                }
                wei += temp * num;
            }
            else if (s[j + 1] == 'C' || s[j + 1] == 'O' || s[j + 1] == 'H' || s[j + 1] == 'N' || s[j + 1] == 0)
            {
                wei += temp * 1;
            }
        }
        printf("%.3f\n", wei);
    }
    return 0;
}