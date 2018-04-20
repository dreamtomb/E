#include <iostream>
#include <vector>
using namespace std;
int main(){
    vector <char> v;
    char c;
    while(c=getchar()&&c!='\0'){
        v.push_back(c);
    }
    vector<char>::iterator it;
    for(it=v.begin();it!=v.end();it++){
        cout<<*it<<endl;
    }
    system("pause");
    return 0;
}