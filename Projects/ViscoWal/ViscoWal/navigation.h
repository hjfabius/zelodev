#ifndef NAVIGATION_H
	#define NAVIGATION_H
	
	#include "common.h"
	
/*****************************************************************************/
//	Constant definition
/*****************************************************************************/
	#define PAGE_NONE               0
	#define PAGE_UNKNOWN_CODE       1
	#define PAGE_MESSAGE            2
	#define PAGE_ALARM              3
	#define PAGE_MAIN               4
	#define PAGE_SETUP              5
	#define PAGE_MENU_01            6
	#define PAGE_MENU_02            7
	#define PAGE_MENU_03            8
	#define PAGE_MENU_04            9
	#define PAGE_MENU_05           10
	#define PAGE_MENU_06           11
	#define PAGE_A1                12
	#define PAGE_A2                13
	#define PAGE_ARCHIVE_SAVE      14
	#define PAGE_ARCHIVE_LOAD      15
	#define PAGE_ADD_SOLVENT       16
	#define PAGE_WASHING           17
	#define PAGE_CALIBRATION       18
	#define PAGE_HISTORY_VALUE     19
	#define PAGE_CUP_01            20
	#define PAGE_CUP_02            21
	#define PAGE_SETUP_FULL        22




	#define MENU_GROUP_MENU				1
	#define MENU_GROUP_ARCHIVE			2
	#define MENU_GROUP_CUP			3
	

	#define	MENU6  						6
	#define VALUE						10

	#define PAGE_EXECUTE_MODE 			201
	#define PAGE_EXECUTE_PAUSE 			202
	#define PAGE_EXECUTE_OFF 			203
	#define PAGE_EXECUTE_LOAD			204
	#define PAGE_EXECUTE_SAVE			205
	#define PAGE_EXECUTE_VERSION 		206
	#define PAGE_EXECUTE_CALIBRATION	207
	#define PAGE_EXECUTE_CALIBRATION_2  208
	#define PAGE_EXECUTE_CUP_01			209
	#define PAGE_EXECUTE_CUP_02  		210
	#define PAGE_EXECUTE_RESET_CALIBRATION 211

	#define PAGE_STACK					250
	#define NA							0	

	#define KEY_ANY_KEYS					(BYTE)0xFE 
	#define KEY_NULL						(BYTE)0xFF	
	#define KEY_ANY_KEYS_RELEASED			(BYTE)0xFC	

#endif
