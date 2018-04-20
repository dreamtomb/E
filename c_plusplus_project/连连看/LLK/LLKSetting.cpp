// LLKSetting.cpp : 实现文件
//

#include "stdafx.h"
#include "LLK.h"
#include "LLKSetting.h"
#include "afxdialogex.h"


// LLKSetting 对话框

IMPLEMENT_DYNAMIC(LLKSetting, CDialogEx)

int LLKSetting::main=1;
int LLKSetting::music=1;
LLKSetting::LLKSetting(CWnd* pParent /*=NULL*/)
	: CDialogEx(LLKSetting::IDD, pParent)
{

}

LLKSetting::~LLKSetting()
{
}

void LLKSetting::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(LLKSetting, CDialogEx)
	ON_BN_CLICKED(IDC_RADIO1, &LLKSetting::OnBnClickedRadio1)
	ON_BN_CLICKED(IDC_RADIO2, &LLKSetting::OnBnClickedRadio2)
	ON_BN_CLICKED(IDC_RADIO3, &LLKSetting::OnBnClickedRadio3)
	ON_BN_CLICKED(IDC_RADIO4, &LLKSetting::OnBnClickedRadio4)
	ON_BN_CLICKED(IDOK, &LLKSetting::OnBnClickedOk)
END_MESSAGE_MAP()


// LLKSetting 消息处理程序


void LLKSetting::OnBnClickedRadio1()
{
	// TODO: 在此添加控件通知处理程序代码
	LLKSetting::main=1;
}


void LLKSetting::OnBnClickedRadio2()
{
	// TODO: 在此添加控件通知处理程序代码
	LLKSetting::main=2;
}


void LLKSetting::OnBnClickedRadio3()
{
	// TODO: 在此添加控件通知处理程序代码
	LLKSetting::music=1;
}


void LLKSetting::OnBnClickedRadio4()
{
	// TODO: 在此添加控件通知处理程序代码
	LLKSetting::music=2;
}


void LLKSetting::OnBnClickedOk()
{
	// TODO: 在此添加控件通知处理程序代码
	CDialogEx::OnOK();
}


BOOL LLKSetting::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  在此添加额外的初始化
	if(LLKSetting::main==1)
	{
		CButton* radio=(CButton*)GetDlgItem(IDC_RADIO1);
		radio->SetCheck(1);
	}
	else
	{
		CButton* radio=(CButton*)GetDlgItem(IDC_RADIO2);
		radio->SetCheck(1);
	}
	
	if(LLKSetting::music==1)
	{
		CButton* radio=(CButton*)GetDlgItem(IDC_RADIO3);
		radio->SetCheck(1);
	}
	else
	{
		CButton* radio=(CButton*)GetDlgItem(IDC_RADIO4);
		radio->SetCheck(1);
	}
	return TRUE;  // return TRUE unless you set the focus to a control
	// 异常: OCX 属性页应返回 FALSE
}
