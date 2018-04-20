#include <iostream>
#include <string.h>
using namespace std;
char s[81];
int main()
{
    int n;
    scanf("%d", &n);
    for (int i = 0; i < n; i++)
    {
        scanf("%s", s);
        int score = 0,num=0;
        for (int j = 0; j < strlen(s); j++)
        {
            if(s[j]=='X'){
                num=0;
            }
            else{
                num++;
                score+=num;
            }
        }
        printf("%d\n",score);
    }
    return 0;
}