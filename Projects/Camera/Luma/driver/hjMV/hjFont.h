/***************************************************************************
                          hjFont.h  -  header
                             -------------------
    copyright            : Fabio Cristini
    email                : fabio.cristini@fastwebnet.it

 ***************************************************************************/

#ifndef _hjFont
	#define _hjFont

//***************************************************************************
//                                 Include
//***************************************************************************
	#include "hjStruct.h"

//***************************************************************************
//                                 Defines
//***************************************************************************

	#define HJ_FONT_SWKEY_F1		102
	#define HJ_FONT_SWKEY_F2		103
	#define HJ_FONT_SWKEY_F3		104
	#define HJ_FONT_SWKEY_F4		105
	#define HJ_FONT_SWKEY_F5		106
	#define HJ_FONT_SWKEY_F6		107

	#define HJ_FONT_SWKEY_F1_INDEX	  0
	#define HJ_FONT_SWKEY_F2_INDEX 	  1
	#define HJ_FONT_SWKEY_F3_INDEX 	  2
	#define HJ_FONT_SWKEY_F4_INDEX 	  3
	#define HJ_FONT_SWKEY_F5_INDEX	  4
	#define HJ_FONT_SWKEY_F6_INDEX 	  5


//***************************************************************************
//                                 Methods
//***************************************************************************

	void		hjInitFont			(DEV_T * dev);
	void		hjInitFontName		(DEV_T * dev, char * strFontName);

	void		hjReadFont			();
	int			hjReadChar			(int iASCII, hjChar *objChar);

	void		hjPaintChar			(int iASCII, int iX, int iY, DWORD lColor);
	void		hjPrintNumber		(int iNumber, int iX, int iY, DWORD lColor, bool bShadow);
	void		hjPrintString		(char *str, int iX, int iY, DWORD lColor, bool bShadow);
	
	
	void		hjReadSWKeyFont		();
	int			hjReadSWKeyChar		(int iKeyCode, hjSWKeyChar *objChar);
	void		hjPrintKeyChar		(int iSWKeyCode, int iX, int iY, DWORD lColor, bool bShadow);
	int			hjDecodeKeyChar		(int iSWKeyCode);


#endif // _hjFont