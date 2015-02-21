#ifndef SCREEN_H
	#define SCREEN_H
	
	#include "common.h"
	
/*****************************************************************************/
// Costants declaration
/*****************************************************************************/

	#define  SCREEN_STD_MSG_INIT_PARAM			0
	#define  SCREEN_STD_MSG_WASHING 			1
	#define  SCREEN_STD_MSG_ADDING_SOLVENT		2
	#define  SCREEN_STD_MSG_CALIBRATION			3
	#define	 SCREEN_STD_MSG_RESET				4
	#define  SCREEN_STD_MSG_PARAMETER_SAVED		5
	#define  SCREEN_STD_MSG_CMD_DONE			6
	#define  SCREEN_STD_MSG_SW_VERSION			7
	#define	 SCREEN_STD_MSG_PARAMETER_VALUE_NA	8
	#define	 SCREEN_STD_MSG_LOAD_JOB			9
	#define	 SCREEN_STD_MSG_SAVE_JOB			10
	#define  SCREEN_STD_MSG_WRONG_MEMORY_SLOT	11
	#define  SCREEN_STD_MSG_CHECK_PUMP			12
	#define  SCREEN_STD_MSG_CMD_NA				13	
	
/*****************************************************************************/
// Functions declaration
/*****************************************************************************/
	void screenInit(void);
	void screenUpdateCurrentScreen(void);
	void screenMain(void);
	void screenAlarm(void);
	void screenBigStdMessage(BYTE a_byStdMessage);
	void screen6Menus(BYTE * a_byPage, BYTE * a_byGroup, BYTE * a_bySelected);
	void screenValue(BYTE * a_byPage, BYTE * a_byKey);
	void screenSetUpParameter(BYTE a_byKey, BYTE a_bySetupFull);
	void screenArchive(void);
	void screenVersion(void);
	
	void screenReceivedCode(BYTE a_byCode, BYTE a_byCode2, WORD a_woValue);
	void screenDisplayKeyCode(BYTE a_byKey);
	void screenKeyCode(void); 
	void screenHistoricalValues(void);
	
#endif