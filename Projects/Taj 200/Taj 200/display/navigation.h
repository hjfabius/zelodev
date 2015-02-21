#ifndef NAVIGATION_H
	#define NAVIGATION_H
	
	#include "common.h"
	
/*****************************************************************************/
//	Constant definition
/*****************************************************************************/
		
	#define PAGE_NONE          0
	#define PAGE_UNKNOWN_CODE  1
	#define PAGE_MESSAGE       2
	#define PAGE_ALARM         3
	#define PAGE_REGISTER      4
	#define PAGE_OSCILLOSCOPE  5
	#define PAGE_PHASE_OSCILL  6
	#define PAGE_PHASE_FAST    7
	#define PAGE_F1            8
	#define PAGE_F3            9
	#define PAGE_F4           10
	#define PAGE_F5           11
	#define PAGE_F6           12
	#define PAGE_P1           13
	#define PAGE_P2           14
	#define PAGE_P3           15
	#define PAGE_P4           16
	#define PAGE_P5           17
	#define PAGE_P6           18
	#define PAGE_T1           19
	#define PAGE_T2           20
	#define PAGE_T3           21
	#define PAGE_T4           22
	#define PAGE_T5           23
	#define PAGE_T6           24
	#define PAGE_SETUP        25
	#define PAGE_MENU_01      26
	#define PAGE_MENU_02      27
	#define PAGE_MENU_03      28
	#define PAGE_MENU_04      29
	#define PAGE_MENU_05      30
	#define PAGE_MENU_06      31
	#define PAGE_P1_VALUE     32
	#define PAGE_P2_VALUE     33
	#define PAGE_P3_VALUE     34
	#define PAGE_P4_VALUE     35
	#define PAGE_P5_VALUE     36
	#define PAGE_P6_VALUE     37
	#define PAGE_COR_MINUS    38
	#define PAGE_COR_PLUS     39
	#define PAGE_COR_LEFT     40
	#define PAGE_COR_RIGHT    41
	#define PAGE_A1           42
	#define PAGE_A2           43
	#define PAGE_ARCHIVE_SAVE 44
	#define PAGE_ARCHIVE_LOAD 45
	#define PAGE_TWIN_APP_01  46
	#define PAGE_TWIN_APP_02  47
	#define PAGE_ENCODER_01   48
	#define PAGE_ENCODER_02   49
	#define PAGE_SH_PN_01     50
	#define PAGE_SH_PN_02     51



	#define MENU_GROUP_FUNCTION		1
	#define MENU_GROUP_PARAMETER	2
	#define MENU_GROUP_TEST			3
	#define MENU_GROUP_MENU			4
	#define MENU_GROUP_ARCHIVE		5
	#define MENU_GROUP_APP			6
	#define	MENU_GROUP_ENC			7
	#define MENU_GROUP_SH_PN		8
	

	#define	MENU6  		6
	#define VALUE		10

	#define PAGE_EXECUTE_F1 	201
	#define PAGE_EXECUTE_F2 	202
	#define PAGE_EXECUTE_F3 	203
	#define PAGE_EXECUTE_F4 	204
	#define PAGE_EXECUTE_F5 	205
	#define PAGE_EXECUTE_F6 	206

	#define PAGE_EXECUTE_T1 	207
	#define PAGE_EXECUTE_T2 	208
	#define PAGE_EXECUTE_T3 	209
	#define PAGE_EXECUTE_T4 	210
	#define PAGE_EXECUTE_T5 	211
	#define PAGE_EXECUTE_T6 	212
	
	#define PAGE_ZOOM_OUT 		213
	#define PAGE_ZOOM_IN 		214
	#define PAGE_GATE_RIGHT 	215
	#define PAGE_GATE_LEFT 		216
	#define PAGE_MODE_LAT 		217
	#define PAGE_MODE_LONG 		218
	#define PAGE_OFF 			219
	#define PAGE_GAIN_UP		220
	#define PAGE_GAIN_DOWN		221
	
	#define PAGE_SAVE			230
	#define PAGE_CHANGE_NUMBER  231

	#define PAGE_EXECUTE_APP_01	232
	#define PAGE_EXECUTE_APP_02	233

	#define PAGE_EXECUTE_ENC_01 234
	#define PAGE_EXECUTE_ENC_02 235
	
	#define PAGE_EXECUTE_SH_PN_01 	236
	#define PAGE_EXECUTE_SH_PN_02 	237
	#define PAGE_SH_PN_00						238
	#define PAGE_TWIN_APP_00				239
	#define PAGE_ENCODER_00 				240
	


	#define PAGE_STACK			250
	#define NA					0	

	#define KEY_ANY_KEYS					(BYTE)0xFE 
	#define KEY_NULL						(BYTE)0xFF	
	#define KEY_ANY_KEYS_RELEASED			(BYTE)0xFC	

#endif
