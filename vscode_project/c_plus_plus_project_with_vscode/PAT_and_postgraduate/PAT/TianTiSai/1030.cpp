#include <iostream>
#include <string>
#include <vector>
using namespace std;
int main (){
	int n;
	vector <int> sex;
	vector <string> name;
	scanf("%d",&n);
	for(int i=0;i<n;i++){
		int s;
		char n[10];
		scanf("%d %s",&s,n);
		sex.push_back(s);
		name.push_back(n);
	}
	for(int j= n-1;j>=0;j--){
		if(sex[0]^sex[j]){
			cout<<name[0]<<' '<<name[j]<<endl;
			name.erase(name.begin());
			name.erase(name.begin()+j-1);
			sex.erase(sex.begin());
			sex.erase(sex.begin()+j-1);
			--n;
			j=--n;
		}
	}
	system("pause");
	return 0;
}