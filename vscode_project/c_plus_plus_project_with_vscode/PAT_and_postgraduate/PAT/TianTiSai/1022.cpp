#include <iostream>
using namespace std;
int main(){
    int n;
    scanf("%d",&n);
    int num,j=0,o=0;
    for (int i=0;i<n;i++){
        scanf("%d",&num);
        if(num%2==0){
            o++;
        }
        else{
            j++;
        }
    }
    printf("%d %d\n",j,o);
    system("pause");
    return 0;
}