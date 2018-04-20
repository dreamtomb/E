#include <iostream>
#include <string>
#include <fstream>
#include<iomanip>
#include "CGraph.h"
#include "CTourism.h"
using namespace std;


/*读取文件，创建景区景点图*/
void CTourism::CreateGraph()
{
	m_Graph.Init();
	ifstream fin("Vex.txt");
	Vex sVex;
	string line;
	if (!fin.is_open())  
	{ 
		cout << "打开顶点文件失败！";
	} 
	int count=0;
	int index=0;
	cout<<endl<<"/*******************景点信息如下***********************/"<<endl;
	string num;//一共有多少记录
	getline(fin,num);
	while (!fin.eof())  
	{  
		index++;
		getline(fin, line);//按行提取文件
		int size = line.length();
		//得到最后一个数字可以这样读取
		string vex1,vex2,vex3;
		if(count==0)
		{
			count++;
			vex1=line;
			sVex.num=atoi(vex1.c_str());
			cout<<"第"<<sVex.num<<"景点在";
		}
		else if(count==1)
		{
			count++;
			vex2=line;
			int len=vex2.length();
			strcpy(sVex.name,vex2.c_str());
			cout<<sVex.name<<"描述如下：";
		}
		else if(count==2)
		{
			count=0;
			string desc=line;
			int len=desc.length();
			strcpy(sVex.desc,desc.c_str());
			cout<<sVex.desc<<endl;
			m_Graph.InsertVex(sVex);
		}
		if (index==3*atoi(num.c_str()))//index每读取一行都要加3所以num乘三
		{break;}
	}
	cout<<"/*****************************************************/"<<endl<<endl;
	fin.close();
	ifstream fin2("Edge.txt");
	Edge edge;
	int edgenum=0;
	line="0";
	if (!fin2.is_open())  
	{ 
		cout << "打开边文件失败！";
	} 
	cout<<"/*******************路径信息如下***********************/"<<endl;
	while (!fin2.eof())  
	{  
		getline(fin2, line);//按行提取文件
		int size = line.length();
		//得到最后一个数字可以这样读取
		int count=0;
		string vex1,vex2,distance;
		for(int t=0;t<size;)
		{
			if(line[t]=='#')//判断是空格
			{
				count+=1;	
				t++;
			}
			else if(count==0)
			{
				while(line[t]!='#')
				{
					vex1+=line[t];
					t++;
				}
				edge.vex1=atoi(vex1.c_str());
				cout<<"顶点"<<edge.vex1<<"到";
			}
			else if(count==1)
			{
				while(line[t]!='#')
				{
					vex2+=line[t];
					t++;
				}
				edge.vex2=atoi(vex2.c_str());
				cout<<edge.vex2<<"的距离是";
			}
			else if(count==2)
			{
				while(t!=size)
				{
					distance+=line[t];
					t++;
				}
				edge.weight=atoi(distance.c_str());
				cout<<edge.weight<<endl;
			}
		}
		m_Graph.InsertEdge(edge);
	}
	cout<<"/***************************************************/"<<endl<<endl;
	fin2.close();
	cout<<"创建景区景点图成功！"<<endl<<endl;
}

/*查询指定景点信息，显示到相邻景点的距离*/
void CTourism::GetSpotInfo()
{
	Vex vex;
	int choice=0;
	cout<<endl<<"/*************************************************/"<<endl;
	cout<<std::left<<setw(20)<<"景点编号"<<std::left<<setw(20)<<"所在区域"<<"景点描述"<<endl;
	for(int i=0;i<m_Graph.GetVexnum();i++)
	{
		vex=m_Graph.GetVex(i);
		cout<<std::left<<setw(20)<<vex.num<<std::left<<setw(20)<<vex.name<<vex.desc<<endl;
	}
	cout<<endl<<"/*************************************************/"<<endl<<endl;
	cout<<"请输入想要查询的景点编号"<<endl;
	cin>>choice;
	if(choice>=m_Graph.GetVexnum())
	{
		cout<<"编号不正确"<<endl;
		return;
	}
	Edge aEdge[100];
	int sum=m_Graph.FindEdge(choice,aEdge);
	cout<<endl<<"/*************************************************/"<<endl;
	cout<<"一共有"<<sum<<"个相邻景点"<<endl;
	cout<<std::left<<setw(20)<<"所在地"<<std::left<<setw(20)<<"相邻景点"<<"距离"<<endl;
	for(int i=0;i<sum;i++)
	{
		Edge edge=aEdge[i];
		cout<<std::left<<setw(20)<<m_Graph.GetVex(aEdge[i].vex2).name<<std::left<<setw(20)<<m_Graph.GetVex(aEdge[i].vex1).name<<aEdge[i].weight<<endl;
	}
	cout<<endl<<"/*************************************************/"<<endl<<endl;
}

/*查询旅游景点导航路线*/
void CTourism::TravelPath()
{
	cout<<"/****************************************/"<<endl;
	cout<<"请输入您所在的地点："<<endl;
	int choice;
	cin>>choice;
	if(choice>=m_Graph.GetVexnum())
	{cout<<"编号错误"<<endl;}
	PathList List=new Path;
	PathList head=List;
	List->next=NULL;
	int num=20;
	while(num--)
	{
		List->vexs[num]=-1;
	}
	m_Graph.DFSTraverse(choice,List);
	for(head;head;head=head->next)
	{
		/*所有可行解的最后一个徐判断，不然最后一个和倒数第二个之间有可能并不连通*/
		if(m_Graph.m_aAdjMatrix[head->vexs[m_Graph.GetVexnum()-1]][head->vexs[m_Graph.GetVexnum()-2]]==0)
		{
			for(int j=0;j<m_Graph.GetVexnum();j++)
			{
				List->vexs[j]=-1;
			}
		}
		for (int i=0;head->vexs[i]>=0;i++)
		{
			Vex vex=m_Graph.GetVex(head->vexs[i]);
			if(head->vexs[i+1]>=0)
			{cout<<vex.name<<"->";}
			else
			{cout<<vex.name<<endl;}
		}
	}
	cout<<endl;
}

/*搜索两个景点间的最短路径*/
void CTourism::FindShortPath()
{
	cout<<"/****************************************/"<<endl;
	cout<<"请输入两个景点的编号："<<endl;
	cout<<"起始点"<<endl;
	int vex1,vex2;
	cin>>vex1;
	cout<<"目的地"<<endl;
	cin>>vex2;
	Edge aPath[100];
	m_Graph.FindShortPath(vex1,vex2,aPath);
	cout<<"最短路线为："<<endl;
	Vex vex=m_Graph.GetVex(vex1);
	cout<<vex.name;
	for (int i=0;aPath[i].weight>=0;i++)
	{
		vex=m_Graph.GetVex(aPath[i].vex2);
		cout<<"->"<<vex.name;
	}
	cout<<endl;
}

/*查询铺设电路规划图*/
void CTourism::DesignPath()
{
	Edge aPath[20];
	m_Graph.FindMinTree(aPath);
	Vex vex1,vex2;
	int i=0;
	for(i=0;aPath[i].weight>=0;i++)
	{
		vex1=m_Graph.GetVex(aPath[i].vex1);
		vex2=m_Graph.GetVex(aPath[i].vex2);
		cout<<vex1.name<<"->"<<vex2.name<<"铺设"<<aPath[i].weight<<"米电缆"<<endl;
	}
}
