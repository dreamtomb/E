#include <iostream>
using namespace std;
int main()
{
    int maxa, maxb, num, a = 0, b = 0;
    scanf("%d %d", &maxa, &maxb);
    scanf("%d", &num);
    for (int i = 0; i < num; i++)
    {
        int ahan, ahua, bhan, bhua;
        scanf("%d %d %d %d", &ahan, &ahua, &bhan, &bhua);
        if (!(ahua == ahan + bhan && bhua == ahan + bhan))
        {
            if (bhua == ahan + bhan)
            {
                b++;
            }
            else if (ahua == ahan + bhan)
            {
                a++;
            }
        }
        if (a > maxa)
        {
            printf("A\n");
            printf("%d\n", b);
            break;
        }
        else if (b > maxb)
        {
            printf("B\n");
            printf("%d\n", a);
            break;
        }
    }
    system("pause");
    return 0;
}