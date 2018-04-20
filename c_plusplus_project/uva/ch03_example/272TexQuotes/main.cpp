#include <iostream>
using namespace std;
int main(){
    char flag;
    bool test=true;
    while((flag=getchar())!=EOF){
        if(flag!='"'){
            printf("%c",flag);
        }
        else{
            printf("%s",test?"``":"''");
            test=!test;
        }
    }
    return 0;
}
