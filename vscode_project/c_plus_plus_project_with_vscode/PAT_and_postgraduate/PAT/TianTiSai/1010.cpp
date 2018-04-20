#include<iostream>
#include <string.h>
#include<algorithm>
using namespace std;
int main(){
    int a[3];
    memset(a,0,sizeof(a));
    for(int i=0;i<3;i++){
        scanf("%d",&a[i]);
    }
    sort(a,a+3);
    for (int i=0;i<2;i++){
        printf("%d->",a[i]);
    }
    printf("%d\n",a[2]);
    system("pause");
    return 0;
}