#include <iostream>
#ifndef CTOURISM_H
#define CTOURISM_H

class CTourism
{
private:
	CGraph m_Graph;
public:
	/*读取文件，创建景区景点图*/
	void CreateGraph();

	/*查询指定景点信息，显示到相邻景点的距离*/
	void GetSpotInfo();

	/*查询旅游景点导航路线*/
	void TravelPath();

	/*搜索两个景点间的最短路径*/
	void FindShortPath();

	/*查询铺设电路规划图*/
	void DesignPath();
};

#endif