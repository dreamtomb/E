#include <iostream>
#include <string.h>
using namespace std;
int change(char *str,int len){
    int num=0;
    for(int i=0;i<len;i++){
        if(str[i]>=48&&str[i]<=57){
            num=num*10+str[i]-48;
        }
        else {
            return -1;
        }
    }
    if(num>1000||num<1){
        return -1;
    }
    else {
        return num;
    }
}
int main(){
    char a[10000],b[10000];
    scanf("%s ",a);
    gets(b);
    int c,d,alen,blen;
	alen=strlen(a);
	blen=strlen(b);
    c=change(a,alen);
    d=change(b,blen);
    if(c==-1){
        printf("? +");
    }
    else{
        printf("%d +",c);
    }
    if(d==-1){
        printf(" ? = ");
    }
    else{
        printf(" %d = ",d);
    }
    if(c==-1||d==-1){
        printf("?\n");
    }
    else{
        printf("%d\n",c+d);
    }
    system("pause");
    return 0;
}