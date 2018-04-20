#include <iostream>
#include <cmath>
using namespace std;
int main(){
    int n=0,num;
    char c;
    int sl[23];
    scanf("%d %c",&n,&c);
    for (int i=1;i<=23;i++){
        sl[i-1]=2*i*i-1;
    }
    for (int i=0;i<22;i++){
        if(sl[i]<=n&&sl[i+1]>n){
            num=sl[i];
        }
    }
    int up=2*sqrt((num+1)/2)-1;
    for (int i=up;i>=1;i=i-2){
        int nul=(up-i)/2;
        for (int j=0;j<nul;j++){
            printf(" ");
        }
        for (int j=1;j<=i;j++){
            printf("%c",c);
        }
        printf("\n");
    }
    for (int i=3;i<=up;i=i+2){
        int nul=(up-i)/2;
        for (int j=0;j<nul;j++){
            printf(" ");
        }
        for (int j=1;j<=i;j++){
            printf("%c",c);
        }
        printf("\n");
    }
    printf("%d\n",n-num);
    return 0;
}