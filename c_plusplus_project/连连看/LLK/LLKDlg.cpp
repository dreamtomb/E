
// LLKDlg.cpp : 实现文件
//

#include "stdafx.h"
#include "LLK.h"
#include "LLKDlg.h"
#include "LLKLevelModel.h"
#include "LLKRecordDlg.h"
#include "LLKSetting.h"
#include "HelpDialog.h"
#include "afxdialogex.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

// 用于应用程序“关于”菜单项的 CAboutDlg 对话框

class CAboutDlg : public CDialogEx
{
public:
	CAboutDlg();

// 对话框数据
	enum { IDD = IDD_ABOUTBOX };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持

// 实现
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


// CLLKDlg 对话框



int CLLKDlg::relaxFlag=0;
CLLKDlg::CLLKDlg(CWnd* pParent /*=NULL*/)
	: CDialogEx(CLLKDlg::IDD, pParent)
{
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CLLKDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CLLKDlg, CDialogEx)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()

	ON_BN_CLICKED(IDC_BUTTON_LEVEL, &CLLKDlg::OnBnClickedButtonLevel)
	ON_BN_CLICKED(IDC_BUTTON_BASIC, &CLLKDlg::OnBnClickedButtonBasic)
	ON_BN_CLICKED(IDC_BUTTON_RELAX, &CLLKDlg::OnBnClickedButtonRelax)
	ON_BN_CLICKED(IDC_BUTTON_RANK, &CLLKDlg::OnBnClickedButtonRank)
	ON_BN_CLICKED(IDC_BUTTON_SETTING, &CLLKDlg::OnBnClickedButtonSetting)
	ON_BN_CLICKED(IDC_BUTTON_HELP, &CLLKDlg::OnBnClickedButtonHelp)
END_MESSAGE_MAP()


// CLLKDlg 消息处理程序

BOOL CLLKDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// 将“关于...”菜单项添加到系统菜单中。

	// IDM_ABOUTBOX 必须在系统命令范围内。
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

	// 设置此对话框的图标。当应用程序主窗口不是对话框时，框架将自动
	//  执行此操作
	SetIcon(m_hIcon, TRUE);			// 设置大图标
	SetIcon(m_hIcon, FALSE);		// 设置小图标

	// TODO: 在此添加额外的初始化代码

	return TRUE;  // 除非将焦点设置到控件，否则返回 TRUE
}

void CLLKDlg::OnSysCommand(UINT nID, LPARAM lParam)
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

// 如果向对话框添加最小化按钮，则需要下面的代码
//  来绘制该图标。对于使用文档/视图模型的 MFC 应用程序，
//  这将由框架自动完成。

void CLLKDlg::OnPaint()
{
	if (IsIconic())
	{
		CPaintDC dc(this); // 用于绘制的设备上下文

		SendMessage(WM_ICONERASEBKGND, reinterpret_cast<WPARAM>(dc.GetSafeHdc()), 0);

		// 使图标在工作区矩形中居中
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// 绘制图标
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialogEx::OnPaint();
	}
}

//当用户拖动最小化窗口时系统调用此函数取得光标
//显示。
HCURSOR CLLKDlg::OnQueryDragIcon()
{
	return static_cast<HCURSOR>(m_hIcon);
}


void CLLKDlg::OnBnClickedButtonLevel()
{
	// TODO: 在此添加控件通知处理程序代码
	relaxFlag=0;//0是闯关模式，1是休闲模式，2是基本模式
	this->ShowWindow(SW_HIDE);
	LLKLevelModel level;
	level.DoModal();
	this->ShowWindow(SW_SHOW);
}


void CLLKDlg::OnBnClickedButtonBasic()
{
	// TODO: 在此添加控件通知处理程序代码
	relaxFlag=2;
	this->ShowWindow(SW_HIDE);
	LLKLevelModel level;
	level.DoModal();
	this->ShowWindow(SW_SHOW);
}


void CLLKDlg::OnBnClickedButtonRelax()
{
	// TODO: 在此添加控件通知处理程序代码
	relaxFlag=1;
	this->ShowWindow(SW_HIDE);
	LLKLevelModel level;
	level.DoModal();
	this->ShowWindow(SW_SHOW);
}



void CLLKDlg::OnBnClickedButtonRank()
{
	// TODO: 在此添加控件通知处理程序代码
	this->ShowWindow(SW_HIDE);
	LLKRecordDlg recordDlg;
	recordDlg.DoModal();
	this->ShowWindow(SW_SHOW);
}


void CLLKDlg::OnBnClickedButtonSetting()
{
	// TODO: 在此添加控件通知处理程序代码
	this->ShowWindow(SW_HIDE);
	LLKSetting setting;
	setting.DoModal();
	this->ShowWindow(SW_SHOW);
}


void CLLKDlg::OnBnClickedButtonHelp()
{
	// TODO: 在此添加控件通知处理程序代码
	CHelpDialog help;
	help.DoModal();
}
