#include <iostream>
#include <string.h>
using namespace std;
void deal(char sex,double height){
    double ans=0;
    if(sex=='M'){
        ans=height/1.09;
    }
    else{
        ans=height*1.09;
    }
    printf("%.2f\n",ans);
}
int main(){
    int n;
    char sex;
    double height;
    scanf("%d",&n);
    while(n--){
        scanf("%c %f",&sex,&height);
        cin>>sex>>height;
        deal(sex,height);
    }
    system("pause");
    return 0;
}