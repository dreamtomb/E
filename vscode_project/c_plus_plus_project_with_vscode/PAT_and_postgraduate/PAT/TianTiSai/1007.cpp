#include <iostream>
#include <string.h>
using namespace std;
char s[10000];
int main(){
    scanf("%s",s);
    int len=strlen(s);
    for (int i=0;i<len-1;i++){
        switch(s[i]){
            case '-':
            printf("fu ");    
            break;
            case '0':
            printf("ling ");
            break;
            case '1':
            printf("yi ");
            break;
            case '2':
            printf("er ");
            break;
            case '3':
            printf("san ");
            break;
            case '4':
            printf("si ");
            break;
            case '5':
            printf("wu ");
            break;
            case '6':
            printf("liu ");
            break;
            case '7':
            printf("qi ");
            break;
            case '8':
            printf("ba ");
            break;
            case '9':
            printf("jiu ");
            break;          
        }
    }
    switch(s[len-1]){
        case '-':
        printf("fu");    
        break;
        case '0':
        printf("ling");
        break;
        case '1':
        printf("yi");
        break;
        case '2':
        printf("er");
        break;
        case '3':
        printf("san");
        break;
        case '4':
        printf("si");
        break;
        case '5':
        printf("wu");
        break;
        case '6':
        printf("liu");
        break;
        case '7':
        printf("qi");
        break;
        case '8':
        printf("ba");
        break;
        case '9':
        printf("jiu");
        break;
    }
    system("pause");
    return 0;
}