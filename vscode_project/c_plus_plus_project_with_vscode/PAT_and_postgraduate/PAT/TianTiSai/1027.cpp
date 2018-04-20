#include <iostream>
#include <string.h>
#include <algorithm>
using namespace std;
int main(){
    char s[12],arr[12],index[12];
    int h=1;
    scanf("%s",s);
    int len=strlen(s);
    arr[0]=s[0];
    for (int i=0;i<len;i++){
        int flag=1;
        for(int j=0;j<len;j++){
            if(s[i]!=arr[j]){
            }
            else{
                flag=0;
            }
        }
        if(flag){
            arr[h++]=s[i];
        }
    }
    int hlen=h;
    sort(arr,arr+hlen);
    printf("int[] arr = new int[]{");
    for(int i=hlen-1;i>0;i--){
        printf("%c,",arr[i]);
    }
    printf("%c};\n",arr[0]);
	for(int i=0;i<hlen/2;i++){
		char temp;
		temp=arr[i];
		arr[i]=arr[hlen-1-i];
		arr[hlen-1-i]=temp;
	}
    printf("%s","int[] index = new int[]{");
    for(int i=0;i<len;i++){
        for(int j=0;j<hlen;j++){
            if(s[i]==arr[j]){
                index[i]=j+48;
            }
        }
    }
    for(int i=0;i<len-1;i++){
        printf("%c,",index[i]);
    }
    printf("%c};\n",index[len-1]);
    system("pause");
    return 0;
}