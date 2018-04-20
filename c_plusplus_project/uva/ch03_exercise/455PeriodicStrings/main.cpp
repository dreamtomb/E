#include <iostream>  
#include <cstdlib>  
#include <cstring>  
#include <cstdio>  
using namespace std;  
char str[104];  
int main()  
{
	int n;
	scanf("%d", &n);
	while (n--)
	{
		scanf("%s", str);
		int len = strlen(str);
		for (int k, i = 1; i <= len; ++i)
		{
			if (len % i == 0)
			{
				for (k = i; k < len; ++k)
				{
					if (str[k] != str[k % i])
						break;
				}
				if (k == len)
				{
					printf("%d\n", i);
					break;
				}
			}
		}
		if (n)
		{
			printf("\n");
		}
	}
	return 0;
}  