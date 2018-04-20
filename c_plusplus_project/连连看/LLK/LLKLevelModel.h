#pragma once
#include "afxwin.h"
#include "global.h"

#define MAXX 9 //行数
#define MAXY 10 //列数
// LLKLevelModel 对话框

class LLKLevelModel : public CDialogEx
{
	DECLARE_DYNAMIC(LLKLevelModel)

public:
	LLKLevelModel(CWnd* pParent = NULL);   // 标准构造函数
	virtual ~LLKLevelModel();

// 对话框数据
	enum { IDD = IDD_DIALOG_LEVELMODEL };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持

	DECLARE_MESSAGE_MAP()
private:
	CPtrArray m_btnGroup; //Button 组
public:
	int m_typeNum; //图片种类数
	int m_time; //剩余时间
	int m_score; //记录分数
	int map[MAXX][MAXY]; //地图数组存储图片类型
	static Graph G;
	void InitMap(int  map[][MAXY]);
	void ShowMap(Graph G);
	afx_msg void OnPaint();
	afx_msg void OnBnClickedButtonBegin();
	afx_msg void OnTimer(UINT_PTR nIDEvent);
	BOOL IsWin(void);
	CPoint pt1; //画路径时保存首尾结点
	CPoint pt2;
	CPoint pt3;
	CPoint pt4;
	afx_msg void OnBnClickedButtonRearray();
	afx_msg void OnBnClickedButtonTips();
	afx_msg void OnBnClickedButtonPause();
	afx_msg void OnBnClickedButtonHelp();
	CButton tool;
	virtual BOOL OnInitDialog();
	afx_msg void OnBnClickedButtonTool();
	afx_msg void OnBnClickedButtonSetting();
};
