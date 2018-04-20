#include <iostream>
#include <string.h>
using namespace std;
char a[10001];
char b[10001];
int main(){
    gets(a);
    gets(b);
    int lenb=strlen(b);
	for(int i=0;a[i]!='\0';i++){
		for (int j=0;j<lenb;j++){
			if(a[i]==b[j]){
				break;
			}
			else if(j==lenb-1){
				printf("%c",a[i]);
			}
		}		
	}
    printf("\n");
    return 0;
}