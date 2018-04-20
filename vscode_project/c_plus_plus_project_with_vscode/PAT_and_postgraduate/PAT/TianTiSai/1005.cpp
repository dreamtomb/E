#include <iostream>
#include <string.h>
using namespace std;
char a[1000][20];
int b[1000];
int c[1000];
int main(){
    int n,m;
    memset(a,0,sizeof(a));
    memset(b,0,sizeof(b));
    memset(c,0,sizeof(c));
    scanf("%d",&n);
    for (int i=0;i<n;i++){
        scanf("%s",a[i]);
        scanf("%d",&b[i]);
        scanf("%d",&c[i]);
    }
    scanf("%d",&m);
    for(int i=0;i<m;i++){
        int index;
        scanf("%d",&index);
        for (int j=0;j<n;j++){
            if(index==b[j]){
                printf("%s ",a[j]);
                printf("%d\n",c[j]);
            }
        }
    }
    return 0;
}