#include <iostream>
using namespace std;
int jc(int n){
    int sum=1;
    for(int i=2;i<=n;i++){
        sum*=i;
    }
    return sum;
}
int main(){
    int n,sum=0;
    scanf("%d",&n);
    for (int i=1;i<=n;i++){
        sum+=jc(i);
    }
    printf("%d\n",sum);
    system("pause");
    return 0;
}