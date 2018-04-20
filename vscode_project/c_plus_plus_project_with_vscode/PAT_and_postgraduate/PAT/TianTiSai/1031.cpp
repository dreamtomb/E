#include <iostream>
#include <math.h>
using namespace std;
int main (){
    int n;
    double w,h;
    scanf("%d",&n);
    while(n--){
        scanf("%lf %lf",&h,&w);
        double sw=(h-100)*1.8;
		double d=w-sw;
		double f=sw*0.1;
        if(fabs(d)<f){
            printf("%s\n","You are wan mei!");
        }
        else if(d>=f){
            printf("%s\n","You are tai pang le!");
        }
        else{
            printf("%s\n","You are tai shou le!");
        }
    }
    system("pause");
    return 0;
}