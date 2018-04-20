#include <iostream>
#include <stdio.h>
#include<string>
#include<fstream>
#include <sstream>  
#include <iomanip>
#include "compress.h"
#include "huffman.h"
using namespace std;


/*找到最小的节点*/
int min1st(HuffmanTree &HT,int size)
{
	int s1;
	int min=999;
	for(int j=1;j<=size;j++)
	{
		if(HT[j].parent==0)//找到第一个没有使用过的节点
		{
			min=HT[j].weight;//将最小值更新  
			break;  
		}
	}
	for(int p=1;p<=size;++p) 
	{
		if(HT[p].parent==0&&min>=HT[p].weight)//如果有未被使用的节点的权值小于目前的最小值
		{
			s1=p;  
			min=HT[p].weight;  
		}
	}
	return s1;
}

/*找到第二小的节点*/
int min2rd(HuffmanTree &HT,int s1,int i)
{
	int s2=0;
	int min=999;
	for(int j=1;j<=i;j++)
	{
		if(HT[j].parent==0&&min>=HT[j].weight)
			if(j==s1)//不是s1的话
				continue;
			else
			{
				s2=j;
				min=HT[j].weight;
			}
	}
	return s2;
}

/*在创建huffman树的过程中找到两个最小权值的节点，建成非平衡哈夫曼树的选择方式*/
void Select(HuffmanTree &HT,int i,int &s1,int &s2)
{
	s1=min1st(HT,i);
	s2=min2rd(HT,s1,i);
}

/*建成平衡哈夫曼树的选择方式*/
int selectBalance(HuffmanTree pHT, int size)
{
	int Value=65535;//最小值
	int num=0;//元素序号
	//找到最小权值的元素序号
	for(int i=1;i<=size;i++)
	{
		if(pHT[i].parent==0&&pHT[i].weight<Value)
		{
			Value=pHT[i].weight;
			num=i;
		}
	}
	return num;
}


/*创建哈夫曼树以及哈夫曼编码*/
void HuffmanCoding(HuffmanTree &HT,HuffmanCode &HC,int *w,int n)//从叶节点开始
{
	/*下面创建哈夫曼树*/
	/*HT储存了各个节点的权重，父节点，孩子节点*/
	ofstream fout("HufTree&'scode.txt");
	int s1,s2;
	int m;
	int i;
	HuffmanTree p;
	if(n<=1)//叶节点小于等于1，不闹了
	{
		cout<<"叶节点过少"<<endl;
		return;
	}
	m=2*n-1;//一共
	HT=(HuffmanTree)malloc((m+1)*sizeof(HuffmanNode));//空个0号单元//HT是一个数组，每个元素只有一个节点的树
	memset(HT,0,(m+1)*sizeof(HuffmanNode));//对所有节点初始化为0  
	for(int i=1;i<=n;i++)  
	{  
		HT[i].weight=*w++;//初始化各节点权值
		//cout<<HT[i].weight<<endl;
	}  

	/*以下方法建成的是非平衡的哈夫曼树*/
	//for(i=n+1;i<=m;++i)
	//{
	//	Select(HT,i-1,s1,s2);//从刚才赋值的节点中选出最小的俩
	//	HT[s1].parent=i;
	//	HT[s2].parent=i;
	//	HT[i].lchild=s1;
	//	HT[i].rchild=s2;
	//	HT[i].weight=HT[s1].weight+HT[s2].weight;
	//}

	for(i=n+1;i<=m;i++)/*以下方法建成的是平衡的哈夫曼树*/
	{
		int s1,s2;
		s1=selectBalance(HT,i-1);
		HT[s1].parent=i;
		s2=selectBalance(HT,i-1);
		HT[s2].parent=i;
		HT[i].lchild=s1;
		HT[i].rchild=s2;
		HT[i].weight=HT[s1].weight+HT[s2].weight;
	}

	for(i=1;i<=m;i++)
	{
		fout<<"第"<<i<<"个节点的双亲为："<<HT[i].parent<<"  左孩子为："<<HT[i].lchild<<"  右孩子为："<<HT[i].rchild<<"  权重为:"<<HT[i].weight<<endl;
	}
	/*下求叶子节点的哈弗曼编码HC*/
	/*HC储存的是各个字符的编码*/
	HC=(HuffmanCode)malloc((n+1)*sizeof(char *));
	char *cd;
	int j,c,q,start;
	cd=(char*)malloc(n*sizeof(char));
	cd[n-1]='\0';
	for(j=1;j<=n;j++)//HC【1】~【n】才有数
	{
		start=n-1; //cd串每次从末尾开始
		c=j;
		q=HT[j].parent;//p在n+1至2n-1
		while(q) //沿父亲方向遍历,直到为0
		{
			start--;//依次向前置值
			if(HT[q].lchild==c)//与左子相同,置0
				cd[start]='0';
			else //否则置1
				cd[start]='1';
			c=q;
			q=HT[q].parent;
		}
		HC[j]=(char *)malloc((n-start)*sizeof(char));
		strcpy(HC[j],&cd[start]);
		//ascll中前32个迷一般，我又从1开始，所以减33
		fout<<(char)(' '+j-33)<<"的编码为:"<<HC[j]<<endl;//‘ ’是32
		//cout<<(char)(' '+j-33)<<"的编码为:"<<HC[j]<<endl;
	}
	free(cd);//释放cd内存
}

/*将int转成16进制字符串*/  
string dec2hex(int i)
{  
	stringstream ioss; //定义字符串流  
	string s_temp; //存放转化后字符  
	ioss << setiosflags(ios::uppercase) << hex << i; //以十六制(大写)形式输出  
	ioss >> s_temp;  
	return s_temp;  
}  
