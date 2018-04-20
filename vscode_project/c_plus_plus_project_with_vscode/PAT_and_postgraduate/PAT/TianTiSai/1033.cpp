#include <iostream>
#include <set>
using namespace std;
int fun(int year){
	set <int> y;
	y.insert(year/1000);
	y.insert(year/100%10);
	y.insert(year/10%10);
	y.insert(year%10);
	return y.size();
}
int main(){
    int year,n,count=0;
	scanf("%d",&year);
	scanf("%d",&n);
    while(fun(year)!=n){
        year++;
        count++;
    }
    printf("%d %04d",count,year);
    system("pause");
    return 0;
}