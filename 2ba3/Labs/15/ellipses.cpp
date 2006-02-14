#include "resource.h"
#include "ellipses.h"

//Construct a window
CMainWin::CMainWin()
{
	Create(NULL, "Conall's Menu Thingy", WS_OVERLAPPEDWINDOW, rectDefault, NULL, MAKEINTRESOURCE(IDR_MENU1));

//Create a virtual output window
	CClientDC dc(this);

	maxX = GetSystemMetrics(SM_CXSCREEN);
	maxY = GetSystemMetrics(SM_CYSCREEN);

	m_memDC.CreateCompatibleDC(&dc);
	m_bmp.CreateCompatibleBitmap(&dc,maxX, maxY);

	m_memDC.SelectObject(&m_bmp);
	m_memDC.PatBlt(0,0,maxX,maxY, PATCOPY);
	first = true;

	redBrush.CreateSolidBrush(RGB(255,0,0));
	whiteBrush.CreateSolidBrush(RGB(255,255,255));
		pinkBrush.CreateSolidBrush(RGB(255,0,150));
	mRedPen.CreatePen(PS_SOLID,1,RGB(255,0,0));
		mPinkPen.CreatePen(PS_SOLID,1,RGB(255,0,150));
}


// This is the application's message map.
BEGIN_MESSAGE_MAP(CMainWin, CFrameWnd)
	ON_WM_CHAR()
	ON_WM_LBUTTONDOWN()
	ON_WM_PAINT()
	ON_COMMAND(ID_POPUP, OnPopup)
	ON_COMMAND(ID_KILL, OnDie)
END_MESSAGE_MAP()



//Process a WM_CHAR message
afx_msg void CMainWin::OnChar(UINT ch, UINT Count, UINT Flags)
{

	charEntered = ch;
}

afx_msg void CMainWin::OnLButtonDown(UINT flags, CPoint loc)
{
	pos.x = loc.x;
	pos.y = loc.y;

	InvalidateRect(NULL);
}

afx_msg void CMainWin::OnPaint()
{
	CPaintDC dc(this);

//	m_memDC.SelectObject(&whiteBrush);
//	m_memDC.PatBlt(0,0,maxX,maxY, PATCOPY);

	if(pos.x>=0&&pos.y>=0)
		{
		m_memDC.SelectObject(&pinkBrush);
		m_memDC.SelectObject(&mPinkPen);
		m_memDC.Ellipse(pos.x-10, pos.y-10, pos.x+10, pos.y+10);

		if(first)
			first = false;
		else
			m_memDC.LineTo(pos.x,pos.y);
		m_memDC.MoveTo(pos.x,pos.y);
		}

	dc.BitBlt(0,0,maxX,maxY,&m_memDC,0,0,SRCCOPY);
	}



afx_msg void CMainWin::OnPopup() {

	

}


afx_msg void CMainWin::OnDie() {

	

}

//Initialise the application
BOOL CApp::InitInstance()
{
	m_pMainWnd = new CMainWin;
	m_pMainWnd->ShowWindow(m_nCmdShow);
	m_pMainWnd->UpdateWindow();

	return TRUE;
}


CApp App; //instantiate the application