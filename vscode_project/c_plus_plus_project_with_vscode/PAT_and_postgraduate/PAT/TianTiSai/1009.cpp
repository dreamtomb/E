#include <iostream>
using namespace std;
long long gcd(long long a,long long b){
    if(a == 0){
        return 0;
    }
    else{
        return (b == 0) ? a : gcd(b, a % b);
    }
}
int main(){
    long long a=0,b=0,c=0,d=0,fm,fz;
    int n=0,i=1;
    scanf("%d",&n);
    scanf("%lld/%lld",&a,&b);
    long long m=gcd(a,b);
    if(a){
        a/=m;
        b/=m;
    }
    while(i++<n){
        scanf("%lld/%lld",&c,&d);
        fm=b*d/gcd(b,d);
        a=a*fm/b+c*fm/d;
        b=fm;      
        long long t=gcd(fm,fz);
        if(t!=0){
            a/=t;
            b/=t;
        }
    } 
    if(a%b==0){
        printf("%lld\n",a/b);
    }
    else if(a>b){
        printf("%lld %lld/%lld\n",a/b,a%b,b);
    }
    else{
        printf("%lld/%lld\n",a,b);
    }
    system("pause");
    return 0;
}