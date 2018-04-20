#include <iostream>
#include <string.h>
using namespace std;
int main(){
    char s[51];
    scanf("%s",s);
    int len =strlen(s);
    double num=0;
    double p;
    for (int i=0;i<len;i++){
        if(s[i]=='2'){
            num++;
        }
    }
    if(s[0]=='-'){
        p=num/(len-1)*1.5*100;
    }
    else {
        p=num/len*100;
    }
    if((s[len-1]-48)%2==0){
        p=p*2;
    }
    printf("%.2f%c\n",p,'%');
    system("pause");
    return 0;
}