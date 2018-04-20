#include <iostream>
#include <string.h>
using namespace std;
int main(){
    char s[20]="I Love GPLT\0";
    int len =strlen(s);
    for (int i=0;i<len;i++){
        printf("%c\n",s[i]);
    }
    system("pause");
    return 0;
}