#include <iostream>
#include <string.h>
using namespace std;
int main(){
    char a[1001];
    char b[10]={'0','1','2','3','4','5','6','7','8','9'};
    int sum[10];
    memset(sum,0,sizeof(sum));    
    scanf("%s",a);
    int len=strlen(a);
    for (int i=0;i<=9;i++){
        for (int j=0;j<len;j++){
            if(b[i]==a[j]){  
                sum[i]++;
            }
        }
    }
    for (int i=0;i<=9;i++){
        if(sum[i]!=0){
            cout<<i<<":"<<sum[i]<<endl;
        }       
    }
    return 0;
}