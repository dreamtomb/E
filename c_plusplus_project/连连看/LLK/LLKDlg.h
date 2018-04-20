
// LLKDlg.h : 头文件
//

#pragma once


// CLLKDlg 对话框
class CLLKDlg : public CDialogEx
{
// 构造
public:
	CLLKDlg(CWnd* pParent = NULL);	// 标准构造函数
// 对话框数据
	enum { IDD = IDD_LLK_DIALOG };
	static int relaxFlag;
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV 支持


// 实现
protected:
	HICON m_hIcon;

	// 生成的消息映射函数
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedButtonLevel();
	afx_msg void OnBnClickedButtonBasic();
	afx_msg void OnBnClickedButtonRelax();
	afx_msg void OnBnClickedButtonRank();
	afx_msg void OnBnClickedButtonSetting();
	afx_msg void OnBnClickedButtonHelp();
};
