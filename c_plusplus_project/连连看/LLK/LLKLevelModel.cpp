// LLKLevelModel.cpp : 实现文件
//

#include "stdafx.h"
#include "LLK.h"
#include "LLKDlg.h"
#include "LLKLevelModel.h"
#include "LLKButton.h"
#include "LLKAddDlg.h"
#include "LLKSetting.h"
#include "HelpDialog.h"
#include "afxdialogex.h"
#include "global.h"
#include <windows.h>
#include <mmsystem.h>

#define IDC_BLOCK 10000
int sig=0;
int stop_time=0;
Graph LLKLevelModel::G;
// LLKLevelModel 对话框

IMPLEMENT_DYNAMIC(LLKLevelModel, CDialogEx)

	LLKLevelModel::LLKLevelModel(CWnd* pParent /*=NULL*/)
	: CDialogEx(LLKLevelModel::IDD, pParent)
{

}

LLKLevelModel::~LLKLevelModel()
{
}

void LLKLevelModel::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_BUTTON_TOOL, tool);
}


BEGIN_MESSAGE_MAP(LLKLevelModel, CDialogEx)
	ON_BN_CLICKED(IDC_BUTTON_BEGIN, &LLKLevelModel::OnBnClickedButtonBegin)
	ON_WM_PAINT()
	ON_WM_TIMER()
	ON_BN_CLICKED(IDC_BUTTON_REARRAY, &LLKLevelModel::OnBnClickedButtonRearray)
	ON_BN_CLICKED(IDC_BUTTON_TIPS, &LLKLevelModel::OnBnClickedButtonTips)
	ON_BN_CLICKED(IDC_BUTTON_PAUSE, &LLKLevelModel::OnBnClickedButtonPause)
	ON_BN_CLICKED(IDC_BUTTON_HELP, &LLKLevelModel::OnBnClickedButtonHelp)
	ON_BN_CLICKED(IDC_BUTTON_TOOL, &LLKLevelModel::OnBnClickedButtonTool)
	ON_BN_CLICKED(IDC_BUTTON_SETTING, &LLKLevelModel::OnBnClickedButtonSetting)
END_MESSAGE_MAP()


// LLKLevelModel 消息处理程序


void LLKLevelModel::OnPaint()
{
	CPaintDC dc3(this);
	CWindowDC dc(this);
	CPen lPen(PS_SOLID, 2, RGB(255,255,255));
	//设置字体颜色
	dc.SelectObject(&lPen);
	//选择画笔
	CFont font;
	CString str;
	if(CLLKDlg::relaxFlag==0)
	{

		str.Format(_T("剩余时间: %3d 秒"),m_time);
		//m_time 中存储剩余时间信息
		font.CreatePointFont(100,_T("宋体"));
		//设置字体
		dc.SelectObject(&font);
		dc.SetTextColor(RGB(255,255,255));
		dc.SetBkColor(TRANSPARENT);
		dc.TextOut(40,100,str); //显示时间
	}
	//在休闲模式中显示积分
	if(CLLKDlg::relaxFlag==1)
	{
		CWindowDC dc4(this);
		CPen lPen1(PS_SOLID, 2, RGB(255,255,255));
		//设置字体颜色
		dc4.SelectObject(&lPen1);
		//选择画笔
		CFont font1;
		CString str1;
		str1.Format(_T("积分: %3d "),m_score);
		//m_time 中存储剩余时间信息
		font1.CreatePointFont(100,_T("宋体"));
		//设置字体
		dc4.SelectObject(&font1);
		dc4.SetTextColor(RGB(255,255,255));
		dc4.SetBkColor(TRANSPARENT);
		dc4.TextOut(657,483,str1); 
	}

	//显示关卡
	font.DeleteObject();
	font.CreatePointFont(200,_T("宋体"));
	dc.SelectObject(&font);
	dc.SetBkColor(TRANSPARENT);
	str.Format(_T("关卡：%d"),m_typeNum -1);
	dc.SetTextColor(RGB(255,255,255));
	dc.TextOut(320,90,str);

	CWindowDC dc2(this);
	CPen pen(PS_SOLID, 5, RGB(255,255,255));
	dc2.SelectObject(pen);
	//dc2.SetROP2(R2_NOT);//取反色
	//画出路径
	if (LLKButton::ms_firstBtn != NULL && LLKButton::ms_secondBtn != NULL)
	{
		//设置计时器，0.2秒后擦除路径线条
		SetTimer(2,100,NULL);
		pt1.x = LLKButton::ms_firstBtn->m_location.y * 50 + 125;
		pt1.y = LLKButton::ms_firstBtn->m_location.x * 50 + 150;
		pt2.x = LLKButton::ms_secondBtn->m_location.y * 50 + 125;
		pt2.y = LLKButton::ms_secondBtn->m_location.x * 50 + 150;
		pt3.x = LLKButton::ms_ptCross1.y * 50 + 125;
		pt3.y = LLKButton::ms_ptCross1.x * 50 + 150;
		pt4.x = LLKButton::ms_ptCross2.y * 50 + 125;
		pt4.y = LLKButton::ms_ptCross2.x * 50 + 150;

		//无拐点
		if (LLKButton::ms_ptCross1.x == -1)
		{
			dc2.MoveTo(pt1);
			dc2.LineTo(pt2);
		}
		//一个拐点
		else if (LLKButton::ms_ptCross2.x == -1)
		{
			dc2.MoveTo(pt1);
			dc2.LineTo(pt3);
			dc2.MoveTo(pt3);
			dc2.LineTo(pt2);
		}
		//两个拐点
		else
		{
			dc2.MoveTo(pt1);
			dc2.LineTo(pt3);
			dc2.MoveTo(pt3);
			dc2.LineTo(pt4);
			dc2.MoveTo(pt4);
			dc2.LineTo(pt2);
		}
	}
}

//初始化地图
void LLKLevelModel::InitMap(int  map[][MAXY])
{
	int i,j;
	int x,y;
	int type;
	int index=0;
	//随机数种子
	srand((unsigned int)time(NULL));
	//map值表示图片类型，0表示没有图片
	for(i=0;i<MAXX;i++)
	{
		for(j=0;j<MAXY;j++)
		{
			map[i][j]=0;
			G.V[index].x=i;
			G.V[index].y=j;
			G.V[index++].pic=0;
		}
	} 
	for(int i=0;i<90;i++)
	{
		for(int j=0;j<90;j++)
		{
			G.adj[i][j]=0;
		}
	}
	//map的最外层空出来，不放置图片,在graph.V中存放顶点信息
	for(i=1;i<MAXX-1;i++)
	{
		for(j=1;j<MAXY-1;j++)
		{
			int index=0;
			if(map[i][j] != 0)
				continue;
			else
			{
				//保证了图片成对出现
				type=rand() % m_typeNum;//图片种类
				map[i][j]=type+1;
				for(int aa=0;aa<90;aa++,index++)
				{
					if((G.V[index].x==i)&&(G.V[index].y==j))
					{
						G.V[index].pic=type+1;
					}
				}
				do
				{
					x = rand()%(MAXX-2)+1;
					y = rand()%(MAXY-2)+1;
				}
				while(map[x][y]);
				map[x][y]=type+1;
				int index=0;
				for(int aa=0;aa<90;aa++,index++)
				{
					if((G.V[index].x==x)&&(G.V[index].y==y))
					{
						G.V[index].pic=type+1;
					}
				}
			}
		}
	}
	//构造邻接矩阵，只有上下左右中同一张图片的值才为1
	for(i=0;i<90;i++)
	{
		for(j=0;j<90;j++)
		{
			if((G.V[i].x==G.V[j].x)&&(G.V[i].y==G.V[j].y+1||G.V[i].y==G.V[j].y-1))
			{
				if(G.V[i].pic==0||G.V[j].pic==0)
				{
					G.adj[i][j]=G.adj[j][i]=1;
				}
				else if(G.V[i].pic==G.V[j].pic)
				{
					G.adj[i][j]=G.adj[j][i]=1;
				}
			}
			else if((G.V[i].y==G.V[j].y)&&(G.V[i].x==G.V[j].x+1||G.V[i].x==G.V[j].x-1))
			{
				if(G.V[i].pic==0||G.V[j].pic==0)
				{
					G.adj[i][j]=G.adj[j][i]=1;
				}
				else if(G.V[i].pic==G.V[j].pic)
				{
					G.adj[i][j]=G.adj[j][i]=1;
				}
			}
		}
	} 
}

//根据map构造按钮
void LLKLevelModel::ShowMap(Graph G)
{
	int i, j;
	CPoint p;
	CString str = _T("");
	//清除原有按钮
	for(i=0; i<m_btnGroup.GetSize(); i++)
		delete (LLKButton *)m_btnGroup.GetAt(i);
	m_btnGroup.RemoveAll();
	//添加新按钮
	for(i=1; i<=MAXX-2; i++)
		for(j=1; j<=MAXY-2; j++)
		{
			p.x = i;
			p.y = j;
			for(int aa=0;aa<90;aa++)
			{
				if((G.V[aa].x==i)&&(G.V[aa].y==j))
				{
					//将按钮放入m_btnGroup指针数组中
					m_btnGroup.Add(new LLKButton(G.V[aa].pic, p));
				}
			}	
		}
		//显示按钮
		for(i=0; i<(MAXX-2)*(MAXY-2); i++)
		{
			LLKButton *btn = (LLKButton *)m_btnGroup.GetAt(i);
			//构造按钮的大小和位置
			btn->Create(str, WS_CHILD|BS_BITMAP|WS_VISIBLE,
				CRect(150+(i%(MAXY-2))*50, 150+(i/(MAXY-2))*50,
				200 +(i%(MAXY -2))*50, 200 +(i/(MAXY -2))*50), this,
				IDC_BLOCK+i);

			if(btn->m_ID)//如果为0则不显示
			{
				//尽量用绝对路径
				if(LLKSetting::main==1)
				{
					str.Format(_T("res\\%d.bmp"), btn->m_ID);
					HBITMAP m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
					//加载图片
					if(m_fkBmp == NULL)
						if (MessageBox (_T(" 缺 少 图 片 资 源! "), _T(" 错 误"),MB_ICONERROR|MB_OK) == IDOK)
						{
							CDialog::OnCancel();
							return;
						}
						btn->SetBitmap(m_fkBmp);
						btn->ShowWindow(SW_SHOW);
				}
				else
				{
					str.Format(_T("res\\%d.bmp"), btn->m_ID+100);
					HBITMAP m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
					//加载图片
					if(m_fkBmp == NULL)
						if (MessageBox (_T(" 缺 少 图 片 资 源! "), _T(" 错 误"),MB_ICONERROR|MB_OK) == IDOK)
						{
							CDialog::OnCancel();
							return;
						}
						btn->SetBitmap(m_fkBmp);
						btn->ShowWindow(SW_SHOW);
				}

			}
			else
				btn->ShowWindow(SW_HIDE);

		}
}

void LLKLevelModel::OnBnClickedButtonBegin()
{
	// TODO: 在此添加控件通知处理程序代码
	if(CLLKDlg::relaxFlag==0)
	{m_time = 30;}
	else if(CLLKDlg::relaxFlag==1||CLLKDlg::relaxFlag==2)
	{m_time = 65535;}
	m_typeNum = 2;
	m_score = 0;
	//设置计时器，每一秒钟发送一次信号
	SetTimer(1,1000,NULL);
	InitMap(map);
	ShowMap(G);
}

//收到时间信号后的响应函数
void LLKLevelModel::OnTimer(UINT_PTR nIDEvent)
{
	// TODO: Add your message handler code here and/or call default

	//nIDEvent为2的时间信号，即擦除路径信号
	if (nIDEvent == 2)
	{
		{
			CWindowDC dc2(this);
			//用背景色将路径再画一次
			CPen pen(PS_SOLID, 5,RGB(205,205,155));
			dc2.SelectObject(pen);
			//dc2.SetROP2(R2_NOT);
			//无拐点
			if (LLKButton::ms_ptCross1.x == -1)
			{

				dc2.MoveTo(pt1);
				dc2.LineTo(pt2);
				SetTimer(2,100,NULL);
			}
			//一个拐点
			else if (LLKButton::ms_ptCross2.x == -1)
			{
				dc2.MoveTo(pt1);
				dc2.LineTo(pt3);
				dc2.MoveTo(pt3);
				dc2.LineTo(pt2);
			}
			//两个拐点
			else
			{

				dc2.MoveTo(pt1);
				dc2.LineTo(pt3);
				dc2.MoveTo(pt3);
				dc2.LineTo(pt4);
				dc2.MoveTo(pt4);
				dc2.LineTo(pt2);
			}
		}
		CDialogEx::OnTimer(nIDEvent);
		//关闭该计时器
		KillTimer(2);
	}

	//nIDEvent为1的时间信号，即改变剩余时间的信号
	else
	{
		m_time--;
		//调用重画函数
		this->OnPaint();
		//判断是否通关了
		IsWin();	
	}
}

//是否通关了
BOOL LLKLevelModel::IsWin(void)
{
	//时间结束，没有过关
	if (m_time == 0)
	{
		KillTimer(1);
		MessageBox(_T("Game Over !"),_T("时间结束"));
		m_time = 30;
		//清除桌面的按钮
		for(int i=0; i<m_btnGroup.GetSize(); i++)
			delete (LLKButton *)m_btnGroup.GetAt(i);
		m_btnGroup.RemoveAll();
		//记录分数
		LLKAddDlg addData;
		addData.DoModal();
		return FALSE;
	}

	/*for (int i = 0; i < MAXX; i++)
		for (int j = 0; j < MAXY; j++)
		{
			if(map[i][j] != 0)
				return FALSE;
		}*/
	for(int i=0;i<90;i++)
	{
		if(G.V[i].pic!=0)
			return FALSE;
	}
		//过关后停止计时
		KillTimer(1);
		//如果全部通关
		//if (m_typeNum == 9)
		if(m_typeNum==2)
		{
			MessageBox(_T("恭喜你，已经全部通关"),_T("胜利"));
			m_score += m_typeNum * 100 + m_time;
			for(int i=0; i<m_btnGroup.GetSize(); i++)
				delete (LLKButton *)m_btnGroup.GetAt(i);
			m_btnGroup.RemoveAll();
			this->ShowWindow(SW_HIDE);
			LLKAddDlg addData;
			addData.DoModal();
			this->ShowWindow(SW_SHOW);
			return TRUE;
		}
		//还未全部通关
		else
		{
			MessageBox(_T("进入下一关"),_T("胜利"));
			m_score += m_typeNum * 100 + m_time;
			//增加一关后，m_typeNum加1，使难度增大
			m_typeNum++;
			//重新设置计时器并初始化地图
			SetTimer(1,1000,NULL);
			InitMap(map);
			ShowMap(G);
			m_time = 30;
			return FALSE;
		}

}


void LLKLevelModel::OnBnClickedButtonRearray()
{
	// TODO: 在此添加控件通知处理程序代码
	//没有按钮时，无法重排
	if (m_btnGroup.GetSize() == 0)
	{
		MessageBox(_T("没有能重排的按钮！"),_T("警告"));
		return;
	}
	//交换map中两个非0位置的值，即交换两个按钮
	srand((unsigned)time(NULL));
	int x1,y1,x2,y2,temp,index1=0,index2=0;
	//交换100次
	for (int i = 0; i < 100; ++i)
	{
		x1 = rand() % (MAXX-2) + 1;
		y1 = rand() % (MAXY-2) + 1;
		/*while(map[x1][y1] == 0)
		{
		x1 = rand() % (MAXX-2) + 1;
		y1 = rand() % (MAXY-2) + 1;
		}*/
flag1:
		for(int index=0;index<90;index++)
		{
			if(G.V[index].x==x1&&G.V[index].y==y1)
			{
				while(G.V[index].pic==0)
				{
					x1 = rand() % (MAXX-2) + 1;
					y1 = rand() % (MAXY-2) + 1;
					goto flag1;
				} 
				index1=index;
			}
		}
		x2 = rand() % (MAXX-2) + 1;
		y2 = rand() % (MAXY-2) + 1;
		/*while(map[x2][y2] == 0)
		{
			x2 = rand() % (MAXX-2) + 1;
			y2 = rand() % (MAXY-2) + 1;
		}*/
flag2:
		for(int index=0;index<90;index++)
		{
			if(G.V[index].x==x2&&G.V[index].y==y2)
			{
				while(G.V[index].pic==0)
				{
					x2 = rand() % (MAXX-2) + 1;
					y2 = rand() % (MAXY-2) + 1;
					goto flag2;
				}
				index2=index;
			}
		}
		/*temp = map[x1][y1];
		map[x1][y1] = map[x2][y2];
		map[x2][y2] = temp;*/
		temp=G.V[index1].pic;
		G.V[index1].pic=G.V[index1].pic;
		G.V[index2].pic=temp;
	}

	//根据新的map重画按钮
	ShowMap(G);
}


void LLKLevelModel::OnBnClickedButtonTips()
{
	// TODO: 在此添加控件通知处理程序代码
	m_score-=10;
	LLKButton *pBtn1;
	LLKButton *pBtn2;
	CString str;
	//最直接的办法，用两个指针遍历所有按钮
	for (int i = 0; i < m_btnGroup.GetSize(); ++i)
	{
		for (int j = i+1; j < m_btnGroup.GetSize(); ++j)
		{
			pBtn1 = (LLKButton*)m_btnGroup.GetAt(i);
			pBtn2 = (LLKButton*)m_btnGroup.GetAt(j);
			if (pBtn1->m_ID != 0 && pBtn1->m_ID == pBtn2->m_ID)
			{
				if( pBtn1->findPath(pBtn1->m_location, pBtn2->m_location))
				{
					//找到按钮后，标识出来
					if(LLKSetting::main==1)
					{
						str.Format(_T("res\\%d.bmp"), (pBtn1->m_ID)+10);
						HBITMAP m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
						pBtn1->SetBitmap(m_fkBmp);
						pBtn1->ShowWindow(SW_SHOW);

						str.Format(_T("res\\%d.bmp"), (pBtn2->m_ID)+10);
						m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
						pBtn2->SetBitmap(m_fkBmp);
						pBtn2->ShowWindow(SW_SHOW);
					}
					if(LLKSetting::main==2)
					{
						str.Format(_T("res\\%d.bmp"), (pBtn1->m_ID)+110);
						HBITMAP m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
						pBtn1->SetBitmap(m_fkBmp);
						pBtn1->ShowWindow(SW_SHOW);

						str.Format(_T("res\\%d.bmp"), (pBtn2->m_ID)+110);
						m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
						pBtn2->SetBitmap(m_fkBmp);
						pBtn2->ShowWindow(SW_SHOW);
					}
					return;
				}
			}
		}
	}
	MessageBox(_T("没有可以连接的图片！"),_T("警告"));
}


void LLKLevelModel::OnBnClickedButtonPause()
{
	// TODO: 在此添加控件通知处理程序代码
	sig++;
	if(sig%2!=0)
	{
		stop_time=m_time;
		KillTimer(1);
		SetDlgItemText(IDC_BUTTON_PAUSE,_T("继续游戏"));
		//设置所有内容不能动
		GetDlgItem(IDC_BUTTON_PAUSE)->EnableWindow(TRUE);
		GetDlgItem(IDC_BUTTON_SETTING)->EnableWindow(FALSE);
		GetDlgItem(IDC_BUTTON_HELP)->EnableWindow(FALSE);
		GetDlgItem(IDC_BUTTON_REARRAY)->EnableWindow(FALSE);
		GetDlgItem(IDC_BUTTON_TIPS)->EnableWindow(FALSE);
		GetDlgItem(IDC_BUTTON_BEGIN)->EnableWindow(FALSE);
		for(int i=0;i<56;i++)
		{
			GetDlgItem(IDC_BLOCK+i)->EnableWindow(FALSE);
		}
	}
	else
	{
		SetTimer(1,1000,NULL);
		m_time = stop_time;
		SetDlgItemText(IDC_BUTTON_PAUSE,_T("暂停游戏"));
		GetDlgItem(IDC_BUTTON_SETTING)->EnableWindow(TRUE);
		GetDlgItem(IDC_BUTTON_HELP)->EnableWindow(TRUE);
		GetDlgItem(IDC_BUTTON_REARRAY)->EnableWindow(TRUE);
		GetDlgItem(IDC_BUTTON_TIPS)->EnableWindow(TRUE);
		GetDlgItem(IDC_BUTTON_BEGIN)->EnableWindow(TRUE);
		for(int i=0;i<56;i++)
		{
			GetDlgItem(IDC_BLOCK+i)->EnableWindow(TRUE);
		}
	}

}


void LLKLevelModel::OnBnClickedButtonHelp()
{
	// TODO: 在此添加控件通知处理程序代码
	stop_time=m_time;
	KillTimer(1);
	CHelpDialog help;
	help.DoModal();
	while(IsWindow(help))
	{}
	SetTimer(1,1000,NULL);
	m_time = stop_time;
}


BOOL LLKLevelModel::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  在此添加额外的初始化
	if(CLLKDlg::relaxFlag==1)
	{
		tool.ShowWindow(TRUE);
	}
	return TRUE;  // return TRUE unless you set the focus to a control
	// 异常: OCX 属性页应返回 FALSE
}


void LLKLevelModel::OnBnClickedButtonTool()
{
	// TODO: 在此添加控件通知处理程序代码
	if(m_score>=10)
	{
		m_score-=20;
		LLKButton *pBtn1;
		LLKButton *pBtn2;
		CString str;
		//最直接的办法，用两个指针遍历所有按钮
		for (int i = 0; i < m_btnGroup.GetSize(); ++i)
		{
			for (int j = i+1; j < m_btnGroup.GetSize(); ++j)
			{
				pBtn1 = (LLKButton*)m_btnGroup.GetAt(i);
				pBtn2 = (LLKButton*)m_btnGroup.GetAt(j);
				if (pBtn1->m_ID != 0 && pBtn1->m_ID == pBtn2->m_ID)
				{
					if( pBtn1->findPath(pBtn1->m_location, pBtn2->m_location))
					{
						//找到按钮后，标识出来
						//隐藏按钮
						pBtn1->ShowWindow(SW_HIDE);
						pBtn2->ShowWindow(SW_HIDE);
						//更新窗口，来调用对话框的onpain（）画路径
						UpdateWindow();
						//消除一对图片后，剩余时间和分数都增加
						m_time += 5;
						m_score += 10;
						//改变按钮类型和map的值为0
						pBtn1->m_ID = 0;
						pBtn2->m_ID = 0;
						/*map[pBtn1->m_location.x][pBtn1->m_location.y] = 0;
						map[pBtn2->m_location.x][pBtn2->m_location.y] = 0;*/
						for(int index=0;index<90;index++)
						{
							if(G.V[index].x==pBtn1->m_location.x&&G.V[index].y==pBtn1->m_location.y)
							{
								G.V[index].pic=0;
							}
						}
						for(int index=0;index<90;index++)
						{
							if(G.V[index].x==pBtn2->m_location.x&&G.V[index].y==pBtn2->m_location.y)
							{
								G.V[index].pic=0;
							}
						}

						pBtn1 = pBtn2 = NULL;
						if(LLKSetting::music==1)
						{
							PlaySound(_T("res\\elec.wav"), NULL, SND_FILENAME | SND_ASYNC);
						}
						if(LLKSetting::music==2)
						{
							PlaySound(_T("res\\shake.wav"), NULL, SND_FILENAME | SND_ASYNC);
						}
						return;
					}
				}
			}
		}
		MessageBox(_T("没有可以连接的图片！"),_T("警告"));
	}
	else
	{
		MessageBox(_T("您剩余的积分不够使用道具！"),_T("警告"));
	}
}


void LLKLevelModel::OnBnClickedButtonSetting()
{
	// TODO: 在此添加控件通知处理程序代码
	stop_time=m_time;
	KillTimer(1);
	LLKSetting setting;
	setting.DoModal();
	while(IsWindow(setting))
	{}
	SetTimer(1,1000,NULL);
	m_time = stop_time;
}
