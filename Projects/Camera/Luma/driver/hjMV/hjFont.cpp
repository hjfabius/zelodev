/***************************************************************************
                          hjFont.cpp  -  description
                             -------------------
    copyright            : Fabio Cristini
    email                : fabio.cristini@fastwebnet.it

 ***************************************************************************/


//***************************************************************************
//                                 Includes
//***************************************************************************
	#include "hjFont.h"
//	#include "hjColors.h"
	#include "hjTrace.h"
	#include "ini.h"
	#include "hjColors.h"
	#include <stdio.h>

//***************************************************************************
//                                 Defines
//***************************************************************************

	#define HJ_FONT_INI_FILENAME_TAHOMA_20			"hjTahoma_20.ini"			//30x30
	#define HJ_FONT_INI_FILENAME_CURRIERNEW_28		"hjCourier_New_28.ini"		//28x35
	#define HJ_FONT_INI_FILENAME_LUCIDA_CONSOLE_28	"hjLucida_Console_28.ini"	//24x38
	#define HJ_FONT_INI_FILENAME_LUCIDA_CONSOLE_14	"hjLucida_Console_14.ini"	//14x18

	#define HJ_FONT_INI_FILENAME_SWKEYS_20			"hjSWkeys_20.ini"			//30x30
	#define HJ_FONT_INI_FILENAME_SWKEYS_24			"hjSWkeys_24.ini"			//35x35
	#define HJ_FONT_INI_FILENAME_SWKEYS_28			"hjSWkeys_28.ini"			//36x36
	#define HJ_FONT_INI_FILENAME_SWKEYS_32			"hjSWkeys_32.ini"			//42x42


	#define HJ_DEFAULT_FONT_INI_FILENAME			HJ_FONT_INI_FILENAME_LUCIDA_CONSOLE_14
	#define HJ_DEFAULT_FONT_INI_KEY_FILENAME		HJ_FONT_INI_FILENAME_SWKEYS_32


//***************************************************************************
//                                 Variables
//***************************************************************************
	DEV_T			* hjDevFont;
	char			* m_strFontName;
	hjFont			m_objhjMasterFont;
	hjSWKeyFont		m_objhjKeyFont;
//***************************************************************************
//                                 Methods
//***************************************************************************

void hjInitFont(DEV_T * dev)
{
	hjInitFontName(dev, HJ_DEFAULT_FONT_INI_FILENAME);
	hjReadSWKeyFont();
}


void hjInitFontName(DEV_T * dev, char * strFontName)
{
	m_strFontName = strFontName;
	hjDevFont = dev;

	hjReadFont();
}

void hjReadFont()
{
	hjTrace("hjReadFont");

	char		SectionName	[12];
	int			iRes		= 0;
	char		ValueName	[20];
    char		cValues		[50];
	int			i			= 0;
	int			e			= 0;

	strcpy(SectionName, "Config");
	strcpy(ValueName, "Name");

	iRes = hjReadCfgItem(HJ_DEFAULT_FONT_INI_FILENAME,
			SectionName,
			ValueName,
			&cValues,
			Cfg_String,
			1);
	if (iRes > 0)
	{
		strcpy(m_objhjMasterFont.Name, cValues);
	}
	else
	{
		hjTrace("hjReadFont - Error reading name");
	}


	for(i=33, e=0; i<127; i++, e++)
	{
		if (hjReadChar(i, &(m_objhjMasterFont.Chars[e])) != 0)
		{
			hjTrace("hjReadFont - Error reading Char");
			break;
		}
	}
}

void hjReadSWKeyFont()
{
	hjTrace("hjReadSWKeyFont");
	int			i			= 0;
	int			e			= 0;


	for(i=HJ_FONT_SWKEY_F1, e=HJ_FONT_SWKEY_F1_INDEX ; i<=HJ_FONT_SWKEY_F6; i++, e++)
	{
		if (hjReadSWKeyChar(i, &(m_objhjKeyFont.Chars[e])) != 0)
		{
			hjTrace("hjReadSWKeyFont - Error reading Char");
			break;
		}
	}
}

int hjReadChar(int iASCII, hjChar *objChar)
{
	char		SectionName	[12];
	int			iRes		= 0;
	char		ValueName	[20];
    char		cValues		[mc_iFontWidth * mc_iFontHeight];
	int			iIndex		= 0;
	int			x			= 0;
	int			y			= 0;

	if ((iASCII<33) || (iASCII>126))
	{
		hjTrace("hjReadChar - ASCII code out of bounds");
		return -1;
	}

	
	strcpy(SectionName, "Values");
	sprintf(ValueName, "Char_%d", iASCII);
	iRes = hjReadCfgItem(HJ_DEFAULT_FONT_INI_FILENAME,
			SectionName,
			ValueName,
			cValues,
			Cfg_String,
			(mc_iFontWidth * mc_iFontHeight));

	if (iRes > 0)
	{
		iIndex = 0;
		for (y=0; y<mc_iFontHeight; y++)
		{
			for (x=0; x<mc_iFontWidth; x++)
			{
				if (cValues[iIndex] == '1')
				{
					objChar->Pixel[x][y] = true;
				}
				else
				{
					objChar->Pixel[x][y] = false;
				}
				iIndex++;
			}
		}
		return 0;
	}
	else
	{
		hjTrace("hjReadChar - Error reading Char");
		return -1;
	}
}

int hjReadSWKeyChar(int iKeyCode, hjSWKeyChar *objChar)
{
	char		SectionName	[12];
	int			iRes		= 0;
	char		ValueName	[20];
    char		cValues		[mc_iFontSWKeysWidth * mc_iFontSWKeysHeight];
	int			iIndex		= 0;
	int			x			= 0;
	int			y			= 0;

	if ((iKeyCode<33) || (iKeyCode>126))
	{
		hjTrace("hjReadSWKeyChar - ASCII code out of bounds");
		return -1;
	}
	
	strcpy(SectionName, "Values");
	sprintf(ValueName, "Char_%d", iKeyCode);
	iRes = hjReadCfgItem(HJ_DEFAULT_FONT_INI_KEY_FILENAME,
			SectionName,
			ValueName,
			cValues,
			Cfg_String,
			(mc_iFontSWKeysWidth * mc_iFontSWKeysHeight));


	if (iRes > 0)
	{
		iIndex = 0;
		for (y=0; y<mc_iFontSWKeysHeight ; y++)
		{
			for (x=0; x<mc_iFontSWKeysWidth; x++)
			{
				if (cValues[iIndex] == '1')
				{
					objChar->Pixel[x][y] = true;
				}
				else
				{
					objChar->Pixel[x][y] = false;
				}
				iIndex++;
			}
		}
		return 0;
	}
	else
	{
		hjTraceN("hjReadSWKeyChar - Error reading Char:", iKeyCode);
		return -1;
	}


}



void hjPaintChar(int iASCII, int iX, int iY, DWORD lColor)
{
	hjChar * objChar;
	int i;
	int e;
	int x;
	int y;

	//hjTrace("hjPaintChar");

	objChar = &(m_objhjMasterFont.Chars[iASCII-33]);

	for(y=iY, i=0; y<(iY+mc_iFontHeight); y++, i++)
	{
		for(x=iX, e=0; x<(iX+mc_iFontWidth); x++, e++)
		{
			if (objChar->Pixel[e][i])
			{
				mvWritePixel(hjDevFont, BS_YC_PL_Y, x, y, lColor);
			}
		}
	}

}

void hjPrintNumber(int iNumber, int iX, int iY, DWORD lColor, bool bShadow)
{
	char	str[50];

	//hjTrace("hjPaintChar");
	if (bShadow)
	{
		hjPrintNumber(iNumber, iX+HJ_SHADOW_OFFSET, iY+HJ_SHADOW_OFFSET, HJ_COLOR_CUSTOM_SHADOW, false);
	}


	if (iNumber>=0)
	{
		sprintf(str, "+%d", iNumber);
	}
	else
	{
		sprintf(str, "%d", iNumber);
	}

	for(int i=0; (i<50) && (str[i]!='\0') ; i++)
	{
		hjPaintChar((int) str[i], iX, iY, lColor);
		iX = iX + mc_iFontWidth + 1;
	}
}

void hjPrintString(char *str, int iX, int iY, DWORD lColor, bool bShadow)
{
	//hjTrace("hjPrintString");
	if (bShadow)
	{
		hjPrintString(str, iX+HJ_SHADOW_OFFSET, iY+HJ_SHADOW_OFFSET, HJ_COLOR_CUSTOM_SHADOW, false);
	}

	for(int i=0; (i<255) && (str[i]!='\0') ; i++)
	{
		if ((str[i] > 32) && (str[i] < 127))
		{
			hjPaintChar((int) str[i], iX, iY, lColor);
		}
		iX = iX + mc_iFontWidth + 1;
	}


}


void hjPrintKeyChar(int iSWKeyCode, int iX, int iY, DWORD lColor, bool bShadow)
{
	hjSWKeyChar * objChar;
	int i;
	int e;
	int x;
	int y;

	//hjTrace("hjPrintKeyChar");
	if (bShadow)
	{
		hjPrintKeyChar(iSWKeyCode, iX+HJ_SHADOW_OFFSET, iY+HJ_SHADOW_OFFSET, HJ_COLOR_CUSTOM_SHADOW, false);
	}


	objChar =  &(m_objhjKeyFont.Chars[hjDecodeKeyChar(iSWKeyCode)]);

	for(y=iY, i=0; y<(iY+mc_iFontSWKeysHeight ); y++, i++)
	{
		for(x=iX, e=0; x<(iX+mc_iFontSWKeysWidth); x++, e++)
		{
			if (objChar->Pixel[e][i])
			{
				mvWritePixel(hjDevFont, BS_YC_PL_Y, x, y, lColor);
			}
		}
	}
}


int hjDecodeKeyChar(int iSWKeyCode)
{
	int iIndex = 0;

	switch (iSWKeyCode)
	{
		case HJ_FONT_SWKEY_F1:
			iIndex = HJ_FONT_SWKEY_F1_INDEX;
			break;
		case HJ_FONT_SWKEY_F2:
			iIndex = HJ_FONT_SWKEY_F2_INDEX;
			break;
		case HJ_FONT_SWKEY_F3:
			iIndex = HJ_FONT_SWKEY_F3_INDEX;
			break;
		case HJ_FONT_SWKEY_F4:
			iIndex = HJ_FONT_SWKEY_F4_INDEX;
			break;
		case HJ_FONT_SWKEY_F5:
			iIndex = HJ_FONT_SWKEY_F5_INDEX;
			break;
		case HJ_FONT_SWKEY_F6:
			iIndex = HJ_FONT_SWKEY_F6_INDEX;
			break;
		default:
			iIndex = 0;
	}

	return iIndex;
}