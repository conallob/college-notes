// A minimal MFC program
#include <afxwin.h>
#include <strstrea.h>

//Derive essential classes

//This is the main window class
class CMainWin : public CFrameWnd
{
	char charEntered;
	CPoint pos;
	CDC m_memDC; //virtual window device context
	CBitmap m_bmp;	//virtual window bitmap
	int maxX,maxY;
	bool first;
	CBrush whiteBrush;
	CBrush redBrush;
	CBrush pinkBrush;
	CPen mRedPen;
	CPen mPinkPen;
public:
	CMainWin();
	afx_msg void OnChar(UINT Ch, UINT Count, UINT Flags);
	afx_msg void OnLButtonDown(UINT flags, CPoint loc);
	afx_msg void OnPaint();
	afx_msg void OnPopup();
	afx_msg void OnDie();
	DECLARE_MESSAGE_MAP()
};

// This is the Application Class
class CApp : public CWinApp
{
public:
	BOOL InitInstance();
};
