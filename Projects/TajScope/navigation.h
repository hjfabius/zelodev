#ifndef NAVIGATION_H
	#define NAVIGATION_H
	
	#include "common.h"
	
/*****************************************************************************/
//	Constant definition
/*****************************************************************************/
	


	
	
	//define
	#define PAGE_NONE          0
	#define PAGE_UNKNOWN_CODE  1
	#define PAGE_MESSAGE       2
	#define PAGE_ALARM         3
	#define PAGE_REGISTER      4
	#define PAGE_OSCILLOSCOPE  5
	#define PAGE_PHASE_OSCILL  6
	#define PAGE_PHASE_FAST    7
	#define PAGE_F3            8
	#define PAGE_F4            9
	#define PAGE_F5           10
	#define PAGE_F6           11
	#define PAGE_P1           12
	#define PAGE_P2           13
	#define PAGE_P3           14
	#define PAGE_T1           15
	#define PAGE_T2           16
	#define PAGE_T3           17
	#define PAGE_T4           18
	#define PAGE_SETUP        19
	#define PAGE_MENU_01      20
	#define PAGE_MENU_02      21
	#define PAGE_MENU_03      22
	#define PAGE_MENU_04      23
	#define PAGE_MENU_05      24
	#define PAGE_MENU_06      25
	#define PAGE_P1_VALUE     26
	#define PAGE_P2_VALUE     27
	#define PAGE_P3_VALUE     28
	#define PAGE_COR_MINUS    29
	#define PAGE_COR_PLUS     30
	#define PAGE_COR_LEFT     31
	#define PAGE_COR_RIGHT    32
	#define PAGE_ARCHIVE      33







	#define MENU_GROUP_FUNCTION		1
	#define MENU_GROUP_PARAMETER	2
	#define MENU_GROUP_TEST			3
	#define MENU_GROUP_MENU			4
	

	#define	MENU6  		6
	#define VALUE		10

	#define PAGE_EXECUTE_F3 	203
	#define PAGE_EXECUTE_F4 	204
	#define PAGE_EXECUTE_F5 	205
	#define PAGE_EXECUTE_F6 	206

	#define PAGE_EXECUTE_T1 	207
	#define PAGE_EXECUTE_T2 	208
	#define PAGE_EXECUTE_T3 	209
	#define PAGE_EXECUTE_T4 	210
	
	#define PAGE_ZOOM_OUT 		211
	#define PAGE_ZOOM_IN 		212
	#define PAGE_GATE_RIGHT 	213
	#define PAGE_GATE_LEFT 		214
	#define PAGE_MODE_LAT 		215
	#define PAGE_MODE_LONG 		216
	#define PAGE_OFF 			217
	
	#define PAGE_SAVE			230
	#define PAGE_CHANGE_NUMBER  231

	#define PAGE_STACK			250
	#define NA					0	

	#define KEY_ANY_KEYS					(BYTE)0xFE 
	#define KEY_NULL						(BYTE)0xFF	
	#define KEY_ANY_KEYS_RELEASED			(BYTE)0xFC	

#endif
