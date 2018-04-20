#include <iostream>
#include <string.h>
using namespace std;
int sta[100001];
int main(){
    memset(sta,0,sizeof(sta));
    int t=0,a,b,c,d,e,f,aa,bb,cc,dd;
    scanf("%d",&t);
    for (int i=1;i<=100001;i++){
        int temp=i,s;
        s=temp;
        while(temp>0){
            s+=temp%10;
            temp=temp/10;
        }
        if(sta[s]==0||i<sta[s]){
            sta[s]=i;
        }
    }
    int r;
    while(t--){      
        scanf("%d",&r);
        printf("%d\n",sta[r]);
    }   
    return 0;   
}