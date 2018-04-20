#include <iostream>
#include <vector>
#include <string>
using namespace std;
int main(){
    char s[11];
    vector <string> v;
    while(scanf("%s",s)&&s[0]!='.'){
        v.push_back(s);
    }
	if(v.size()>=14){
		cout<<v[1]<<" and "<<v[13]<<" are inviting you to dinner..."<<endl;
	}
	else if(v.size()>=2){
		cout<<v[1]<<" is the only one for you..."<<endl;
	}
	else{
		cout<<"Momo... No one is for you ..."<<endl;
	}
	system("pause");
    return 0;
}