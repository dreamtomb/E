#pragma once


// CLLKAddDlg dialog

class CLLKAddDlg : public CDialogEx
{
	DECLARE_DYNAMIC(CLLKAddDlg)

public:
	CLLKAddDlg(CWnd* pParent = NULL);   // standard constructor
	virtual ~CLLKAddDlg();

// Dialog Data
	enum { IDD = IDD_ADD_DIALOG };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support

	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedOk();

	//将三个文本框关联到三个变量
	CString m_name;
	int m_score;
	int m_level;
	virtual BOOL OnInitDialog();
};
