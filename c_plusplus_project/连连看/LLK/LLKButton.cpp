// LLKButton.cpp : 实现文件
//

#include "stdafx.h"
#include <windows.h>
#include <mmsystem.h>
#pragma comment(lib, "WINMM.LIB")
#include "global.h"
#include "LLK.h"
#include "LLKLevelModel.h"
#include "LLKButton.h"
#include "LLKSetting.h"
#include <queue>

//初始化全局变量
LLKButton* LLKButton::ms_firstBtn = NULL;
LLKButton* LLKButton::ms_secondBtn = NULL;
CPoint LLKButton::ms_ptCross1(-1,-1);
CPoint LLKButton::ms_ptCross2(-1,-1);
LLKLevelModel* LLKButton::parent = NULL;
// LLKButton

IMPLEMENT_DYNAMIC(LLKButton, CButton)

	LLKButton::LLKButton()
{

}

LLKButton::~LLKButton()
{
}


BEGIN_MESSAGE_MAP(LLKButton, CButton)
	ON_WM_LBUTTONDOWN()
END_MESSAGE_MAP()



// LLKButton 消息处理程序
LLKButton::LLKButton(int type,CPoint point )
{
	m_location = point;
	m_ID = type;

}

//按钮按下的响应函数
void LLKButton::OnLButtonDown(UINT nFlags, CPoint point)
{
	// TODO: Add your message handler code here and/or call default
	CString str;

	parent = (LLKLevelModel *)GetParent();
	//初始化连接拐点
	ms_ptCross1.x = ms_ptCross1.y = -1;
	ms_ptCross2.x = ms_ptCross2.y = -1;

	//选中一个按钮时改变图片的样子
	if (LLKButton::ms_firstBtn == NULL)
	{
		//ms_firstBtn记录了最终选中的第一个按钮
		//ms_secondBtn记录了最终选中的第二个按钮
		LLKButton::ms_firstBtn = this;
		//将图片换成一张底色为红色的同类型的图片
		if(LLKSetting::main==1)
		{
			str.Format(_T("res\\%d.bmp"), (this->m_ID)+10);
			HBITMAP m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
			this->SetBitmap(m_fkBmp);
			this->ShowWindow(SW_SHOW);
		}
		if(LLKSetting::main==2)
		{
			str.Format(_T("res\\%d.bmp"), (this->m_ID)+110);
			HBITMAP m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
			this->SetBitmap(m_fkBmp);
			this->ShowWindow(SW_SHOW);
		}
		//点击按钮时的声音
		if(LLKSetting::music==1)
		{
			PlaySound(_T("res\\sel.wav"), NULL, SND_FILENAME | SND_ASYNC);
		}
		if(LLKSetting::music==2)
		{
			PlaySound(_T("res\\Audio.wav"), NULL, SND_FILENAME | SND_ASYNC);
		}
	}
	//第二个按钮是另外一种类型的按钮
	else if (LLKButton::ms_firstBtn->m_ID != this->m_ID)
	{
		if(LLKSetting::main==1)
		{
			str.Format(_T("res\\%d.bmp"), LLKButton::ms_firstBtn->m_ID);
			HBITMAP m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
			LLKButton::ms_firstBtn->SetBitmap(m_fkBmp);
			LLKButton::ms_firstBtn->ShowWindow(SW_SHOW);

			str.Format(_T("res\\%d.bmp"), (this->m_ID)+10);
			m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
			this->SetBitmap(m_fkBmp);
			this->ShowWindow(SW_SHOW);
		}
		if(LLKSetting::main==2)
		{
			str.Format(_T("res\\%d.bmp"), LLKButton::ms_firstBtn->m_ID+100);
			HBITMAP m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
			LLKButton::ms_firstBtn->SetBitmap(m_fkBmp);
			LLKButton::ms_firstBtn->ShowWindow(SW_SHOW);

			str.Format(_T("res\\%d.bmp"), (this->m_ID)+110);
			m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
			this->SetBitmap(m_fkBmp);
			this->ShowWindow(SW_SHOW);
		}
		if(LLKSetting::music==1)
		{
			PlaySound(_T("res\\sel.wav"), NULL, SND_FILENAME | SND_ASYNC);
		}
		if(LLKSetting::music==2)
		{
			PlaySound(_T("res\\Audio.wav"), NULL, SND_FILENAME | SND_ASYNC);
		}
		LLKButton::ms_firstBtn = this;
	}
	//取消选中的按钮
	else if (LLKButton::ms_firstBtn == this)
	{
		if(LLKSetting::main==1)
		{
			str.Format(_T("res\\%d.bmp"), LLKButton::ms_firstBtn->m_ID);
			HBITMAP m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
			LLKButton::ms_firstBtn->SetBitmap(m_fkBmp);
			LLKButton::ms_firstBtn->ShowWindow(SW_SHOW);
			LLKButton::ms_firstBtn = NULL;
		}
		if(LLKSetting::main==2)
		{
			str.Format(_T("res\\%d.bmp"), LLKButton::ms_firstBtn->m_ID+100);
			HBITMAP m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
			LLKButton::ms_firstBtn->SetBitmap(m_fkBmp);
			LLKButton::ms_firstBtn->ShowWindow(SW_SHOW);
			LLKButton::ms_firstBtn = NULL;
		}
		if(LLKSetting::music==1)
		{
			PlaySound(_T("res\\sel.wav"), NULL, SND_FILENAME | SND_ASYNC);
		}
		if(LLKSetting::music==2)
		{
			PlaySound(_T("res\\Audio.wav"), NULL, SND_FILENAME | SND_ASYNC);
		}
	}
	//两个按钮可连接
	else if(FindLine(ms_firstBtn->m_location, this->m_location)||
		FindOneConner(ms_firstBtn->m_location, this->m_location)||
		FindSide(ms_firstBtn->m_location, this->m_location)||
		FindTwoConner(ms_firstBtn->m_location, this->m_location))
	{
		//记录最终选中的第二个按钮
		ms_secondBtn = this;
		//隐藏按钮
		ms_firstBtn->ShowWindow(SW_HIDE);
		ms_secondBtn->ShowWindow(SW_HIDE);
		//更新窗口，来调用对话框的onpain（）画路径
		parent->UpdateWindow();
		//消除一对图片后，剩余时间和分数都增加
		parent->m_time += 5;
		parent->m_score += 10;
		//改变按钮类型和map的值为0
		ms_firstBtn->m_ID = 0;
		ms_secondBtn->m_ID = 0;
		/*parent->map[ms_firstBtn->m_location.x][ms_firstBtn->m_location.y] = 0;
		parent->map[ms_secondBtn->m_location.x][ms_secondBtn->m_location.y] = 0;*/
		for(int index=0;index<90;index++)
		{
			if(parent->G.V[index].x==ms_firstBtn->m_location.x&&parent->G.V[index].y==ms_firstBtn->m_location.y)
			{
				parent->G.V[index].pic=0;
			}
			if(parent->G.V[index].x==ms_secondBtn->m_location.x&&parent->G.V[index].y==ms_secondBtn->m_location.y)
			{
				parent->G.V[index].pic=0;
			}
		}
		Graph GG=readj(parent->G);
		parent->G=GG;
		ms_firstBtn = ms_secondBtn = NULL;
		if(LLKSetting::music==1)
		{
			PlaySound(_T("res\\elec.wav"), NULL, SND_FILENAME | SND_ASYNC);
		}
		if(LLKSetting::music==2)
		{
			PlaySound(_T("res\\shake.wav"), NULL, SND_FILENAME | SND_ASYNC);
		}
	}
	//两个同类型的按钮不可连接
	else
	{
		if(LLKSetting::main==1)
		{
			str.Format(_T("res\\%d.bmp"), LLKButton::ms_firstBtn->m_ID);
			HBITMAP m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
			LLKButton::ms_firstBtn->SetBitmap(m_fkBmp);
			LLKButton::ms_firstBtn->ShowWindow(SW_SHOW);

			str.Format(_T("res\\%d.bmp"), (this->m_ID)+10);
			m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
			this->SetBitmap(m_fkBmp);
			this->ShowWindow(SW_SHOW);
		}
		if(LLKSetting::main==2)
		{
			str.Format(_T("res\\%d.bmp"), LLKButton::ms_firstBtn->m_ID+100);
			HBITMAP m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
			LLKButton::ms_firstBtn->SetBitmap(m_fkBmp);
			LLKButton::ms_firstBtn->ShowWindow(SW_SHOW);

			str.Format(_T("res\\%d.bmp"), (this->m_ID)+110);
			m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
			this->SetBitmap(m_fkBmp);
			this->ShowWindow(SW_SHOW);
		}
		if(LLKSetting::music==1)
		{
			PlaySound(_T("res\\sel.wav"), NULL, SND_FILENAME | SND_ASYNC);
		}
		if(LLKSetting::music==2)
		{
			PlaySound(_T("res\\Audio.wav"), NULL, SND_FILENAME | SND_ASYNC);
		}
		LLKButton::ms_firstBtn = this;
	}
	CButton::OnLButtonDown(nFlags, point);
}

//更新邻接矩阵的函数
Graph LLKButton::readj(Graph G)
{
	for(int i=0;i<90;i++)
	{
		for(int j=0;j<90;j++)
		{
			//这张图的上下
			if((G.V[i].x==G.V[j].x)&&(G.V[i].y==G.V[j].y+1||G.V[i].y==G.V[j].y-1))
			{
				//两张中的一张是空的
				if(G.V[i].pic==0||G.V[j].pic==0)
				{
					G.adj[i][j]=G.adj[j][i]=1;
				}
				//两张图片相同
				else if(G.V[i].pic==G.V[j].pic)
				{
					G.adj[i][j]=G.adj[j][i]=1;
				}
			}
			//这张图的左右
			else if((G.V[i].y==G.V[j].y)&&(G.V[i].x==G.V[j].x+1||G.V[i].x==G.V[j].x-1))
			{
				//两张中的一张是空的
				if(G.V[i].pic==0||G.V[j].pic==0)
				{
					G.adj[i][j]=G.adj[j][i]=1;
				}
				//两张图片相同
				else if(G.V[i].pic==G.V[j].pic)
				{
					G.adj[i][j]=G.adj[j][i]=1;
				}
			}
		}
	}
	return G;
}

//寻找两点之间是否可以连线
BOOL LLKButton::findPath(CPoint p1, CPoint p2)
{
	int index1=0,index2=0;
	for(int index=0;index<90;index++)
	{
		if(parent->G.V[index].x==p1.x&&parent->G.V[index].y==p1.y)
		{
			index1=index;
		}
		if(parent->G.V[index].x==p2.x&&parent->G.V[index].y==p2.y)
		{
			index2=index;
		}
	}
	//根据邻接矩阵寻找v[index1]和v[index2]是否可以连通
	BOOL b=BFS(parent->G,index1,index2);
	if(b)
	{return true;}
	else
	{return false;}
}

//BFS
BOOL LLKButton::BFS(Graph G,int index1,int index2)
{
	std::queue<int> Q;
	bool visited[90];
	int nindex=0,windex=0;
	Q.push(index1);
	visited[index1]=true;
	while(!Q.empty())
	{
		nindex=Q.front();
		Q.pop();
		for(int i=0;i<90;i++)
		{
			if(parent->G.adj[i][nindex]==1)
			{
				windex=i;
				if(windex==index2)
				{
					return true;
				}
				if(!visited[windex])
				{
					Q.push(windex);
					visited[windex]=true;
				}
			}
		}
	}
	return false;
}

//两按钮在同一条直线上
BOOL LLKButton::FindLine(CPoint p1, CPoint p2)
{
	//LLKLevelModel *parent = (LLKLevelModel *)GetParent();
	int max, min;
	int i;
	//在同一列
	if( (p1.x) == (p2.x) )
	{
		max = (p1.y>p2.y)?p1.y:p2.y;
		min = (p1.y<p2.y)?p1.y:p2.y;
		if(max == min+1)  //相邻的两个格子
			return TRUE;
		for(i=min+1; i<max; i++)
		{
			/*if(parent->map[p1.x][i] != 0)
			return FALSE;*/
			for(int index=0;index<90;index++)
			{
				if(parent->G.V[index].x==p1.x&&parent->G.V[index].y==i&&parent->G.V[index].pic!=0)
				{
					return FALSE;
				}
			}
		}
		return TRUE;
	}
	//在同一行
	if( (p1.y) == (p2.y) )
	{
		max = (p1.x>p2.x)?p1.x:p2.x;
		min = (p1.x<p2.x)?p1.x:p2.x;
		if(max == min+1)
			return TRUE; //相邻的两个格子
		for(i=min+1; i<max; i++)
		{
			/*if(parent->map[i][p1.y] !=0)
			return FALSE;*/
			for(int index=0;index<90;index++)
			{
				if(parent->G.V[index].x==i&&parent->G.V[index].y==p1.y&&parent->G.V[index].pic!=0)
				{
					return FALSE;
				}
			}
		}
		return TRUE;
	}
	return FALSE;
}

//有一个拐点的路径
BOOL LLKButton::FindOneConner(CPoint p1, CPoint p2)
{
	int maxx, maxy, minx, miny;
	maxx = (p1.x>p2.x)?p1.x:p2.x;
	maxy = (p1.y>p2.y)?p1.y:p2.y;
	minx = (p1.x<p2.x)?p1.x:p2.x;
	miny = (p1.y<p2.y)?p1.y:p2.y;
	//4个点分别进行判断，看能否找到到两个目标点的直线路径
	for(int index=0;index<90;index++)
	{
		if(parent->G.V[index].x==minx&&parent->G.V[index].y==maxy&&parent->G.V[index].pic==0)
		{
			ms_ptCross1.x = minx;
			ms_ptCross1.y = maxy;
			if ((FindLine ( p1, ms_ptCross1)) && (FindLine(ms_ptCross1, p2)))
				return TRUE;
		}
	}
	for(int index=0;index<90;index++)
	{
		if(parent->G.V[index].x==maxx&&parent->G.V[index].y==miny&&parent->G.V[index].pic == 0)
		{
			ms_ptCross1.x = maxx;
			ms_ptCross1.y = miny;
			if ((FindLine (p1, ms_ptCross1)) && (FindLine
				(ms_ptCross1, p2)))
				return TRUE;
		}
	}
	for(int index=0;index<90;index++)
	{
		if(parent->G.V[index].x==minx&&parent->G.V[index].y==miny&&parent->G.V[index].pic== 0)
		{
			ms_ptCross1.x = minx;
			ms_ptCross1.y = miny;
			if ((FindLine (p1, ms_ptCross1)) && (FindLine
				(ms_ptCross1, p2)))
				return TRUE;
		}
	}
	for(int index=0;index<90;index++)
	{
		if(parent->G.V[index].x==maxx&&parent->G.V[index].y==maxy&&parent->G.V[index].pic == 0)
		{
			ms_ptCross1.x = maxx;
			ms_ptCross1.y = maxy;
			if ((FindLine (p1, ms_ptCross1)) && (FindLine
				(ms_ptCross1, p2)))
				return TRUE;
		}
	}
	return FALSE;
}

//这是两个拐点的一种特例，即拐两次回到同一行或同一列
BOOL LLKButton::FindSide(CPoint p1, CPoint p2)
{
	int max, min;
	int i;
	BOOL line=TRUE;
	BOOL col=TRUE;
	if( (p1.x) == (p2.x) )
	{
		max = (p1.y>p2.y)?p1.y:p2.y;
		min = (p1.y<p2.y)?p1.y:p2.y;
		for(i=min; i<=max; i++) //左侧
		{
			for(int index=0;index<90;index++)
			{
				if(parent->G.V[index].x==p1.x-1&&parent->G.V[index].y==i&&parent->G.V[index].pic !=0)
				{
					line=FALSE;
					break;
				}
			}
		}
		if(line)
		{
			ms_ptCross1.x = p1.x-1;
			ms_ptCross1.y = p1.y;
			ms_ptCross2.x = p1.x-1;
			ms_ptCross2.y = p2.y;
			return TRUE;
		}
		else
			line=TRUE;
		for(i=min; i<=max; i++)
		{
			for(int index=0;index<90;index++)
			{
				if(parent->G.V[index].x==p1.x+1&&parent->G.V[index].y==i&&parent->G.V[index].pic!=0) //右侧
				{
					line=FALSE;
					break;
				}
			}
		}
		if(line)
		{
			ms_ptCross1.x = p1.x+1;
			ms_ptCross1.y = p1.y;
			ms_ptCross2.x = p1.x+1;
			ms_ptCross2.y = p2.y;
			return TRUE;
		}
	}
	else
		line=FALSE;
	if( (p1.y) == (p2.y) )
	{
		max = (p1.x>p2.x)?p1.x:p2.x;
		min = (p1.x<p2.x)?p1.x:p2.x;
		for(i=min; i<=max; i++)
		{
			for(int index=0;index<90;index++)
			{
				if(parent->G.V[index].x==i&&parent->G.V[index].y==p1.y-1&&parent->G.V[index].pic!=0) //下侧
				{
					col=FALSE;
					break;
				}
			}
		}
		if(col)
		{
			ms_ptCross1.x = p1.x;
			ms_ptCross1.y = p1.y-1;
			ms_ptCross2.x = p2.x;
			ms_ptCross2.y = p2.y-1;
			return TRUE;
		}
		else
			col=TRUE;
		for(i=min; i<=max; i++)
		{
			for(int index=0;index<90;index++)
			{
				if(parent->G.V[index].x==i&&parent->G.V[index].y==p1.y+1&&parent->G.V[index].pic!=0) //上侧
				{
					col=FALSE;
					break;
				}
			}
		}
		if(col)
		{
			ms_ptCross1.x = p1.x;
			ms_ptCross1.y = p1.y+1;
			ms_ptCross2.x = p2.x;
			ms_ptCross2.y = p2.y+1;
			return TRUE;
		}
	}
	else
		col=FALSE;
	if(line || col)
		return TRUE;
	else
		return FALSE;
}

//两个拐点
BOOL LLKButton::FindTwoConner(CPoint p1, CPoint p2)
{
	//两个拐点必定有一个坐标相同，另一个坐标分别跟两个结点相同
	int i;
	CPoint tempPoint1 = 0;
	CPoint tempPoint2 = 0;
	//在两个目标结点的垂直线上寻找拐点
	for(i=0; i<MAXY; i++)
	{
		if(i == p1.y)
			continue;
		tempPoint1.x = p1.x;
		tempPoint1.y = i;
		ms_ptCross1 = tempPoint1;
		for(int index=0;index<90;index++)
		{
			if(parent->G.V[index].x==tempPoint1.x&&parent->G.V[index].y==tempPoint1.y&&parent->G.V[index].pic==0)
			{
				if(FindLine(tempPoint1, p1))
				{
					tempPoint2.x = p2.x;
					tempPoint2.y = tempPoint1.y;
					for(int index1=0;index1<90;index1++)
					{
						if(parent->G.V[index1].x==tempPoint2.x&&parent->G.V[index1].y==tempPoint2.y&&parent->G.V[index1].pic==0)
						{
							if(FindLine(tempPoint1,tempPoint2))
							{
								ms_ptCross2 = tempPoint2;
								if(FindLine(tempPoint2, p2))
									return TRUE;
							}
						}
					}
				}
			}
		}

	}
	//在两个目标结点的水平线上寻找拐点
	for(i=0; i<MAXX; i++)
	{
		if(i == p1.x)
			continue;
		tempPoint1.x = i;
		tempPoint1.y = p1.y;
		ms_ptCross1 = tempPoint1;
		for(int index=0;index<90;index++)
		{
			if(parent->G.V[index].x==tempPoint1.x&&parent->G.V[index].y==tempPoint1.y&&parent->G.V[index].pic==0 )
			{
				if(FindLine(tempPoint1, p1))
				{
					tempPoint2.x = tempPoint1.x;
					tempPoint2.y = p2.y;
					for(int index1=0;index1<90;index1++)
					{
						if(parent->G.V[index1].x==tempPoint2.x&&parent->G.V[index1].y==tempPoint2.y&&parent->G.V[index1].pic==0)
						{
							if(FindLine(tempPoint1,tempPoint2))
							{
								ms_ptCross2 = tempPoint2;
								if(FindLine(tempPoint2, p2))
									return TRUE;
							}
						}
					}
				}
			}
		}
	}
	return FALSE;
}


