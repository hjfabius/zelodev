/***************************************************************************
                          hjGUI.cpp  -  description
                             -------------------
    copyright            : Fabio Cristini
    email                : fabio.cristini@fastwebnet.it

 ***************************************************************************/


//***************************************************************************
//                                 Includes
//***************************************************************************
	#include <stdio.h>
	#include "hjGUI.h"
	#include "mv.h"
	#include "hjTrace.h"
	#include "ini.h"
	#include "hjBlob.h"
	#include "hjColors.h"
	#include "hjFont.h"

//***************************************************************************
//                                 Defines
//***************************************************************************
	#define PI						3.14159265

	/* Dimension */
	#define HJ_TITLE_BAR_HEIGHT				25


//***************************************************************************
//                                 Variables
//***************************************************************************
	DEV_T		*hjDevGUI;

//***************************************************************************
//                                 Methods
//***************************************************************************

int hjWriteIdleInterace(DEV_T * dev)
{
	hjDevGUI = dev;
	//Background
	hjPaintRect(	0,
					0,
					mc_iScreenWidth, 
					mc_iScreenHeight, 
					HJ_COLOR_BLACK);

	hjWriteLogo();

	return 0;
}



int	hjWriteInterface(DEV_T * dev, char * strTitle, hjPattern * oPattern)
{
	

	hjDevGUI = dev;

	//Title Background
	hjPaintRect(	0,
					0,
					mc_iScreenWidth, 
					HJ_TITLE_BAR_HEIGHT, 
					HJ_COLOR_CUSTOM_BACKGROUND_TITLE);

	//Background
	hjPaintRect(	0,
					HJ_TITLE_BAR_HEIGHT,
					mc_iScreenWidth, 
					mc_iScreenHeight-HJ_TITLE_BAR_HEIGHT-HJ_TITLE_BAR_HEIGHT, 
					HJ_COLOR_CUSTOM_BACKGROUND);

	//Footer Background
	hjPaintRect(	0,
					mc_iScreenHeight-HJ_TITLE_BAR_HEIGHT,
					mc_iScreenWidth, 
					HJ_TITLE_BAR_HEIGHT, 
					HJ_COLOR_CUSTOM_BACKGROUND_TITLE);

	
	//TitleBar
	hjPrintString(	"Zelo Elettronica S.r.l", 
					400 + 2, 
					mc_iScreenHeight-HJ_TITLE_BAR_HEIGHT + 5, 
					HJ_COLOR_CUSTOM_FOREGROUND_TITLE, true);

	hjPrintString(	"Luma 1.0", 
					3, 
					6, 
					HJ_COLOR_CUSTOM_FOREGROUND_TITLE, true);

	hjPrintString(	strTitle, 
					600, 
					6, 
					HJ_COLOR_CUSTOM_FOREGROUND_TITLE, true);




	//Center line
	hjPaintRect(	0,
					465,
					mc_iScreenWidth, 
					5, 
					HJ_COLOR_CUSTOM_BACKGROUND_TITLE);

	//Legend
	hjWriteLegend(	38, 
					476, 
					HJ_COLOR_BLACK, 
					HJ_COLOR_BLACK, true);



	//hjWriteTitle();
	vec_t v;
	for (int i=0; i<HJ_UNITS_PER_PATTERN; i++)
	{
		if (i<(oPattern->iNumUnit))
		{
			//oUnit
			v = oPattern->Unit[i].ErrorPos;
			hjPrintPointer(	i, 
							oPattern->Unit[i].ErrorPos , 
							oPattern->Unit[i].lColor, true);
		}
		else
		{
			v.XPos = 0;
			v.YPos = 0;
			hjPrintPointer(i, v, HJ_COLOR_BLUE, false);
		}
	}
	
	return 0;
}

//-----------------------------------------------------------------------------
int	hjWriteLogo()
{
	int		iX;
	int		iY;
	DWORD	lColor;
	int		i;

	const int		iTop = 100;
	const int		iLeft = 360;

	//hjTrace("hjWriteTitle");

	//Z Top Line
	lColor = HJ_COLOR_RED;
	for (iY = iTop; iY < (iTop + 25); iY++)
	{
		for (iX = iLeft; iX < (iLeft + 100); iX++)
		{
			mvWritePixel(hjDevGUI,BS_YC_PL_Y, iX, iY, lColor);
		}
	}

	//Z Line /
	i = 0;
	for (iY = (iTop + 25); iY < (iTop + 75); iY++)
	{
		for (iX = (iLeft + 50); iX < (iLeft + 100); iX++)
		{
			mvWritePixel(hjDevGUI,BS_YC_PL_Y, iX-i, iY, lColor);
		}
		i = i+1;
	}

	//Z Bottom Lie
	for (iY = (iTop + 75); iY < (iTop + 100); iY++)
	{
		for (iX = iLeft ; iX < (iLeft + 100); iX++)
		{
			mvWritePixel(hjDevGUI,BS_YC_PL_Y, iX, iY, lColor);
		}
	}



	//White Border
	//Z Top Line
	lColor = HJ_COLOR_WHITE;
	for (iY = (iTop-2); iY < iTop; iY++)
	{
		for (iX = (iLeft - 2); iX < (iLeft + 102); iX++)
		{
			mvWritePixel(hjDevGUI,BS_YC_PL_Y, iX, iY, lColor);
		}
	}	
	
	for (iY = (iTop-2); iY < (iTop+25); iY++)
	{
		for (iX = (iLeft-2); iX < iLeft ; iX++)
		{
			mvWritePixel(hjDevGUI,BS_YC_PL_Y, iX, iY, lColor);
		}
		for (iX = (iLeft + 100); iX < (iLeft + 102); iX++)
		{
			mvWritePixel(hjDevGUI,BS_YC_PL_Y, iX, iY, lColor);
		}
	}

	for (iY = (iTop+25); iY < (iTop+27); iY++)
	{
		for (iX = (iLeft - 2); iX < (iLeft + 50); iX++)
		{
			mvWritePixel(hjDevGUI,BS_YC_PL_Y, iX, iY, lColor);
		}
	}	


	//White Border
	//Z Line /
	i = 0;
	for (iY = (iTop + 25); iY < (iTop + 75); iY++)
	{
		for (iX = (iLeft + 48); iX < (iLeft + 50); iX++)
		{
			mvWritePixel(hjDevGUI,BS_YC_PL_Y, iX-i, iY, lColor);
		}
		for (iX = (iLeft + 100); iX < (iLeft + 102); iX++)
		{
			mvWritePixel(hjDevGUI,BS_YC_PL_Y, iX-i, iY, lColor);
		}
		i = i+1;
	}

	//White Border
	//Z Bottom Lie
	for (iY = (iTop + 73); iY < (iTop + 75); iY++)
	{
		for (iX = (iLeft+52); iX < (iLeft + 102); iX++)
		{
			mvWritePixel(hjDevGUI,BS_YC_PL_Y, iX, iY, lColor);
		}
	}

	for (iY = (iTop + 75); iY < (iTop + 100); iY++)
	{
		for (iX = (iLeft -2); iX < (iLeft ); iX++)
		{
			mvWritePixel(hjDevGUI,BS_YC_PL_Y, iX, iY, lColor);
		}
		for (iX = (iLeft +100); iX < (iLeft + 102); iX++)
		{
			mvWritePixel(hjDevGUI,BS_YC_PL_Y, iX, iY, lColor);
		}
	}

	for (iY = (iTop + 100); iY < (iTop + 102); iY++)
	{
		for (iX = (iLeft-2) ; iX < (iLeft + 102); iX++)
		{
			mvWritePixel(hjDevGUI,BS_YC_PL_Y, iX, iY, lColor);
		}
	}

	//symbol
	hjPaintCircle	(iLeft+50,  iTop+50, 80,		HJ_COLOR_WHITE);
	hjPaintEllipse	(iLeft+50,  iTop+50, 160, 80,	HJ_COLOR_WHITE);
	hjPaintLineH	(iLeft-200, iTop+50, 500,		HJ_COLOR_WHITE);
	hjPaintLineV	(iLeft+50,  iTop-40, 180,		HJ_COLOR_WHITE);

	return 0;

}


void hjPaintEllipse(int iCenterX, int iCenterY, int iRadiusX, int iRadiusY, DWORD lColor)
{
	int		iX;
	int		iY;
	double	dCos;
	double  dSen;
	int		i;

	for(i=0; i<360; i++)
	{
		dCos = cos (i*(PI/180));
		dSen = sin (i*(PI/180));

		iX = iCenterX + (int) (iRadiusX * dCos);
		iY = iCenterY + (int) (iRadiusY * dSen);
		mvWritePixel(hjDevGUI, BS_YC_PL_Y,	iX-1,		iY,		lColor);
		mvWritePixel(hjDevGUI, BS_YC_PL_Y,	iX  ,		iY,		lColor);
		mvWritePixel(hjDevGUI, BS_YC_PL_Y,	iX+1,		iY,		lColor);

		mvWritePixel(hjDevGUI, BS_YC_PL_Y,	iX,		iY-1,		lColor);
		mvWritePixel(hjDevGUI, BS_YC_PL_Y,	iX,		iY  ,		lColor);
		mvWritePixel(hjDevGUI, BS_YC_PL_Y,	iX,		iY+1,		lColor);
	}
}


void hjPaintCircle(int iCenterX, int iCenterY, int iRadius, DWORD lColor)
{
	hjPaintEllipse(iCenterX, iCenterY, iRadius, iRadius, lColor);
}

void hjPaintFullCircle(int iCenterX, int iCenterY, int iRadius, DWORD lColor)
{
	int		iX1;
	int		iX2;
	int		iY;
	double	dCos;
	double  dSen;
	int		i;

	for(i=-90; i<=90; i++)
	{
		dCos = cos (i*(PI/180));
		dSen = sin (i*(PI/180));

		iX1 = iCenterX - (int) (iRadius * dCos);
		iX2 = iCenterX + (int) (iRadius * dCos);
		iY = iCenterY + (int) (iRadius * dSen);
			
		hjPaintLineH( iX1,  iY, iX2-iX1, lColor);
	}
}



void hjPaintLineH(int iStartX, int iStartY, int iLength, DWORD lColor)
{
	int		iX;
	int		iY;

	for (iY = (iStartY-1); iY < (iStartY+1); iY++)
	{
		for (iX = iStartX ; iX < (iStartX+iLength); iX++)
		{
			mvWritePixel(hjDevGUI,BS_YC_PL_Y, iX, iY, lColor);
		}
	}
}

void hjPaintLineV(int iStartX, int iStartY, int iLength, DWORD lColor)
{
	int		iX;
	int		iY;
	for (iX = (iStartX-1); iX < (iStartX+1); iX++)
	{
		for (iY = iStartY ; iY < (iStartY+iLength); iY++)
		{
			mvWritePixel(hjDevGUI,BS_YC_PL_Y, iX, iY, lColor);
		}
	}
}

void hjPaintLineD(int iStartX, int iStartY, int iLength, DWORD lColor)
{
	int		iX		= 0;
	int		iY		= 0;
	int		iOff	= 0;
	for (iY = iStartY, iOff; iY < (iStartY+iLength); iY++)
	{
		for (iX = (iStartX-1); iX < (iStartX+1); iX++)
		{
			mvWritePixel(hjDevGUI,BS_YC_PL_Y, iX+iOff, iY, lColor);
		}
		iOff++;
	}
}

void hjPaintLineRD(int iStartX, int iStartY, int iLength, DWORD lColor)
{
	int		iX		= 0;
	int		iY		= 0;
	int		iOff	= 0;
	for (iY = (iStartY+iLength); iY > iStartY; iY--)
	{
		for (iX = (iStartX-1); iX < (iStartX+1); iX++)
		{
			mvWritePixel(hjDevGUI,BS_YC_PL_Y, iX+iOff, iY, lColor);
		}
		iOff++;
	}
}


void hjPaintRect(int iLeft, int iTop, int iWidth, int iHeight, DWORD lColor)
{
	int		iX;
	int		iY;

	for (iX = iLeft; iX < (iLeft+iWidth); iX++)
	{
		for (iY = iTop ; iY < (iTop+iHeight); iY++)
		{
			mvWritePixel(hjDevGUI,BS_YC_PL_Y, iX, iY, lColor);
		}
	}
}



void hjShowImage(TGrabber *grabber, int dispwidth, int dispheight, int bypp,
				 BYTE *buffer = 0, int bufferpitch = 0)
{
	//int iLeft;
	//int iTop;
	//int iWidth;
	//int iHeight;


	//DEV_T *dev = grabber->dev;
	//int y;
	//BYTE *p;
	//BYTE *display;
	//int disppitch = grabber->AcqDef.xsize[0] * bypp;
	//
	//int iXOffset;


	////y1 = min(grabber->AcqDef.fields_per_frame * grabber->AcqDef.ysize[0], dispheight);
	////x1 = min(grabber->AcqDef.xsize[0], dispwidth);
	//display = dev->SegMemAddress[MI_VGA];

	//
	//if (buffer == NULL)
	//{
	//	buffer =((BYTE *)mvGetRowAdr(dev, 0, iTop));
	//	bufferpitch =((BYTE *)mvGetRowAdr(dev, 0, iTop+1)) - buffer;

	//	iXOffset = (bufferpitch / grabber->AcqDef.xsize[0]) * iLeft ;
	//}
	//
	//for (p=(buffer+iXOffset), y=iTop; y<(iTop+iHeight); y++, p+=bufferpitch)
	//{
	//	memcpy(display, p, bypp * iWidth);
	//	display += disppitch;
	//}
}


void hjPrintPointer( int iNumPointer, vec_t vErr, DWORD lColor, bool bUsed)
{
	const int c_iNumElementPerLine	=  6;

	const int c_iWidth		= 115;
	const int c_iHeight		= 115;
	const int c_iFontHeight =  20;
	const int c_iBorder		=   7;
	const int c_iHorizSpace	=  17;
	const int c_iVertSpace	=  100;

	const int c_iTitleHeight =  c_iFontHeight;
	const int c_iErrorHeight =  (3*c_iFontHeight);



	int iLeft		= 0; 
	int iTop		= 0;
	int iCenterX	= 0;
	int iCenterY	= 0;

	char str[50];

	int iX			= 0;
	int iY			= 0;

	iX = iNumPointer % c_iNumElementPerLine;
	iY = (iNumPointer - (iNumPointer % c_iNumElementPerLine)) / c_iNumElementPerLine;

	iTop  = (2*HJ_TITLE_BAR_HEIGHT)  + c_iFontHeight + ((c_iHeight + c_iVertSpace) * iY);
	iLeft = 7  + ((c_iWidth  + c_iHorizSpace) * iX);

	iCenterX = iLeft + (int)(c_iWidth/2);
	iCenterY = iTop + (int)(c_iHeight/2);

	//Border
	//hjPaintRect(iLeft-c_iBorder, iTop-c_iTitleHeight-c_iBorder, c_iWidth+(2*c_iBorder), c_iHeight + (2*c_iBorder), HJ_COLOR_CUSTOM_BACKGROUND_BORDER);
	hjPaintRect(iLeft+c_iBorder, iTop-c_iTitleHeight+c_iBorder, c_iWidth, c_iHeight+c_iErrorHeight, HJ_COLOR_CUSTOM_BACKGROUND_BORDER);

	//Rect for Num Blob
	hjPaintRect(iLeft, iTop-c_iTitleHeight, c_iWidth, c_iFontHeight, lColor);
	//Num Blob
	sprintf(str, "Unit %1d", iNumPointer+1);
	hjPrintString(str, iLeft+c_iBorder, iTop - c_iTitleHeight, HJ_COLOR_CUSTOM_FOREGROUND_POINTER, true);


	//White square
	hjPaintRect(iLeft, iTop, c_iWidth, c_iHeight, HJ_COLOR_CUSTOM_BACKGROUND_POINTER);

	//Rect for errors
	//hjPaintRect(iLeft, iTop+c_iHeight, c_iWidth, c_iErrorHeight, HJ_COLOR_CUSTOM_BACKGROUND_POINTER_FONT);

	if (bUsed) 
	{
		//Blob
		hjPaintFullCircle(iCenterX + vErr.XPos, iCenterY - vErr.YPos, 10,  lColor);

		//Axis
		hjPaintLineV(iCenterX, iTop, c_iHeight, HJ_COLOR_CUSTOM_FOREGROUND_POINTER );
		hjPaintLineH(iLeft, iCenterY, c_iWidth, HJ_COLOR_CUSTOM_FOREGROUND_POINTER );

	}
	else
	{
		hjPaintLineD (iLeft, iTop, c_iHeight, HJ_COLOR_RED);
		hjPaintLineRD(iLeft, iTop, c_iHeight, HJ_COLOR_RED);
	}



	
	if (bUsed) 
	{
		//X Error
		if (vErr.XPos>0)
		{
			sprintf(str, "A:%5d", vErr.XPos);
		}
		else
		{
			sprintf(str, "R:%5d", -vErr.XPos);
		}
		hjPrintString(str, iLeft + (2*c_iBorder), iTop + c_iHeight+2, HJ_COLOR_CUSTOM_FOREGROUND_POINTER_FONT, false);

		//Y Error
		if (vErr.YPos>0)
		{
			sprintf(str, "T:%5d", vErr.YPos);
		}
		else
		{
			sprintf(str, "O:%5d", -vErr.YPos);
		}
		hjPrintString(str, iLeft + (2*c_iBorder), iTop + c_iHeight+c_iFontHeight+2, HJ_COLOR_CUSTOM_FOREGROUND_POINTER_FONT, false);
	}
}


void hjWriteLegend(int iLeft, int iTop, DWORD lColor1, DWORD lColor2, bool bShadow)
{
	int iXDividend  = 3;
	int iXIncrement = 0;
	int iYIncrement = 50;
	int iXFontIncrement = 50;
	int iYFontIncrement = 10;
	int iIndex		= 0;
	int iX			= 0;
	int iY			= 0;

	//F1 + F2
	iXIncrement = (int) (mc_iScreenWidth -iLeft) / iXDividend;
	
	iX = iLeft+(iXIncrement*iIndex);
	iY = iTop;
	hjPrintKeyChar(HJ_FONT_SWKEY_F1, iX, iY,  lColor1, bShadow);
	iX += iXFontIncrement;
	iY += iYFontIncrement;
	hjPrintString ("Image 1", iX, iY, lColor2, bShadow);

	iX = iLeft+(iXIncrement*iIndex);
	iY = iTop + iYIncrement;
	hjPrintKeyChar(HJ_FONT_SWKEY_F2, iX, iY,  lColor1, bShadow);
	iX += iXFontIncrement;
	iY += iYFontIncrement;
	hjPrintString ("Image 2", iX, iY, lColor2, bShadow);


	iIndex++;

	//F3 + F4
	iX = iLeft+(iXIncrement*iIndex);
	iY = iTop;
	hjPrintKeyChar(HJ_FONT_SWKEY_F3, iX, iY,  lColor1, bShadow);
	iX += iXFontIncrement;
	iY += iYFontIncrement;
	hjPrintString ("Pattern 1", iX, iY, lColor2, bShadow);

	iX = iLeft+(iXIncrement*iIndex);
	iY = iTop + iYIncrement;
	hjPrintKeyChar(HJ_FONT_SWKEY_F4, iX, iY, lColor1, bShadow);
	iX += iXFontIncrement;
	iY += iYFontIncrement;
	hjPrintString ("Pattern 2", iX, iY, lColor2, bShadow);

	iIndex++;

	//F6
	iX = iLeft+(iXIncrement*iIndex);
	iY = iTop + iYIncrement;
	hjPrintKeyChar(HJ_FONT_SWKEY_F6, iX, iY, lColor1, true);
	iX += iXFontIncrement;
	iY += iYFontIncrement;
	hjPrintString ("Exit", iX, iY, lColor2, true);
}




//-----------------------------------------------------------------------------
void hjPaintRegisterMark(hjPattern * oPattern, int iUnitIndex)
{
	hjUnit	oUnit	;
	DWORD	lColor	= 0;
	int		iWidth	= 0;

	hjTraceN("hjPaintRegisterMark", iUnitIndex);
	lColor		 = HJ_COLOR_GREEN;
	oUnit		 = oPattern->Unit[iUnitIndex];
	iWidth		 = (int) oPattern->iSearchLength / 2;

	hjTraceN("hjPaintRegisterMark-->IdealPos.XPos", oUnit.IdealPos.XPos);
	hjTraceN("hjPaintRegisterMark-->IdealPos.XPos", oUnit.IdealPos.YPos);
	hjTraceN("hjPaintRegisterMark-->RealPos.YPos", oUnit.RealPos.XPos);
	hjTraceN("hjPaintRegisterMark-->RealPos.YPos", oUnit.RealPos.YPos);


	//Search Area
	for(int iX = (oUnit.IdealPos.XPos  - iWidth); iX<(oUnit.IdealPos.XPos  + iWidth); iX++)
	{
		mvWritePixel(hjDevGUI,BS_YC_PL_Y, iX, (oUnit.IdealPos.YPos  - iWidth), lColor);
		mvWritePixel(hjDevGUI,BS_YC_PL_Y, iX, (oUnit.IdealPos.YPos  + iWidth), lColor);
	}

	for(int iY= (oUnit.IdealPos.YPos  - iWidth); iY<(oUnit.IdealPos.YPos  + iWidth); iY++)
	{
		mvWritePixel(hjDevGUI,BS_YC_PL_Y, (oUnit.IdealPos.XPos  - iWidth), iY, lColor);
		mvWritePixel(hjDevGUI,BS_YC_PL_Y, (oUnit.IdealPos.XPos  + iWidth), iY, lColor);
	}
	
	lColor	= HJ_COLOR_RED;
	iWidth	= (int) iWidth /2;

	for(int iX = (oUnit.RealPos.XPos  - iWidth ); iX<(oUnit.RealPos.XPos  + iWidth); iX++)
	{
		mvWritePixel(hjDevGUI,BS_YC_PL_Y, iX, oUnit.RealPos.YPos, lColor);
	}

	for(int iY= (oUnit.RealPos.YPos  - iWidth); iY<(oUnit.RealPos.YPos  + iWidth); iY++)
	{
		mvWritePixel(hjDevGUI,BS_YC_PL_Y, oUnit.RealPos.XPos, iY, lColor);
	}
}


//-----------------------------------------------------------------------------
void hjPaintRegisterMarks(hjPattern * oPattern)
{
	hjTraceN("hjPaintRegisterMarks - NumUnit:", oPattern->iNumUnit);
	for (int i=0; i<oPattern->iNumUnit; i++)
	{
		hjPaintRegisterMark(oPattern, i);
	}
}