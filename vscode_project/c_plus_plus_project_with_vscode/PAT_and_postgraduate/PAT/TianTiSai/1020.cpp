#include <iostream>
#include <string.h>
using namespace std;
int data[101][1001];
int wait[10001];
int main(){
	int n,k,m,flag=0,fff=0;
	memset(data,0,sizeof(data));
	memset(wait,0,sizeof(wait));
	scanf("%d",&n);
	for (int i=0;i<n;i++){
		scanf("%d",&k);
		for (int j=0;j<k;j++){
			scanf("%d",&data[i][j]);
		}
	}
	scanf("%d",&m);
	for (int i=0;i<m;i++){
		scanf("%d",&wait[i]);
	}
	for (int i=m-1;i>=1;i--){
		for (int j=0;j<i;j++){
			if(wait[i]==wait[j]){
				for(int k=i;k<m;k++){
					wait[k]=wait[k+1];
				}
				m--;
			}
		}
	}
	for (int i=0;i<m;i++){
		for(int j=0;j<100;j++){
			if(i<m){
				for (int k=0;k<1000;k++){
					if(wait[i]==data[j][k]){
						i++;
						j=-1;
						k=-1;
						break;
					}
				}
			}
			else{
				break;
			}
		}
		if(i>=m){
			break;
		}
		flag=1;
		if(fff==0){
			printf("%05d",wait[i]);
			fff=1;
		}
		else{
			printf(" %05d",wait[i]);
		}      
	}
	if(!flag){
		printf("No one is handsome");
    }
    printf("\n");
	system("pause");
	return 0;
}