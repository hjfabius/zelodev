#ifndef DISPLAY_H
	#define DISPLAY_H
	
	#include "common.h"

	#define DISPLAY_CMD_BUFFER 128
	
/*****************************************************************************/
// Function declaration
/*****************************************************************************/
	void displayInit(void);
	void displayReset(void);
	//Return KEY_NULL if no key is pressed, the pressed key otherwise
	//BYTE isDisplayKeyPressed(void); 
	
	BYTE displayGetKeyPressed(void);
	void displayKeyPressedReset(void);
	BYTE displayIsKeyPressed(void);
	
	void displayCmdToDisplay(STRING a_strMessage);
	
	//static volatile BYTE 		m_enmKeyIRQReceived;
	//BYTE displayKeyPressed(void);
	//BYTE displayIsKeyPress(void);
	//extern BYTE ( *m_arbyDisplayPages )[ MATRIX_DISPLAY_PAGES_WIDTH ];
	

	void displayOff(void);
	void displayWriteString(BYTE * a_strValue, BYTE a_byFontSize, BYTE a_byX, BYTE a_byY);
	void displaySetArea(BYTE a_byLeft, BYTE a_byTop, BYTE a_byRight, BYTE a_byBottom);
	void displayClearArea(BYTE a_byLeft, BYTE a_byTop, BYTE a_byRight, BYTE a_byBottom);
	void displaySetOutLine(BYTE a_byLeft, BYTE a_byTop, BYTE a_byRight, BYTE a_byBottom, BYTE a_byReversed);
	void displayInvertArea(BYTE a_byLeft, BYTE a_byTop, BYTE a_byRight, BYTE a_byBottom);
	void displayDrawVerticalLine(BYTE a_byX, BYTE a_byTop, BYTE a_byLength);
	void displayDrawHorizontalLine(BYTE a_byY, BYTE a_byLeft, BYTE a_byWidth);
	void displayDrawSelector(BYTE a_byX, BYTE a_byY, BYTE a_byFilled, BYTE a_byReversed);
	void displayDrawCorrection(BYTE a_byX, BYTE a_byY, BYTE a_byWidth, BYTE a_byDirection);
	void displayDrawLed(BYTE a_byX, BYTE a_byY, BYTE a_byFilled);
	void displayDrawAlarm(BYTE a_byX, BYTE a_byY);
	void displayDrawBox(BYTE a_byLeft, BYTE a_byTop, BYTE a_byWidth, BYTE a_byHeigth, BYTE * a_strLabel, BYTE * a_strLabel2, WORD a_woValue, BYTE a_byLength, BYTE a_byDecimal, BYTE a_byRefresh);
	void displayKeyboardIRQ(void);


#endif
