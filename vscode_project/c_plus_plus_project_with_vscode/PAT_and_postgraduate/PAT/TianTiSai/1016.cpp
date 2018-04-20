#include<iostream>
#include<string.h>
using namespace std;
int main(){
    int n,index=0;
    char s[20];
    int weight[17]={7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2};
    char m[11]={'1','0','X','9','8','7','6','5','4','3','2'};
    char test;
    scanf("%d",&n);
    for (int i=0;i<n;i++){
        scanf("%s",s);
        int len=strlen(s);
        int res=0;
        int flag=0;
        for (int j=0;j<17;j++){
            switch(s[j]){
                case '0':
                res+=weight[j]*0;
                break;
                case '1':
                res+=weight[j]*1;
                break;
                case '2':
                res+=weight[j]*2;
                break;
                case '3':
                res+=weight[j]*3;
                break;
                case '4':
                res+=weight[j]*4;
                break;
                case '5':
                res+=weight[j]*5;
                break;
                case '6':
                res+=weight[j]*6;
                break;
                case '7':
                res+=weight[j]*7;
                break;
                case '8':
                res+=weight[j]*8;
                break;
                case '9':
                res+=weight[j]*9;
                break;
                default:
                printf("%s\n",s);
                index++;
                flag=1;
                break;
            }
        }
        res=res%11;
        test=m[res];
        if(test==s[17]||flag){        }
        else{    
            printf("%s\n",s);
            index++;
         }
    }
    if(index==0){
        printf("%s\n","All passed");
    }
    else{    }
    system("pause");
    return 0;
}