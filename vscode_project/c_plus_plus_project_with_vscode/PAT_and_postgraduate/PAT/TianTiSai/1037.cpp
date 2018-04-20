#include <iostream>
using namespace std;
int main(){
    int a,b;
    scanf("%d %d",&a,&b);
    if(b>0){
        printf("%d/%d=%.2f\n",a,b,(float)a/b);
    }
    else if(b==0){
        printf("%d/%d=Error\n",a,b);
    }
    else{
        printf("%d/(%d)=%.2f\n",a,b,(float)a/b);
    }
    system("pause");
    return 0;
}