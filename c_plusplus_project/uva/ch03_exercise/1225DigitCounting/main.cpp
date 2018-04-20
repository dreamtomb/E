#include <iostream>
#include <string.h>
using namespace std;
int s[10];
int main(){
	int t;
	scanf("%d",&t);
	while(t--){
		int n;
        scanf("%d",&n);
        memset(s,0,sizeof(s));
		for (int i=1;i<=n;i++){
			if(i<10){
				for (int j=0;j<10;j++){
					if(j==i){
						s[j]++;
					}
				}
			}
			else if (i<100){
				int a=i%10;
				int b=(i-a)/10;
				for (int j=0;j<10;j++){
					if(j==a){
						s[j]++;
					}
					if(j==b){
						s[j]++;
					}
				}
			}
			else if(i<1000){
				int a=i%10;
				int aa=(i-a)/10;
				int b=aa%10;
				int c=(aa-b)/10;
				for (int j=0;j<10;j++){
					if(j==a){
						s[j]++;
					}
					if(j==b){
						s[j]++;
					}
					if(j==c){
						s[j]++;
					}
				}
			}
			else{
				int a=i%10;
				int aa=(i-a)/10;
				int b=aa%10;
				int bb=(aa-b)/10;
				int c=bb%10;
				int d=(bb-c)/10;
				for (int j=0;j<10;j++){
					if(j==a){
						s[j]++;
					}
					if(j==b){
						s[j]++;
					}
					if(j==c){
						s[j]++;
					}
					if(j==d){
						s[j]++;
					}
				}
			}
		}
		for(int i=0;i<9;i++){
			printf("%d%s",s[i]," ");
		}
		printf("%d\n",s[9]);
	}
	system("pause");
	return 0;
}