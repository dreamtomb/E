#include <iostream>
#include <string.h>
using namespace std;
int deng[100];
int main(){
    char l1[]="`1234567890-=QWERTYUIOP[]\\ASDFGHJKL;'ZXCVBNM,./";
    char c;
    while((c=getchar())!=EOF){
        if (c==' '){
            printf("%s"," ");
        }
        else if(c=='\n'){
            printf("\n");
        }
        else{
            for (int i=0;i<strlen(l1);i++){
                if (c==l1[i]){
                    printf("%c",l1[i-1]);
                    break;
                }
            }
        }
    }
    return 0;
}