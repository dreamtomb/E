#include <iostream>
#include <stdio.h>
#include<string>
#include<fstream>
#include <sstream>  
#include <iomanip>
#include "compress.h"
#include "huffman.h"
using namespace std;
/*将八个01代码转换成一个字符*/
char str2byte(string cd)
{
	char b=0x00;
	for(int i=1;i<9;i++)
	{
		b=b<<1;
		if(cd[i]=='1')
		{b=b|0x01;}
	}
	return b;
}

/*压缩在这里实现*/
int encode(const char *name,const HuffmanCode &HC,char pbuffer[],const int Size,string filename)
{
	FILE *fp=fopen(name,"rb");//只读方式
	pbuffer=(char*)malloc(Size*sizeof(char));
	if(!pbuffer)
	{
		cerr<<"开辟缓冲区失败"<<endl;
		return -1;
	}
	if (Size==0)
	{
		return -1;
	}
	//char cd[1000]={0};
	/*char *cd=(char*)malloc(Size*sizeof(char));*/
	string cd;
	int pos=0;
	int ch;
	while((ch=fgetc(fp))!=EOF)
	{
		//cout<<strlen(cd)<<endl;
		cd+=HC[ch+1];//HC复制到cd
	}
	fclose(fp);
	//开始压缩
	int count=0;
	ofstream fout;
	string Comfile=filename=".huf";
	const char *target=Comfile.c_str();
	fout.open(target,std::ios::out|std::ios::app);
	for(int i=0;i<cd.size();i++)
	{
		char b=0x00;
		for(int j=0;j<8&&i<cd.length();j++,i++)
		{
			b=b<<1;
			if (cd.at(i)=='1')
				b=b|0x01;
		}
		i--;
		fout<<(char)b; // 将字符写入文件
		count++;
	}
	return count;
}

/*压缩原文件*/
int compress(const char *name)
{
	cout<<"请输入你希望压缩后的文件名："<<endl;
	string filename;
	cin>>filename;
	
	FILE *fp=fopen(name,"rb");//只读方式
	unsigned char ch=getc(fp);
	int w[256]={0};//空了0
	int pSize=0;
	while(!feof(fp))
	{
		w[ch]++;
		pSize++;
		ch=fgetc(fp);
	}
	int aSize=pSize/8;
	cout<<"\n"<<endl;
	cout<<"/****************************************/"<<endl;
	cout<<"原文件大小为："<<aSize<<"字节"<<endl;
	cout<<"/****************************************/"<<endl;
	cout<<"\n"<<endl;
	/*cout<<"Byte	"<<"	weight"<<endl;
	for(int i=0;i<256;i++)
	{
	cout<<"0x"<<dec2hex(i)<<"		"<<w[i]<<endl;
	}*/
	fclose(fp);
	HuffmanTree HT;
	HuffmanCode HC;
	HuffmanCoding(HT,HC,w,256);

	/*根据上面得到的哈夫曼编码对原文件重新编码以实现压缩*/
	int Size=0;
	for(int i=1;i<=256;i++)
	{
		Size+=w[i-1]*strlen(HC[i]);
	}
	int nSize=(Size%8)?Size/8+1:Size/8;//字节数
	char pbuffer[10000];	
	//head shead;
	//要把上面的声明放到类里，不然会出现下面的错误
	//可能原因：应该是结构体在内存字节对齐的原因  填充BITMAPINFO结构体的时候可能存在越界
	int len=encode(name,HC,pbuffer,nSize,filename);
	cout<<"创建文件成功"<<endl;
	cout<<"\n"<<endl;
	cout<<"/****************************************/"<<endl;
	cout<<"新文件大小是："<<len<<"字节"<<endl;
	float f=100*len/aSize;
	cout<<"压缩比例是："<<f<<"%"<<endl;
	cout<<"/****************************************/"<<endl;
	return 0;
	//运行后括号的时候显示Run-Time Check Failure #2 - Stack around the variable 'shead' was corrupted.
}
