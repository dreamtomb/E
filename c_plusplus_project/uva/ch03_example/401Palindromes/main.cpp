#include <iostream>
#include <string.h>
#include <ctype.h>
using namespace std;
const char *rev = "A   3  HIL JM O   2TUVWXY51SE Z  8 ";
char s[100];
int main()
{
    int index,len;
    while(scanf("%s",s)==1){
        int mirror=1,palindrome=1;
        len=strlen(s);
        for (int i=0;i<(len+1)/2;i++){
            if (s[i]!=s[len-1-i]){
                palindrome=0;
            }
            if(isalpha(s[i])){
                index=s[i]-'A';
            }
            else{
                index=s[i]-'0'+25;
            }
            if (s[len-1-i]!=rev[index]){
                mirror=0;
            }
        }
        if(mirror==1&&palindrome==1){
            cout<<s<<" -- is a mirrored palindrome."<<endl<<endl;
        }
        else if (mirror==1&&palindrome==0){
            cout<<s<<" -- is a mirrored string."<<endl<<endl;
        }
        else if (mirror==0&&palindrome==1){
            cout<<s<<" -- is a regular palindrome."<<endl<<endl;
        }
        else {
            cout<<s<<" -- is not a palindrome."<<endl<<endl;
        }
    }
    return 0;
}
