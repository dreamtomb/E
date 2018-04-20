#include<iostream>
using namespace std;
int main(){
    int a[3]={1,3,5};
    int sum=11;
    int dp[12];
    for(int i=0;i<12;i++){
        dp[i]=i;
    }
    for(int i=0;i<=sum;i++){
        for (int j=0;j<3;j++){
            if(i>=a[j]&&(dp[i-a[j]]+1<dp[i])){
                dp[i]=dp[i-a[j]]+1;
            }
        }
    }
    for(int i=0;i<=sum;i++){
        cout<<dp[i]<<endl;
    }
    system("pause");
    return 0;
}