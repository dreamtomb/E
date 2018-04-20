#include <iostream>
#ifndef CGRAPH_H
#define CGRAPH_H

/*顶点结构体*/
struct Vex
{
	int num;//景点编号
	char name[20];//景点名字
	char desc[1024];//景点描述
};

/*边的结构体*/
struct Edge
{
	int vex1;//边的第一个顶点
	int vex2;//边的第二个顶点
	int weight;//权值
};

/*定义链表来保存路径*/
typedef struct Path
{
	int vexs[20];//保存一条路径
	Path *next;//指向下一条路径
}* PathList;

/*类的定义*/
class CGraph
{
private:
	
	Vex m_aVexs[20];//顶点数组
	int m_nVexNum;//顶点个数
	/*深度优先搜索遍历*/
	void DFS(int nVex,bool aVisited[],int &nIndex,PathList &List);
public:
	int m_aAdjMatrix[20][20];//邻接矩阵
	/*初始化图*/
	void Init();

	/*将顶点添加到顶点数组*/
	bool InsertVex(Vex sVex);

	/*将边保存到邻接矩阵*/
	bool InsertEdge(Edge sEdge);

	/*查询指定顶点信息*/
	Vex GetVex(int nVex);

	/*查询与指定顶点相连的边*/
	int FindEdge(int nVex,Edge aEdge[]);

	/*获取当前顶点数*/
	int GetVexnum();

	/*获得遍历的结果*/
	void DFSTraverse(int nVex,PathList &List);

	/*搜索两点间的最短路径*/
	int FindShortPath(int nVexStart,int nVexEnd,Edge aPath[]);

	/*构造最小生成树*/;
	int FindMinTree(Edge aPath[]);
};

#endif