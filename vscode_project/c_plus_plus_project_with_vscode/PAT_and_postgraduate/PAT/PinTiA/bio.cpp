#include <iostream>
using namespace std;
#define Maxnum 100001
int line[Maxnum];
void dp(int line[], int num)
{
    int maxsum = 0, max = 0, maxfir = 0, maxlas = 0, tempfir = 0, flag = 0;
    for (int i = 0; i < num; i++)
    {
        flag = 0;
        max += line[i];
        if (max > maxsum)
        {
            maxsum = max;
            maxlas = i;
            flag = 1;
        }
        if (max < 0)
        {
            max = 0;
            tempfir = i + 1;
        }
        if (flag)
        {
            maxfir = tempfir;
        }
    }
    printf("%d %d %d", maxsum, line[maxfir], line[maxlas]);
}
int main()
{
    int num = 0, index = 0, flag1 = 0, flag2 = 0, fflag2 = 0,index0=0;
    scanf("%d", &num);
    while (num--)
    {
        scanf("%d", &line[index]);
        if (line[index] > 0)
        {
            flag1 = 1;
        }
        if (!flag1 && line[index] == 0 && !fflag2)
        {
            flag2 = 1;
            fflag2 = 1;
            index0=index;
        }
        index++;
    }
    if (flag1)
    {
        dp(line, index);
    }
    else if (!flag2)
    {
        printf("%s %d %d", "0", line[0], line[index - 1]);
    }
    else
    {
        printf("%s %d %d", "0", line[index0], line[index0]);
    }
    system("pause");
    return 0;
}