#include <iostream>
#pragma once

/*顶点结构体*/
struct Vex
{
	int x;
	int y;
	int pic;
};
/*边的结构体*/
struct Edge
{
	int vex1;//边的第一个顶点
	int vex2;//边的第二个顶点
};
typedef struct Path
{
	int vexs[90];//保存一条路径
}* PathList;
class Graph
{
public:
	Vex V[90];//顶点数组
	int adj[90][90];//邻接矩阵
};