#pragma once
#pragma once
#include "atltypes.h"
#include "LLKDlg.h"
#include "LLKLevelModel.h"

// LLKButton

class LLKButton : public CButton
{
	DECLARE_DYNAMIC(LLKButton)

public:
	LLKButton();
	virtual ~LLKButton();

protected:
	DECLARE_MESSAGE_MAP()
	public:
	int m_ID; //按钮的类型，即按钮上图片的类型
	CPoint m_location; //按钮对应在map中的位置
public:
	LLKButton(int type, CPoint point);
	Graph readj(Graph G);
	BOOL findPath(CPoint p1, CPoint p2);
	BOOL BFS(Graph G,int index1,int index2);
	static LLKButton* ms_firstBtn; //记录最终选择要消除的两个按钮
	static LLKButton* ms_secondBtn; 
	static CPoint ms_ptCross1;  //两个拐点的位置
	static CPoint ms_ptCross2;
	static LLKLevelModel* parent;  //父窗口（主窗口）的指针
	afx_msg void OnLButtonDown(UINT nFlags, CPoint point);
	BOOL FindLine(CPoint p1, CPoint p2); //寻找路径的算法
	BOOL FindOneConner(CPoint p1, CPoint p2);
	BOOL FindSide(CPoint p1, CPoint p2);
	BOOL FindTwoConner(CPoint p1, CPoint p2);

};


