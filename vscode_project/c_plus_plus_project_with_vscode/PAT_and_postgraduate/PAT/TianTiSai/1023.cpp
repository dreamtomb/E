#include <iostream>
#include <string.h>
#include <algorithm>
using namespace std;
char s[10001];
int main(){
    scanf("%s",s);
    int g=0,l=0,p=0,t=0;
    int len=strlen(s);
    for (int i=0;i<len;i++){
        if(s[i]=='G'||s[i]=='g'){
            g++;
        }
        else if(s[i]=='L'||s[i]=='l'){
            l++;
        }
        else if(s[i]=='P'||s[i]=='p'){
            p++;
        }
        else if(s[i]=='T'||s[i]=='t'){
            t++;
        }
    }
    int num[4]={g,l,p,t};
    sort(num,num+4);
    for(int i=0;i<num[3];i++){
        if(g>0){
            printf("%c",'G');
            g--;
        }
        if(p>0){
            printf("%c",'P');
            p--;
        }
        if(l>0){
            printf("%c",'L');
            l--;
        }
        if(t>0){
            printf("%c",'T');
            t--;
        }
    }
    printf("\n");
    system("pause");
    return 0;
}