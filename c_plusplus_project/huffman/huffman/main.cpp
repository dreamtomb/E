#include <iostream>
#include "compress.h"
#include "huffman.h"
using namespace std;
/*主函数*/
int main()
{	
	cout<<"/*****************哈夫曼压缩图片*********************/"<<endl;
	cout<<"请输入文件名："<<endl;
	/*
	misty.bmp
	forest.bmp
	方便复制
	*/
	char name[256];	
	cin>>name;
	cout<<endl;
	compress(name);
	cout<<"\n"<<endl;
	cout<<"压缩完成"<<endl<<endl;
	system("pause");
	return 0;	
}