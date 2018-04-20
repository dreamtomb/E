
// LLKanDlg.cpp : implementation file
//

#include "stdafx.h"
#include "LLKan.h"
#include "LLKanDlg.h"
#include "afxdialogex.h"
#include "LLKanButton.h"
#include "LLKAddDlg.h"
#include "LLKRecordDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

#define IDC_BLOCK 10000

// CAboutDlg dialog used for App About

class CAboutDlg : public CDialogEx
{
public:
	CAboutDlg();

// Dialog Data
	enum { IDD = IDD_ABOUTBOX };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support

// Implementation
protected:
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialogEx(CAboutDlg::IDD)
{
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialogEx)
END_MESSAGE_MAP()


// CLLKanDlg dialog




CLLKanDlg::CLLKanDlg(CWnd* pParent /*=NULL*/)
	: CDialogEx(CLLKanDlg::IDD, pParent)
	, m_time(0)
	, pt1(0)
	, pt2(0)
	, pt3(0)
	, pt4(0)
	, m_score(0)
{
	memset(map,0,sizeof(map));
	m_time = 30;
	m_typeNum = 2;
	m_score = 0;
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CLLKanDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	//DDX_Control(pDX, IDC_LINE);
}

BEGIN_MESSAGE_MAP(CLLKanDlg, CDialogEx)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_START, &CLLKanDlg::OnBnClickedStart)
	ON_WM_CTLCOLOR()
/*	ON_STN_CLICKED(IDC_LINE, &CLLKanDlg::OnStnClickedLine)*/
//ON_STN_CLICKED(IDC_LINE, &CLLKanDlg::OnStnClickedLine)
ON_BN_CLICKED(IDOK, &CLLKanDlg::OnBnClickedOk)
ON_WM_TIMER()
ON_BN_CLICKED(IDCANCEL, &CLLKanDlg::OnBnClickedCancel)
ON_BN_CLICKED(IDC_SWAP, &CLLKanDlg::OnBnSwap)
ON_BN_CLICKED(IDC_TIPS, &CLLKanDlg::OnBnTips)
ON_BN_CLICKED(IDC_RECORD, &CLLKanDlg::OnBnRecord)
END_MESSAGE_MAP()


// CLLKanDlg message handlers

BOOL CLLKanDlg::OnInitDialog()
{
	//初始化对话框大小
	CDialogEx::OnInitDialog();
	SetWindowPos(NULL,100,100,750,500,
		SWP_DRAWFRAME | SWP_SHOWWINDOW |
		SWP_NOZORDER);
	// Add "About..." menu item to system menu.

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		BOOL bNameValid;
		CString strAboutMenu;
		bNameValid = strAboutMenu.LoadString(IDS_ABOUTBOX);
		ASSERT(bNameValid);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon

	// TODO: Add extra initialization here
	//m_line.SetWindowPos(&wndTopMost,0,0,750,500,SWP_DRAWFRAME | SWP_SHOWWINDOW | SWP_NOZORDER);

	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CLLKanDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialogEx::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

//在重画函数中添加时间信息，关卡信息 和 路径线条
//通过窗口重绘，来画路径和改变时间
void CLLKanDlg::OnPaint()
{
	CPaintDC dc3(this);

	CWindowDC dc(this);
	CPen lPen(PS_SOLID, 2, RGB(222,211,140));
	//设置字体颜色
	dc.SelectObject(&lPen);
	//选择画笔
	CFont font;
	CString str;
	str.Format(_T("剩余时间: %3d 秒"),m_time);
	//m_time 中存储剩余时间信息
	font.CreatePointFont(100,_T("宋体"));
	//设置字体
	dc.SelectObject(&font);
	dc.SetTextColor(RGB(222,211,140));
	dc.SetBkColor(TRANSPARENT);
	dc.TextOut(10,40,str); //显示时间

	//显示关卡
	font.DeleteObject();
	font.CreatePointFont(200,_T("宋体"));
	dc.SelectObject(&font);
	dc.SetBkColor(RGB(201,186,131));
	str.Format(_T("关卡：%d"),m_typeNum -1);
	dc.SetTextColor(RGB(255,255,255));
	dc.TextOut(610,35,str);

	CWindowDC dc2(this);
	CPen pen(PS_SOLID, 5, RGB(161,23,21));
 	dc2.SelectObject(pen);

	//画出路径
	if (CLLKanButton::ms_firstBtn != NULL && CLLKanButton::ms_secondBtn != NULL)
	{
		//设置计时器，0.2秒后擦除路径线条
		SetTimer(2,100,NULL);
		pt1.x = CLLKanButton::ms_firstBtn->m_location.y * 50 + 45;
		pt1.y = CLLKanButton::ms_firstBtn->m_location.x * 50 + 70;
		pt2.x = CLLKanButton::ms_secondBtn->m_location.y * 50 + 45;
		pt2.y = CLLKanButton::ms_secondBtn->m_location.x * 50 + 70;
		pt3.x = CLLKanButton::ms_ptCross1.y * 50 + 45;
		pt3.y = CLLKanButton::ms_ptCross1.x * 50 + 70;
		pt4.x = CLLKanButton::ms_ptCross2.y * 50 + 45;
		pt4.y = CLLKanButton::ms_ptCross2.x * 50 + 70;

		//无拐点
		if (CLLKanButton::ms_ptCross1.x == -1)
		{
			dc2.MoveTo(pt1);
			dc2.LineTo(pt2);
		}
		//一个拐点
		else if (CLLKanButton::ms_ptCross2.x == -1)
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

// The system calls this function to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CLLKanDlg::OnQueryDragIcon()
{
	return static_cast<HCURSOR>(m_hIcon);
}

//初始化地图
void CLLKanDlg::InitMap(int  map[][MAXY])
{
	int i,j;
	int x,y;
	int type;
	//随机数种子
	srand((unsigned int)time(NULL));
	//map值表示图片类型，0表示没有图片
	for(i=0;i<MAXX;i++)
	{
		for(j=0;j<MAXY;j++)
		{
			map[i][j]=0;
		}
	} 
	//map的最外层空出来，不放置图片
	for(i=1;i<MAXX-1;i++)
	{
		for(j=1;j<MAXY-1;j++)
		{
			if(map[i][j] != 0)
				continue;
			else
			{
				//保证了图片成对出现
				type=rand() % m_typeNum;//图片种类
				map[i][j]=type+1;
				do
				{
					x = rand()%(MAXX-2)+1;
					y = rand()%(MAXY-2)+1;
				}
				while(map[x][y]);
				map[x][y]=type+1;
			}
		}
	}
}

//根据map构造按钮
void CLLKanDlg::ShowMap(int  map[][MAXY])
{
	int i, j;
	CPoint p;
	CString str = _T("");
	//清除原有按钮
	for(i=0; i<m_btnGroup.GetSize(); i++)
		delete (CLLKanButton *)m_btnGroup.GetAt(i);
	m_btnGroup.RemoveAll();
	//添加新按钮
	for(i=1; i<=MAXX-2; i++)
		for(j=1; j<=MAXY-2; j++)
		{
			p.x = i;
			p.y = j;
			//将按钮放入m_btnGroup指针数组中
			m_btnGroup.Add(new CLLKanButton(map[i][j], p));
		}
		//显示按钮
		for(i=0; i<(MAXX-2)*(MAXY-2); i++)
		{
			CLLKanButton *btn = (CLLKanButton *)m_btnGroup.GetAt(i);
			//构造按钮的大小和位置
			btn->Create(str, WS_CHILD|BS_BITMAP|WS_VISIBLE,
				CRect(70+(i%(MAXY-2))*50, 70+(i/(MAXY-2))*50,
				120 +(i%(MAXY -2))*50, 120 +(i/(MAXY -2))*50), this,
				IDC_BLOCK+i);

			if(btn->m_ID)//如果为0则不显示
			{
				//尽量用绝对路径
				str.Format(_T("res\\%d.bmp"), btn->m_ID);
				HBITMAP m_fkBmp = (HBITMAP)::LoadImage
					(AfxGetInstanceHandle(),
					str, IMAGE_BITMAP, 0, 0,
					LR_CREATEDIBSECTION|LR_LOADFROMFILE);
				//加载图片
				if(m_fkBmp == NULL)
					if (MessageBox (_T(" 缺 少 图 片 资 源! "), _T(" 错 误"),
						MB_ICONERROR|MB_OK) == IDOK)
					{
						CDialog::OnCancel();
						return;
					}
				btn->SetBitmap(m_fkBmp);
				btn->ShowWindow(SW_SHOW);
			}
			else
				btn->ShowWindow(SW_HIDE);
			
		}
}

//开始新游戏
void CLLKanDlg::OnBnClickedStart()
{
	// TODO: Add your control notification handler code here
	//this->ShowWindow(SW_HIDE);
	//GetDlgItem(IDC_START)->ShowWindow(SW_HIDE);
	m_time = 30;
	m_typeNum = 2;
	m_score = 0;
	//设置计时器，每一秒钟发送一次信号
	SetTimer(1,1000,NULL);
	InitMap(map);
	ShowMap(map);
	
}

//改变窗口背景色
HBRUSH CLLKanDlg::OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor)
{

	// TODO:  Change any attributes of the DC here
	if (nCtlColor == CTLCOLOR_DLG) {
		pDC->SetBkColor(RGB(255, 0, 0));    // red
	HBRUSH B = CreateSolidBrush(RGB(201,186,131));
	//创建画刷
	return (HBRUSH) B; //返回画刷句柄
	}
	return CDialog::OnCtlColor(pDC, pWnd, nCtlColor);
	// TODO:  Return a different brush if the default is not desired
}


//void CLLKanDlg::OnStnClickedLine()
//{
//	// TODO: Add your control notification handler code here
//}


void CLLKanDlg::OnStnClickedLine()
{
	// TODO: Add your control notification handler code here
}


void CLLKanDlg::OnBnClickedOk()
{
	// TODO: Add your control notification handler code here
	/*CDialogEx::OnOK();*/
}


//收到时间信号后的响应函数
void CLLKanDlg::OnTimer(UINT_PTR nIDEvent)
{
	// TODO: Add your message handler code here and/or call default

	//nIDEvent为2的时间信号，即擦除路径信号
	if (nIDEvent == 2)
	{
		{
			CWindowDC dc2(this);
			//用背景色将路径再画一次
			CPen pen(PS_SOLID, 5,RGB(201,186,131));
			dc2.SelectObject(pen);
			//无拐点
			if (CLLKanButton::ms_ptCross1.x == -1)
			{
				dc2.MoveTo(pt1);
				dc2.LineTo(pt2);
				SetTimer(2,100,NULL);
			}
			//一个拐点
			else if (CLLKanButton::ms_ptCross2.x == -1)
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


void CLLKanDlg::OnBnClickedCancel()
{
	// TODO: Add your control notification handler code here
	CDialogEx::OnCancel();
}

//是否通关了
BOOL CLLKanDlg::IsWin(void)
{
	//时间结束，没有过关
	if (m_time == 0)
	{
		KillTimer(1);
		MessageBox(_T("Game Over !"),_T("时间结束"));
		m_time = 30;
		//清除桌面的按钮
		for(int i=0; i<m_btnGroup.GetSize(); i++)
			delete (CLLKanButton *)m_btnGroup.GetAt(i);
		m_btnGroup.RemoveAll();
		//记录分数
		CLLKAddDlg addData;
		addData.DoModal();
		return FALSE;
	}

	for (int i = 0; i < MAXX; i++)
		for (int j = 0; j < MAXY; j++)
		{
			if(map[i][j] != 0)
				return FALSE;
		}
	//过关后停止计时
	KillTimer(1);
	//如果全部通关
	if (m_typeNum == 10)
	{
		MessageBox(_T("恭喜你，已经全部通关"),_T("胜利"));
		m_score += m_typeNum * 100 + m_time;
		for(int i=0; i<m_btnGroup.GetSize(); i++)
			delete (CLLKanButton *)m_btnGroup.GetAt(i);
		m_btnGroup.RemoveAll();

		CLLKAddDlg addData;
		addData.DoModal();
	}
	//还未全部通关
	else
		MessageBox(_T("进入下一关"),_T("胜利"));
	m_score += m_typeNum * 100 + m_time;
	//增加一关后，m_typeNum加1，使难度增大
	m_typeNum++;
	//重新设置计时器并初始化地图
	SetTimer(1,1000,NULL);
	InitMap(map);
	ShowMap(map);
	m_time = 30;
	return TRUE;
}

//地图重新排序
void CLLKanDlg::OnBnSwap()
{
	// TODO: Add your control notification handler code here
	//没有按钮时，无法重排
	if (m_btnGroup.GetSize() == 0)
	{
		MessageBox(_T("没有能重排的图片！"),_T("警告"));
		return;
	}
	//交换map中两个非0位置的值，即交换两个按钮
	srand((unsigned)time(NULL));
	int x1,y1,x2,y2,temp;
	//这里交换了100次，当然可以随便设置
	for (int i = 0; i < 100; ++i)
	{
		x1 = rand() % (MAXX-2) + 1;
 		y1 = rand() % (MAXY-2) + 1;
		while(map[x1][y1] == 0)
		{
			x1 = rand() % (MAXX-2) + 1;
			y1 = rand() % (MAXY-2) + 1;
		}
		x2 = rand() % (MAXX-2) + 1;
		y2 = rand() % (MAXY-2) + 1;
		while(map[x2][y2] == 0)
		{
			x2 = rand() % (MAXX-2) + 1;
			y2 = rand() % (MAXY-2) + 1;
		}

		temp = map[x1][y1];
		map[x1][y1] = map[x2][y2];
		map[x2][y2] = temp;
	}

	//根据新的map重画按钮
	ShowMap(map);
}

//提示一对可消的按钮
void CLLKanDlg::OnBnTips()
{
	// TODO: Add your control notification handler code here
	CLLKanButton *pBtn1;
	CLLKanButton *pBtn2;
	CString str;
	//最直接的办法，用两个指针遍历所有按钮
	for (int i = 0; i < m_btnGroup.GetSize(); ++i)
		for (int j = i+1; j < m_btnGroup.GetSize(); ++j)
		{
			pBtn1 = (CLLKanButton*)m_btnGroup.GetAt(i);
			pBtn2 = (CLLKanButton*)m_btnGroup.GetAt(j);
			if (pBtn1->m_ID != 0 && pBtn1->m_ID == pBtn2->m_ID)
			{
				if( pBtn1->FindLine(pBtn1->m_location, pBtn2->m_location)||
					pBtn1->FindOneConner(pBtn1->m_location, pBtn2->m_location)||
					pBtn1->FindSide(pBtn1->m_location, pBtn2->m_location)||
					pBtn1->FindTwoConner(pBtn1->m_location, pBtn2->m_location))
				{
					//找到按钮后，标识出来
					str.Format(_T("res\\%d.bmp"), (pBtn1->m_ID)+100);
					HBITMAP m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
					pBtn1->SetBitmap(m_fkBmp);
					pBtn1->ShowWindow(SW_SHOW);

					str.Format(_T("res\\%d.bmp"), (pBtn2->m_ID)+100);
					m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
					pBtn2->SetBitmap(m_fkBmp);
					pBtn2->ShowWindow(SW_SHOW);
					
					return;
				}
			}
		}
	MessageBox(_T("没有可以连接的图片！"),_T("警告"));

}

//查看高分记录
void CLLKanDlg::OnBnRecord()
{
	CLLKRecordDlg recordDlg;
	recordDlg.DoModal();
	// TODO: Add your control notification handler code here
}
