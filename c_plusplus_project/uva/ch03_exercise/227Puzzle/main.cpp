#include <iostream>
#include <stdio.h>
#include <string.h>
using namespace std;
char map[5][6];
char ins[1000];
int main()
{
    int num=0;
    while (gets(map[0]))
    {
        num++;
        int flag=0;
        if (map[0][0] == 'Z')
        {
            break;
        }
        for (int i = 1; i <= 4; i++)
        {
            gets(map[i]);
        }
        int bx = 0, by = 0;
        for (int i = 0; i < 5; i++)
        {
            for (int j = 0; j < 6; j++)
            {
                if (map[i][j] == ' ')
                {
                    bx = i;
                    by = j;
                    break;
                }
            }
        }
        int index = 0;
        int len;
        int x = 0, y = 0;
        while (scanf("%c", &ins[index]) && ins[index] != '0')
        {
            index++;
		}
		len = strlen(ins) - 1;
        for (int i = 0; i < len; i++)
        {
            switch (ins[i])
            {
            case 'A':
                x = bx - 1;
                y = by;
                break;
            case 'B':
                x = bx + 1;
                y = by;
                break;
            case 'L':
                x = bx;
                y = by - 1;
                break;
            case 'R':
                x = bx;
                y = by + 1;
                break;
            }
            if(x<0||x>4||y<0||y>4){
                flag=1;
                break;
            }
            char temp;
            temp = map[bx][by];
            map[bx][by] = map[x][y];
            map[x][y] = temp;
            bx=x;
            by=y;
        }
        printf("Puzzle #%d:\n", num);
        if (flag == 1)
        {
            printf("This puzzle has no final configuration.\n");
        }
        else
        {
            for (int i = 0; i < 5; i++)
            {
				printf("%c",map[i][0]);
                for (int j = 1; j < 5; j++)
                {
                    printf(" %c", map[i][j]);
                }
                printf("\n");
            }
        }
		getchar();
    }
    system("pause");
    return 0;
}
