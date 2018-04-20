#include <iostream>
using namespace std;
int main(){
    int n;
    int s[7]={1,2,3,4,5,6,7};
    scanf("%d",&n);
    printf("%d\n",s[(n+1)%7]);
    system("pause");
    return 0;
}