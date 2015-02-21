#ifndef DISPLAY_APPLICATION_H
	#define DISPLAY_APPLICATION_H
	
	#include "common.h"

	#define KEY_NUM_0				0
	#define KEY_NUM_1				1
	#define KEY_NUM_2				2
	#define KEY_NUM_3				3
	#define KEY_NUM_4				4
	#define KEY_NUM_5				5
	#define KEY_NUM_6				6
	#define KEY_NUM_7				7
	#define KEY_NUM_8				8
	#define KEY_NUM_9				9
	#define KEY_OK					10
	#define KEY_CANCEL				11
	#define KEY_FUNCTION			12
	#define KEY_PARAM				13
	#define KEY_SETUP				14
	#define KEY_MENU				15
	#define KEY_TEST				16
	#define KEY_OFF					17
	#define KEY_MODE_LONG			18
	#define KEY_MODE_LAT			19
	#define KEY_ARROW_UP			20
	#define KEY_ARROW_DOWN			21
	#define KEY_ARROW_LEFT			22
	#define KEY_ARROW_RIGHT			23
	#define KEY_CORRECTION_UP		24
	#define KEY_CORRECTION_DOWN		25
	#define KEY_CORRECTION_LEFT		26
	#define KEY_CORRECTION_RIGHT	27
	#define KEY_GATE_LEFT			28			
	#define KEY_GATE_RIGHT			29
	#define KEY_ZOOM_IN				30
	#define KEY_ZOOM_OUT			31
	
	#define KEY_RELEASED			32


/*****************************************************************************/
// Function declaration
/*****************************************************************************/
	void displayAppInit(void);
	void displayAppLoop(void);
	void  displayAppShowMessages(void);
#endif