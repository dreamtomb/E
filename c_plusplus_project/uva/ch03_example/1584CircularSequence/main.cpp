#include <iostream>
#include <string.h>
using namespace std;
#define maxnum 101
char s[101];
void deal(char *s)
{
    int len = strlen(s);
    int minindex = 0;
    for (int i = 1; i < len; i++)
    {
        for (int j = 0; j < len; j++)
        {
            if (s[(minindex + j) % len] != s[(i + j) % len])
            {
                if (s[(minindex + j) % len] < s[(i + j) % len])
                {
					break;
                }
                else
                {
                    minindex = i;
                    break;
                }
            }
        }
    }
    for (int i = 0; i < len; i++)
    {
        printf("%c", s[(minindex + i) % len]);
    }
}
int main()
{
    int num, min = 0;
    scanf("%d", &num);
    while (num--)
    {
        scanf("%s", s);
        deal(s);
        printf("\n");
    }
    system("pause");
    // return 0;
}