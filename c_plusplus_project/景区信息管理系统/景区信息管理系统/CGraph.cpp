#include <iostream>
#include <fstream>
#include <string>
#include "CGraph.h"
#include "CTourism.h"
using namespace std;


/*初始化图*/
void CGraph::Init()
{
	memset(m_aAdjMatrix,0,400*sizeof(int));
	memset(m_aVexs,0,20*sizeof(Vex));
	m_nVexNum=0;
};

/*将顶点添加到顶点数组*/
bool CGraph::InsertVex(Vex sVex)
{
	if(m_nVexNum==20)
	{
		cout<<"顶点已满"<<endl;
		return false;
	}
	m_aVexs[m_nVexNum++]=sVex;
	return true;
};

/*将边保存到邻接矩阵*/
bool CGraph::InsertEdge(Edge sEdge)
{
	if(sEdge.vex1<0||sEdge.vex1>=20||sEdge.vex2<0||sEdge.vex2>=20)
	{
		return false;
	}
	m_aAdjMatrix[sEdge.vex1][sEdge.vex2]=sEdge.weight;
	m_aAdjMatrix[sEdge.vex2][sEdge.vex1]=sEdge.weight;
	return true;
};

/*查询指定顶点信息*/
Vex CGraph::GetVex(int nVex)
{
	return m_aVexs[nVex];
}

/*查询与指定顶点相连的边*/
int CGraph::FindEdge(int nVex,Edge aEdge[])
{
	int k=0;
	for(int i=0;i<m_nVexNum;i++)
	{
		if(m_aAdjMatrix[i][nVex]!=0)
		{
			aEdge[k].vex1=i;
			aEdge[k].vex2=nVex;
			aEdge[k].weight=m_aAdjMatrix[i][nVex];
			k++;
		}
	}
	return k;
}

/*获取当前顶点数*/
int CGraph::GetVexnum()
{
	return m_nVexNum;
}

/*获得遍历的结果*/
void CGraph::DFSTraverse(int nVex,PathList &List)
{
	int nIndex=0;
	bool aVisited[20]={false};
	DFS(nVex,aVisited,nIndex,List);
}

/*深度优先搜索遍历*/
//此函数书上的说法错误，已修改
void CGraph::DFS(int nVex,bool aVisited[],int &nIndex,PathList &List)
{
	/*这一段存在问题，即：当最后一个联通点运行完，退出循环后，
	与上一个联通点联通的没有访问过的点会入列，出错*/
	/*如本程序中的2点的查询*/
	/*aVisited[nVex]=true;
	List->vexs[nIndex++]=nVex;
	Edge aEdge[20];
	int k=FindEdge(nVex,aEdge);
	for(int i=0;i<k;i++)
	{
	int j=aEdge[i].vex1;
	if(m_aAdjMatrix[j][nVex]!=0&&!aVisited[j])
	{
	DFS(j,aVisited,nIndex,List);
	}
	}*/

	/*单一路线修改完成版*/
	//aVisited[nVex]=true;
	//List->vexs[nIndex++]=nVex;
	//Edge aEdge[20];
	//int k=FindEdge(nVex,aEdge);
	//int i;
	//for(i=0;i<k;i++)
	//{
	//	int j=aEdge[i].vex1;
	//	if(m_aAdjMatrix[j][nVex]!=0&&!aVisited[j])
	//	{
	//		DFS(j,aVisited,nIndex,List);
	//	}
	//}
	//int p=0;
	//for (int j=0;List->vexs[j]!=-1;j++)
	//{
	//	p++;//计算现在为止入列的顶点数
	//}
	//if(p!=m_nVexNum)
	//{
	//	List->vexs[--nIndex]=-1;//将刚才入列的踢出去
	//	aVisited[nVex]=0;//将刚才访问过得设置为没有访问过
	//}

	int p=0;
	aVisited[nVex]=true;
	List->vexs[nIndex++]=nVex;
	for(int i=0;i<m_nVexNum;i++)
	{
		if(aVisited[i])
			p++;
	}
	if(p==m_nVexNum)//全都访问过了
	{
		List->next=new Path;
		for(int i=0;i<p;i++)
		{
			List->next->vexs[i]=List->vexs[i];//上一条完整的路径用来回滚再探
		}
		List=List->next;
		List->next=NULL;
	}
	else
	{
		for(int i=0;i<m_nVexNum;i++)
		{
			if(m_aAdjMatrix[i][nVex]!=0&&!aVisited[i])
			{
				DFS(i,aVisited,nIndex,List);
				aVisited[i]=false;
				nIndex--;
			}
		}
	}
}

/*搜索两点间的最短路径*/
/*先选出和起始点相连的点中最近的，然后确定这是这两点的最短路径，然后对和这一点
相连的点，进行原始值与和的比较，更新，然后再找除这两点外离起始点最近的点，开始
循环*/
int CGraph::FindShortPath(int nVexStart,int nVexEnd,Edge aPath[])
{
	int v=0;
	int nShortPath[20][20];//保存最短路径，行的下标就是终点，从左往右不是-1的是途径点  
	int nShortDistance[20];//保存起始点到所有点的最短距离   
	bool aVisited[20];
	for(v=0;v<m_nVexNum;v++)
	{
		aVisited[v]=false; 
		if(m_aAdjMatrix[nVexStart][v]!=0)      
			nShortDistance[v]=m_aAdjMatrix[nVexStart][v];
		else           
			nShortDistance[v]=65535;//断路
		nShortPath[v][0]=nVexStart;
		for(int j=1;j<m_nVexNum;j++)
		{
			nShortPath[v][j]=-1;  
		}
	}   
	aVisited[nVexStart]=true; 
	int min;  
	for(int i=1;i<m_nVexNum;i++)
	{
		min=65535;
		bool IS=false;     
		for(int j=0;j<m_nVexNum;j++) 
		{    
			if(aVisited[j]==false)   
			{
				if(nShortDistance[j]<min)
				{
					v=j;     
					min=nShortDistance[j];  
					IS=true;  
				}
			}
		}  
		if(IS==false)
		{
			break; 
		}
		aVisited[v]=true;  
		nShortPath[v][i]=v;
		for(int w=0;w<m_nVexNum;w++)
		{       
			if(aVisited[w]==false&&(min+m_aAdjMatrix[v][w]<nShortDistance[w])&&m_aAdjMatrix[v][w]!=0)   
			{         
				nShortDistance[w]=min+m_aAdjMatrix[v][w];
				for(int i=0;i<m_nVexNum;i++)   
				{      
					nShortPath[w][i]=nShortPath[v][i];
				}
			}
		}
	}
	int nIndex=0;
	int nVex1=nVexStart;   
	for(int i=1;i<m_nVexNum;i++) 
	{
		if(nShortPath[nVexEnd][i]!=-1) 
		{
			aPath[nIndex].vex1=nVex1;
			aPath[nIndex].vex2=nShortPath[nVexEnd][i]; 
			aPath[nIndex].weight=m_aAdjMatrix[aPath[nIndex].vex1][aPath[nIndex].vex2];
			nVex1=nShortPath[nVexEnd][i]; 
			nIndex++;
		}
	}
	return nIndex;
}

/*构造最小生成树*/
/*0被访问，先找出和0最近的点，然后该点被访问，然后从找出和这两点最近的点，然后该点
被访问，再找出和这三个点最近的点，以此类推*/
int CGraph::FindMinTree(Edge aPath[])
{
	bool aVisited[20];
	for(int i=0;i<20;i++)
	{
		aVisited[i]=false;
	}
	aVisited[0]=true;//0顶点加入到集合中  
	int min;
	int nVex1,nVex2;
	for(int k=0;k<m_nVexNum-1;k++)//最小生成树一共的路径数
	{
		min=65535;
		for(int i=0;i<m_nVexNum;i++)
		{
			if(aVisited[i])    
			{
				for(int j=0;j<m_nVexNum;j++)
				{
					if(!aVisited[j])  
					{
						if((m_aAdjMatrix[i][j]<min)&&(m_aAdjMatrix[i][j]!=0))  
						{
							nVex1=i;  
							nVex2=j;
							min=m_aAdjMatrix[i][j];//找出最短的边       
						}
					}
				}
			}
		}     
		//保存最短边的两个顶点   
		aPath[k].vex1=nVex1;
		aPath[k].vex2=nVex2;
		aPath[k].weight=m_aAdjMatrix[nVex1][nVex2];     //将两个顶点加入到集合
		aVisited[nVex1]=true; 
		aVisited[nVex2]=true;
	}
	return 0;
}


