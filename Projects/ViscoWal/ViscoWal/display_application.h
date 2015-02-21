#ifndef DISPLAY_APPLICATION_H
	#define DISPLAY_APPLICATION_H
	
	#include "common.h"

	#define KEY_OK					0
	#define KEY_CANCEL				1
	#define KEY_MENU				2
	#define KEY_ARCHIVE				3
	#define KEY_OFF					4
	#define KEY_PAUSE				5
	#define KEY_MODE				6
	#define KEY_VISUAL				7
	#define KEY_ARROW_UP			8
	#define KEY_ARROW_DOWN			9
	#define KEY_ARROW_UP_F			10
	#define KEY_ARROW_DOWN_F		11
	#define KEY_FUNCTION			12
	#define KEY_WASHING				13
	#define KEY_PH					14
	#define KEY_SOLVENT				15
	#define KEY_R_SOLVENT			16
	#define KEY_R_INK				17
	#define KEY_R_BOTH				18
	#define KEY_RELEASED			19


/*****************************************************************************/
// Function declaration
/*****************************************************************************/
	void displayAppInit(void);
	void displayAppLoop(void);
#endif