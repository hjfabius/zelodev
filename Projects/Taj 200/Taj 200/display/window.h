#ifndef WINDOW_H
	#define WINDOW_H
	
	#include "common.h"

/*****************************************************************************/
// Costants declaration
/*****************************************************************************/
	#define WINDOW_3_LEFT 			0
	#define WINDOW_3_TOP 			18
	#define WINDOW_3_HEIGTH 		46
	#define WINDOW_3_WIDTH 			126
	
	#define WINDOW_3_RIGHT 			WINDOW_3_LEFT + WINDOW_3_WIDTH
	#define WINDOW_3_BOTTOM 		WINDOW_3_TOP + WINDOW_3_HEIGTH
	
	#define WINDOW_3_GATE_LOW_Y		40
	#define WINDOW_3_GATE_HIGH_Y	35
	#define WINDOW_3_OSCILLOSCOPE_Y	60


/*****************************************************************************/
// Functions declaration
/*****************************************************************************/
	void windowInit(void);	
	void windowMode(void);
	void windowSpeed(void);
	void windowDacValue(void);
	void windowCylinderSizeValue(void);
	//void windowMessage(BYTE * a_strMessage1, BYTE * a_strMessage2);
	void windowBigMessage(BYTE * a_strMessage1, BYTE * a_strMessage2);
	void windowAlarm(void);
	void windowOscilloscope(BYTE a_byPage);
	void windowRegister(void);
	void windowForceRepaint(void);
	void windowForceRepaintAlarm(void);
	BYTE windowSetupParameter(BYTE a_byOffset, WORD a_woCurrentValue);
	void window6Menu(BYTE * a_byGroup, BYTE * a_bySelected);

#endif