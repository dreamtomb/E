#include <iostream>
#include <string.h>
using namespace std;
int main (){
    int n;
    char c;
    scanf("%d %c",&n,&c);
    char sc[65535];
	getchar();
    gets(sc);
    int len=strlen(sc);
    if(len>=n){
        for (int i=len-n;i<len;i++){
            printf("%c",sc[i]);
        }
        printf("\n");
    }
    else{
        for(int i=0;i<n-len;i++){
            printf("%c",c);
        }
        for(int i=0;i<len;i++){
            printf("%c",sc[i]);
        }
        printf("\n");
    }
    system("pause");
    return 0;
}