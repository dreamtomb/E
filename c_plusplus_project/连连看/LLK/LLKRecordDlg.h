#pragma once


// LLKRecordDlg 对话框

class LLKRecordDlg : public CDialogEx
{
	DECLARE_DYNAMIC(LLKRecordDlg)

public:
	LLKRecordDlg(CWnd* pParent = NULL);   // 标准构造函数
	virtual ~LLKRecordDlg();

// 对话框数据
	enum { IDD = IDD_LLKRECORDDLG };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持
	DECLARE_MESSAGE_MAP()
public:
	virtual BOOL OnInitDialog();
	CListCtrl m_list;
	afx_msg void OnItemchangedList(NMHDR *pNMHDR, LRESULT *pResult);
	void ReadRecord(void);
	afx_msg void OnBnClickedCancel();
	afx_msg void OnBnClickedClean();
};
