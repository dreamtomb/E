#include <iostream>
#include <string.h>
using namespace std;
int main(){
    int n;
    char s[2000];
    scanf("%d",&n);
    getchar();
    gets(s);
    int len=strlen(s);
    int row=0,temp=0;
    if(len%n!=0){
        row=len/n+1;
        temp=row*n-1;
    }
    else{
        row=len/n;
        temp=len-1;
    }
    for(int i=len;i<=temp;i++){
        s[i]=' ';
        s[i+1]='\0';
    }
    int index=0;
    for(int i=1;i<=n;i++){
        for(int j=1;j<=row;j++){
            index=(row-j)*n+i-1;
            printf("%c",s[index]);
        }
        printf("\n");
    }
    system("pause");
    return 0;
}