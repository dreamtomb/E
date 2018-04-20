// LLKRecordDlg.cpp : implementation file
//

#include "stdafx.h"
#include "LLKan.h"
#include "LLKRecordDlg.h"
#include "afxdialogex.h"


// CLLKRecordDlg dialog

IMPLEMENT_DYNAMIC(CLLKRecordDlg, CDialogEx)

CLLKRecordDlg::CLLKRecordDlg(CWnd* pParent /*=NULL*/)
	: CDialogEx(CLLKRecordDlg::IDD, pParent)
{

}

CLLKRecordDlg::~CLLKRecordDlg()
{
}

void CLLKRecordDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	//DDX_Control(pDX, IDC_LIST, m_list);
	DDX_Control(pDX, IDC_LIST, m_list);
}


BEGIN_MESSAGE_MAP(CLLKRecordDlg, CDialogEx)
	ON_NOTIFY(LVN_ITEMCHANGED, IDC_LIST, &CLLKRecordDlg::OnItemchangedList)
	ON_BN_CLICKED(IDCANCEL, &CLLKRecordDlg::OnBnClickedCancel)
	ON_BN_CLICKED(IDC_CLEAN, &CLLKRecordDlg::OnBnClickedClean)
END_MESSAGE_MAP()


// CLLKRecordDlg message handlers


BOOL CLLKRecordDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  Add extra initialization here

	m_list.InsertColumn(0,_T(""),LVCFMT_CENTER,40);
	m_list.InsertColumn(1,_T("姓名"),LVCFMT_CENTER,100);
	m_list.InsertColumn(2,_T("分数"),LVCFMT_CENTER,70);
	m_list.InsertColumn(3,_T("过关数"),LVCFMT_CENTER,70);

	//给列表加上表格
	LONG lStyle = m_list.SendMessage(LVM_GETEXTENDEDLISTVIEWSTYLE);
	lStyle |= LVS_EX_FULLROWSELECT | LVS_EX_GRIDLINES |LVS_EX_HEADERDRAGDROP;
	m_list.SendMessage(LVM_SETEXTENDEDLISTVIEWSTYLE, 0,(LPARAM)lStyle);

	ReadRecord();

	return TRUE;  // return TRUE unless you set the focus to a control
	// EXCEPTION: OCX Property Pages should return FALSE
}


void CLLKRecordDlg::OnItemchangedList(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMLISTVIEW pNMLV = reinterpret_cast<LPNMLISTVIEW>(pNMHDR);
	// TODO: Add your control notification handler code here
	*pResult = 0;
}

//读出纪录
void CLLKRecordDlg::ReadRecord(void)
{

	CStdioFile mFile; 
	CFileException mExcept;
	CString readstr;
	CString IDstr;
	int i=0;
	if(!mFile.Open(_T("record.txt"),CFile::modeRead,&mExcept))
		mFile.Open(_T("record.txt"),CFile::modeCreate|CFile::modeRead,&mExcept);
	
	//将文件内容写入列表
	while(mFile.ReadString(readstr))
	{
		IDstr.Format(_T("%d"),(i+1));
		m_list.InsertItem(i,IDstr);
		m_list.SetItemText(i,1,readstr);
		mFile.ReadString(readstr);
		m_list.SetItemText(i,2,readstr);
		mFile.ReadString(readstr);
		m_list.SetItemText(i,3,readstr);
		i++;		
	}
}


void CLLKRecordDlg::OnBnClickedCancel()
{
	// TODO: Add your control notification handler code here

	CDialogEx::OnCancel();
}

//删除记录
void CLLKRecordDlg::OnBnClickedClean()
{
	// TODO: Add your control notification handler code here
	if(AfxMessageBox(_T("确定删除历史纪录"),MB_OKCANCEL)==IDOK)
	{
 		m_list.DeleteAllItems();
 		//清除文件纪录（重新创建一个同名文件）
 		CFile mFile;
		CFileException mExcept;
		mFile.Open(_T("record.txt"),CFile::modeCreate,&mExcept);
	}
}
