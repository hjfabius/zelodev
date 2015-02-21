#include "screen.h"

/*****************************************************************************/
// Variables declaration
/*****************************************************************************/
WORD m_woCurrentValue;
BYTE m_byValueChanged;
BYTE m_strString1[20];
BYTE m_strString2[20];

/*****************************************************************************/
// Functions declaration
/*****************************************************************************/

/*****************************************************************************/
void screenInit(void)
{	
	windowInit();
}

/*****************************************************************************/
void screenReceivedCode(BYTE a_byCode, BYTE a_byCode2, WORD a_woValue)
{
	BYTE i;
	WORD j;
	BYTE strString[16];


	displayClearArea(0, 0, 126, 126);
	displaySetOutLine(0, 0, 126, 126, false);


	strString[12] = 0x00;
	memcpy(strString, "Code 1 = ", 9); 
	formatNumber(a_byCode, 3, 0, strString+9);
	displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 10, 10);
	

	memcpy(strString, "Code 2 = ", 9); 
	formatNumber(a_byCode2, 3, 0, strString+9);
	displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 10, 20);

	strString[15] = 0x00;
	memcpy(strString, "Value  = ", 9); 
	formatNumber(a_woValue, 6, 0, strString+9);
	displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 10, 30);
	
	parametersSet(PARAM_PAGE, PAGE_UNKNOWN_CODE);		
}

/*****************************************************************************/
void screenKeyCode(void)
{
	screenDisplayKeyCode(isDisplayKeyPressed());
}

/*****************************************************************************/
void screenDisplayKeyCode(BYTE a_byKey)
{
	BYTE strString[15];
	BYTE i;

	if (a_byKey != KEY_NULL)
	{
		displayClearArea (0, 0, 126, 126);
		displaySetOutLine(0, 0, 126, 126, false);	
		strString[0] = DISPLAY_CURSOR_POSITION;
		strString[1] = 0x0A;
		strString[2] = 0x0A;
		strString[3] = DISPLAY_WAIT;
		strString[4] = DISPLAY_EOF;
		displayCmdToDisplay(strString);

		for (i=0x00;i<15; i++)
		{
			strString[i] = 0x00;
		}
		memcpy(strString, "KeyPad = ", 9); 
		formatNumber(a_byKey, 3, 0, strString+9);
		displayCmdToDisplay(strString);		
	}
}


/*****************************************************************************/
void screenOscilloscope(BYTE a_byPage)
{
	//windowMode();
	//windowSpeed();
	windowOscilloscope(0xFF, a_byPage);
	parametersSet(PARAM_PAGE, a_byPage);	
}

/*****************************************************************************/
void screenAlarm(void)
{
	windowMode();
	windowSpeed();
	windowAlarm();
	parametersSet(PARAM_PAGE, PAGE_ALARM);	
}

/*****************************************************************************/
void screenBigMessage(BYTE * a_strMessage1, BYTE * a_strMessage2)
{
	windowBigMessage(a_strMessage1, a_strMessage2);
	windowForceRepaint();	
	parametersSet(PARAM_PAGE, PAGE_MESSAGE);
}

/*****************************************************************************/
void screen6Menus(BYTE * a_byPage, BYTE * a_byGroup, BYTE * a_bySelected)
{
	window6Menu(a_byGroup, a_bySelected);
	parametersSet(PARAM_PAGE, *a_byPage);	
}


