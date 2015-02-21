#ifndef SCREEN_H
	#define SCREEN_H
	
	#include "common.h"
	
/*****************************************************************************/
// Costants declaration
/*****************************************************************************/


/*****************************************************************************/
// Functions declaration
/*****************************************************************************/
	void screenInit(void);
	void screenOscilloscope(BYTE a_byPage);
	void screenRegister(void);
	void screenAlarm(void);
	void screenBigMessage(BYTE * a_strMessage1, BYTE * a_strMessage2);
	void screen6Menus(BYTE * a_byPage, BYTE * a_byGroup, BYTE * a_bySelected);
	
	void screenReceivedCode(BYTE a_byCode, BYTE a_byCode2, WORD a_woValue);
	void screenDisplayKeyCode(BYTE a_byKey);
	void screenKeyCode(void); 
	
#endif