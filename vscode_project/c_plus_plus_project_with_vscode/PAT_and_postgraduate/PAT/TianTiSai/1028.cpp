#include <iostream>
#include <math.h>
using namespace std;
int main(){
    int n;
    scanf("%d",&n);
    for(int i=0;i<n;i++){
        int a,flag=0;
        scanf("%d",&a);
        for(int i=1;i<sqrt(a)+1;i++){
            if(a%i==0&&i<a&&i!=1){
                printf("%s\n","No");
                flag=1;
                break;
            }
        }
        if(a==1){
            printf("%s\n","No");
        }
        else if(!flag){
            printf("%s\n","Yes");
        }
    }
    system("pause");
    return 0;
}