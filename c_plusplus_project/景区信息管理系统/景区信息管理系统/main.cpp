#include <iostream>
#include <fstream>
#include "CGraph.h"
#include "CTourism.h"
using namespace std;
void menu()
{
	cout<<"/*****************欢迎进入景区信息管理系统***************/"<<endl;
	cout<<"1:创建景区景点图"<<endl;
	cout<<"2:查询景点信息"<<endl;
	cout<<"3:旅游景点导航"<<endl;
	cout<<"4:搜索最短路径"<<endl;
	cout<<"5:铺设电路规划"<<endl;
	cout<<"0:退出"<<endl;
	cout<<"请输入您希望进行的操作:"<<endl;
}
int main()
{
	CTourism ctourism;
	while(1)
	{
		menu();
		int choice;
		cin>>choice;
		switch(choice)
		{
		case 1:
			ctourism.CreateGraph();
			break;
		case 2:
			ctourism.GetSpotInfo();
			break;
		case 3:
			ctourism.TravelPath();
			break;
		case 4:
			ctourism.FindShortPath();
			break;
		case 5:
			ctourism.DesignPath();
			break;
		case 0:
			return 0;
		default:
			cout<<"您输入的编号不正确!"<<endl;
			break;
		}
	}
	return 0;
}