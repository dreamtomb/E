// LLKAddDlg.cpp : 实现文件
//

#include "stdafx.h"
#include "LLK.h"
#include "LLKLevelModel.h"
#include "LLKAddDlg.h"
#include "afxdialogex.h"


// LLKAddDlg 对话框

IMPLEMENT_DYNAMIC(LLKAddDlg, CDialogEx)

LLKAddDlg::LLKAddDlg(CWnd* pParent /*=NULL*/)
	: CDialogEx(LLKAddDlg::IDD, pParent)
{
	m_name = _T("");
	m_score = 0;
	m_level = 0;
}

LLKAddDlg::~LLKAddDlg()
{
}

void LLKAddDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Text(pDX, IDC_EDIT1, m_name);
	DDX_Text(pDX, IDC_EDIT2, m_score);
	DDX_Text(pDX, IDC_EDIT3, m_level);
}


BEGIN_MESSAGE_MAP(LLKAddDlg, CDialogEx)
	ON_BN_CLICKED(IDOK, &LLKAddDlg::OnBnClickedOk)
END_MESSAGE_MAP()


// LLKAddDlg 消息处理程序


void LLKAddDlg::OnBnClickedOk()
{
	// TODO: 在此添加控件通知处理程序代码
	CDialogEx::OnOK();
	UpdateData(TRUE);

	if(m_name != _T(""))
	{
		CStdioFile mFile; 
		CFileException mExcept;
		if(!mFile.Open(_T("record.txt"),CFile::modeWrite,&mExcept))
			mFile.Open(_T("record.txt"),CFile::modeCreate|CFile::modeWrite,&mExcept);
		CString str;
		mFile.SeekToEnd();
		//将记录写入文件的最后面
		str.Format(_T("%s\n"),m_name);
		mFile.WriteString(str);
		str.Format(_T("%d\n"),m_score);
		mFile.WriteString(str);
		str.Format(_T("%d\n"), m_level);
		mFile.WriteString(str);
		CDialog::OnOK();
	}
	else 
		AfxMessageBox(_T("请输入姓名!"));
	//CDialogEx::OnOK();
}


BOOL LLKAddDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();
	
	// TODO:  Add extra initialization here
	//通关父窗口指针parent来获取分数 和 关卡数（m_typeNum-1）
	LLKLevelModel *parent = (LLKLevelModel *)GetParent();
	m_level = parent->m_typeNum-1;
	m_score = parent->m_score;
	UpdateData(FALSE);
	return TRUE;  // return TRUE unless you set the focus to a control
	// EXCEPTION: OCX Property Pages should return FALSE
}


