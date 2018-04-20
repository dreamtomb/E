#include <iostream>
#include <string.h>
#include <vector>
using namespace std;
int main(){
    int a[10];
    memset(a,0,sizeof(a));
    vector<int> v;
    for(int i=0;i<10;i++){
        v.push_back(i);
    }
    for(int i=0;i<10;i++){
        cout<<v.at(i)<<endl;
    }
    system("pause");
    return 0;
}