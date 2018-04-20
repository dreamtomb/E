#include <iostream>
#include <math.h>
using namespace std;
int main(){
    int n;
    char c;
    scanf("%d %c",&n,&c);
    for(double i=0;i<round((n+0.5)/2);i++){
        for (int j=0;j<n;j++){
            printf("%c",c);
        }
        printf("\n");
    }
    system("pause");
    return 0;
}