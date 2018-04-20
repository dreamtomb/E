#pragma once


// LLKAddDlg 对话框

class LLKAddDlg : public CDialogEx
{
	DECLARE_DYNAMIC(LLKAddDlg)

public:
	LLKAddDlg(CWnd* pParent = NULL);   // 标准构造函数
	virtual ~LLKAddDlg();

// 对话框数据
	enum { IDD = IDD_LLKADDDLG };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持

	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedOk();
	CString m_name;
	int m_score;
	int m_level;
	virtual BOOL OnInitDialog();
};
