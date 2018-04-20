#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;
 int main(){
     int n,b,k;
	 vector <int> v;
	 vector <int> num;
     scanf("%d",&n);
     for (int i=0;i<n;i++){
         scanf("%d",&k);
		 for (int i=0;i<k;i++){
			 scanf("%d",&b);
			 v.push_back(b);
		 }
     }
	 vector<int>::iterator it;
	 int nu=0,max=0;
	 for(it=v.begin();it!=v.end();it++){
		 nu=count(v.begin(),v.end(),*it);
		 num.push_back(nu);
		 if(max<nu){
			 max=nu;
		 }
		 else{}
	 }
	 int res=0;
	 for(int i=0;i<num.size();i++){
		 if(num.at(i)==max){
			 if(v.at(i)>res){
				 res=v.at(i);
			 }
		 }
	 }
	 printf("%d %d\n",res,max);
	 system("pause");
     return 0;
 }