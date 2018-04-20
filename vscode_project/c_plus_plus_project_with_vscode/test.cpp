#include <iostream>
#include <vector>
using namespace std;
int big_month[7] = {1, 3, 5, 7, 8, 10, 12};
int small_month[4] = {4, 6, 9, 11};
int main()
{
    int times = 0;
    scanf("%d", &times);
    while (times--)
    {
        int year, month, day, include_days = 0;
        scanf("%d %d %d", &year, &month, &day);
        if (year <= 2050 && year >= 1900)
        {
        }
        else
        {
            printf("年份有问题\n");
        }
        if (month <= 12 && month >= 1)
        {
            if (!include_days)
            {
                for (int i = 0; i < 7; i++)
                {
                    if (month == big_month[i])
                    {
                        include_days = 31;
                    }
                }
            }
            if (!include_days)
            {
                for (int i = 0; i < 4; i++)
                {
                    if (month == small_month[i])
                    {
                        include_days = 30;
                    }
                }
            }
            if (!include_days)
            {
                if (year % 4 == 0 && year % 100 != 0)
                {
                    include_days = 29;
                }
                else
                {
                    include_days = 28;
                }
            }
        }
        else
        {
            printf("月份有问题\n");
        }
        if (day >= 1 && day <= include_days)
        {
            if (day + 2 <= include_days)
            {
                day = day + 2;
                printf("%dy%dm%dd\n", year, month, day);
            }
            else
            {
                int temp_month = month + 1;
                if (temp_month <= 12)
                {
                    month = temp_month;
                    day = day + 2 - include_days;
                    printf("%dy%dm%dd\n", year, month, day);
                }
                else
                {
                    year = year + 1;
                    month = 1;
                    day = day + 2 - include_days;
                    printf("%dy%dm%dd\n", year, month, day);
                }
            }
        }
        else
        {
            printf("日子有问题\n");
        }
    }
    system("pause");
    return 0;
}