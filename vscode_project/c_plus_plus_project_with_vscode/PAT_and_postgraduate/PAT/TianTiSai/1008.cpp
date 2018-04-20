#include <iostream>
using namespace std;
int main(){
    int a,b,sum=0,index=0;
    int flag=1;
    scanf("%d %d",&a,&b);
    for (int i=a;i<=b;i++){
        if(index++%5==0){
            if(flag==1){
                flag=0;
            }
            else{
                printf("\n");
            } 
        }
        printf("%5d",i);
        sum+=i;
    }
    printf("\nSum = %d",sum);
    system("pause");
    return 0;
}