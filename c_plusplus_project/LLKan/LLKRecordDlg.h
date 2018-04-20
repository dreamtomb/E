#pragma once


// CLLKRecordDlg dialog

class CLLKRecordDlg : public CDialogEx
{
	DECLARE_DYNAMIC(CLLKRecordDlg)

public:
	CLLKRecordDlg(CWnd* pParent = NULL);   // standard constructor
	virtual ~CLLKRecordDlg();

// Dialog Data
	enum { IDD = IDD_RECORD_DIALOG };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support

	DECLARE_MESSAGE_MAP()
public:
	virtual BOOL OnInitDialog();
	CListCtrl m_list;
	afx_msg void OnItemchangedList(NMHDR *pNMHDR, LRESULT *pResult);
	void ReadRecord(void);
	afx_msg void OnBnClickedCancel();
	afx_msg void OnBnClickedClean();
};
