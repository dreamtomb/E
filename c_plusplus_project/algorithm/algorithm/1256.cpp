#include "stdafx.h"
#include <iostream>
#include <algorithm>
#include <string.h>
using namespace std;
char s[14], ss[14];//输入输出数组，限制是13，因此设置为14，存放'\0'
bool used[14];//标志数组中的字符是否使用过，用于避免重复情况的输出
int len;//输入数组的长度
/*cmp函数是使用STL中sort函数时，重写的判断函数，用于将输入数组排序*/
int cmp(char a, char b)
{
	if (tolower(a) != tolower(b))
	{
		return tolower(a) < tolower(b);
	}
	else
		return a < b;
}
/*回溯法，用于将输入数组的全部非重复排列放置到输出数组中，不必每次对输出数组清空，因为排列的长度均相同*/
void backtrace(int n)
{
	if (n == len)
	{
		cout << ss << endl;//最后一层，输出字符串
	}
	for (int i = 0; i < len; ++i)
	{
		if (used[i] == false)//没有用过这个字符
		{
			ss[n] = s[i];
			used[i] = true;
			backtrace(n + 1);
			used[i] = false;
			int temp = i + 1;
			while (temp < len && s[temp] == s[i])//长度限制内找到第一个不相同的字符，再开始排列，此处wa了
			{
				temp++;
			}
			temp--; //i会自增，故而先减1，此处也wa了
			i = temp;
		}
	}
}
int main()
{
	int n;
	scanf("%d", &n);
	while (n--)
	{
		scanf("%s", &s);
		len = strlen(s);
		memset(used, 0, sizeof(used));
		ss[len] = '\0';//不加此行即为wa,但是vs中会自动补'\0'，坑了
		sort(s, s + len, cmp);
		backtrace(0);//从第一位开始
	}
	system("pause");
	return 0;
}