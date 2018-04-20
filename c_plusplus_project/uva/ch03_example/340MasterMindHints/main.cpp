#include <iostream>
#include <string.h>
using namespace std;
int answer[10000];
int guess[10000][10000];
int main()
{
    int n, Anum = 0, Bnum = 0;
    int index = 0;
    while (scanf("%d", &n) ==1 && n)
    {
        memset(answer, 0, sizeof(answer));
        memset(guess, 0, sizeof(guess));
        printf("%s%d%c\n", "Game ", ++index, ':');
        for (int i = 0; i < n; i++)
        {
            scanf("%d", &answer[i]);
        }
        int row = 0;
        for (int j = 0; j < n; j++)
        {
            scanf("%d", &guess[row][j]);
            if (j == n - 1 && guess[row][n - 1] == 0)
            {
                break;
            }
            if (j == n - 1)
            {
                // 判断有多少A
                for (int i = 0; i < n; i++)
                {
                    if (guess[row][i] == answer[i])
                    {
                        Anum++;
                    }
                }
                // 有多少B
                for (int i = 1; i <= 9; i++)
                {
                    int t1=0,t2=0;
                    for (int j = 0; j < n; j++)
                    {
                        if (answer[j] == i)
                        {
                            t1++;
                        }
                        if (guess[row][j] == i)
                        {
                            t2++;
                        }
                    }
                    if (t1 > t2)
                    {
                        Bnum+=t2;
                    }
                    else{
                        Bnum+=t1;
                    }
                }
                printf("    %s%d%s%d%s\n", "(", Anum, ",", Bnum-Anum, ")");
                j = -1;
                row++;
                Anum = 0;
                Bnum = 0;
            }
        }
    }
    return 0;
}
