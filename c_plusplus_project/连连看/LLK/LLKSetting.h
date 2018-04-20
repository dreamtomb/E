#pragma once


// LLKSetting 对话框

class LLKSetting : public CDialogEx
{
	DECLARE_DYNAMIC(LLKSetting)

public:
	LLKSetting(CWnd* pParent = NULL);   // 标准构造函数
	virtual ~LLKSetting();

// 对话框数据
	enum { IDD = IDD_LLKSETTING };
	static int main;
	static int music;
protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持

	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedRadio1();
	afx_msg void OnBnClickedRadio2();
	afx_msg void OnBnClickedRadio3();
	afx_msg void OnBnClickedRadio4();
	afx_msg void OnBnClickedOk();
	virtual BOOL OnInitDialog();
};
