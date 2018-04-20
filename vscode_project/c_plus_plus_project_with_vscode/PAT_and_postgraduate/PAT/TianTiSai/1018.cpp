#include <iostream>
using namespace std;
int main(){
    int h,m;
    scanf("%d:%d",&h,&m);
    if((h>=0&&h<12)||(h==12&&m==0)){
        printf("Only %02d:%02d.  Too early to Dang.\n",h,m);
        return 0;
    }
    int num=0;
    if(m==0){
        num=h%12;
    }
    else{
        num=h%12+1;
    }
    for(int i=0;i<num;i++){
        printf("Dang");
    }
    printf("\n");
    return 0;
}