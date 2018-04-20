// HelpDialog.cpp : 实现文件
//

#include "stdafx.h"
#include "LLK.h"
#include "HelpDialog.h"
#include "afxdialogex.h"


// CHelpDialog 对话框

IMPLEMENT_DYNAMIC(CHelpDialog, CDialogEx)

	CHelpDialog::CHelpDialog(CWnd* pParent /*=NULL*/)
	: CDialogEx(CHelpDialog::IDD, pParent)
{

}

CHelpDialog::~CHelpDialog()
{
}

void CHelpDialog::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_SCROLLBAR2, m_scroll);
}


BEGIN_MESSAGE_MAP(CHelpDialog, CDialogEx)
	ON_WM_VSCROLL()
	ON_WM_PAINT()
END_MESSAGE_MAP()


// CHelpDialog 消息处理程序


void CHelpDialog::OnVScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar)
{
	// TODO: 在此添加消息处理程序代码和/或调用默认值
	int pos = m_scroll.GetScrollPos();    // 获取水平滚动条当前位置  

	switch (nSBCode)   
	{   
	case SB_LINEUP:   
		pos -= 1;   
		break;   
	case SB_LINEDOWN:   
		pos  += 1;   
		break;    
	case SB_PAGEUP:   
		pos -= 10;   
		break;   
	case SB_PAGEDOWN:   
		pos  += 10;   
		break;    
	case SB_TOP:   
		pos = 1;   
		break;   
	case SB_BOTTOM:   
		pos = 100;   
		break;     
	case SB_THUMBPOSITION:   
		pos = nPos;   
		break;    
	default:   
		SetDlgItemInt(IDC_SCROLLBAR2, pos);  
		return;   
	}   
	m_scroll.SetScrollPos(pos); 
	CDialogEx::OnVScroll(nSBCode, nPos, pScrollBar);

	int cx, cy;  
	CImage image;  
	CRect rect;  
	//根据路径载入图片  
	image.Load(_T("res\\help.bmp"));  
	//获取图片的宽 高度  
	cx=image.GetWidth();  
	cy=image.GetHeight();  
	//获取Picture Control控件的大小  
	GetDlgItem(IDC_PICTURE)->GetWindowRect(&rect);  
	//将客户区选中到控件表示的矩形区域内  
	ScreenToClient(&rect);  
	//窗口移动到控件表示的区域  
	GetDlgItem(IDC_PICTURE)->MoveWindow(rect.left, rect.top, cx, cy, TRUE);  
	CWnd *pWnd=NULL;  
	pWnd=GetDlgItem(IDC_PICTURE);//获取控件句柄  
	pWnd->GetClientRect(&rect);//获取句柄指向控件区域的大小  
	CDC *pDC=NULL;  
	pDC=pWnd->GetDC();//获取picture的DC
    CDC memDC;//定义一个设备上下
    memDC.CreateCompatibleDC(pDC);//创建兼容的设备上下文
    CBitmap bmp;//定义位图对象
    bmp.LoadBitmap(IDB_BITMAP13);//加载位图
    memDC.SelectObject(&bmp);//选中位图对象
    pDC->BitBlt(0,0,800,600,&memDC,1,pos,SRCCOPY);//绘制位图
}


BOOL CHelpDialog::OnInitDialog(void)
{
	CDialogEx::OnInitDialog();

	// TODO:  Add extra initialization here  
	m_scroll.SetScrollRange(1,200);   
	m_scroll.SetScrollPos(1);   
	return TRUE;
}


void CHelpDialog::OnPaint()
{
	CPaintDC dc(this); // device context for painting
	// TODO: 在此处添加消息处理程序代码
	// 不为绘图消息调用 CDialogEx::OnPaint()
	int cx, cy;  
	CImage image;  
	CRect rect;  
	//根据路径载入图片  
	image.Load(_T("res\\help.bmp"));  
	//获取图片的宽 高度  
	cx=image.GetWidth();  
	cy=image.GetHeight();  
	//获取Picture Control控件的大小  
	GetDlgItem(IDC_PICTURE)->GetWindowRect(&rect);  
	//将客户区选中到控件表示的矩形区域内  
	ScreenToClient(&rect);  
	//窗口移动到控件表示的区域  
	GetDlgItem(IDC_PICTURE)->MoveWindow(rect.left, rect.top, cx, cy, TRUE);  
	CWnd *pWnd=NULL;  
	pWnd=GetDlgItem(IDC_PICTURE);//获取控件句柄  
	pWnd->GetClientRect(&rect);//获取句柄指向控件区域的大小  
	CDC *pDc=NULL;  
	pDc=pWnd->GetDC();//获取picture的DC  
	image.Draw(pDc->m_hDC, rect);//将图片绘制到picture表示的区域内  
	ReleaseDC(pDc);
}
