#ifndef SCREEN_H
	#define SCREEN_H
	
	#include "common.h"
	
/*****************************************************************************/
// Costants declaration
/*****************************************************************************/

	#define  SCREEN_STD_MSG_INIT_PARAM			0
	#define  SCREEN_STD_MSG_PHASE_MAN			1
	#define  SCREEN_STD_MSG_PHASE_FAST			2
	#define  SCREEN_STD_MSG_PHASE_OSCIL			3
	#define  SCREEN_STD_MSG_PHASE_AUTO			4
	#define  SCREEN_STD_MSG_TEST_SH				5
	#define  SCREEN_STD_MSG_TEST_ENC			6
	#define  SCREEN_STD_MSG_TEST_OUTPUT			7
	#define  SCREEN_STD_MSG_TEST_4				8
	#define  SCREEN_STD_MSG_TEST_5				9
	#define  SCREEN_STD_MSG_TEST_6				10
	#define  SCREEN_STD_MSG_PARAM_5				11		
	#define  SCREEN_STD_MSG_PARAM_6				12
	#define  SCREEN_STD_MSG_PHASE_OK			13
	#define  SCREEN_STD_MSG_SPEED_ZERO			14
	#define  SCREEN_STD_MSG_SPEED_TOO_FAST		15
	#define  SCREEN_STD_MSG_PHASE_MAN_ERR		16
	#define  SCREEN_STD_MSG_PHASE_AUTO_ERR		17
	#define  SCREEN_STD_MSG_TEST_OK				18
	#define  SCREEN_STD_MSG_TEST_SH_ERR			19
	#define  SCREEN_STD_MSG_TEST_ENC_ERR		20
	#define  SCREEN_STD_MSG_VISUAL_OSCILLOSCOPE	21
	#define  SCREEN_STD_MSG_CORRECTION_TRANS	22
	#define  SCREEN_STD_MSG_OFFSET_DISTANCE		23
	#define  SCREEN_STD_MSG_PARAMETER_SAVED		24
	#define  SCREEN_STD_MSG_CMD_DONE			25
	#define  SCREEN_STD_MSG_SW_VERSION			26
	#define  SCREEN_STD_MSG_UNKNOWN_CODE		27
	#define  SCREEN_STD_MSG_UNKNOWN_ADDCODE		28
	#define  SCREEN_STD_MSG_CYLINDER_TRAVEL		29
	#define  SCREEN_STD_MSG_ALLARM				30
	#define  SCREEN_STD_MSG_GATE_WINDOW			31
	#define  SCREEN_STD_MSG_DIRECTION_A			32
	#define  SCREEN_STD_MSG_DIRECTION_R			33
	#define  SCREEN_STD_MSG_DIRECTION_T			34
	#define  SCREEN_STD_MSG_DIRECTION_O			35
	#define  SCREEN_STD_MSG_DIRECTION_I			36
	#define  SCREEN_STD_MSG_DIRECTION_D			37
	#define	 SCREEN_STD_MSG_RESET_ERROR			38
	#define  SCREEN_STD_MSG_PHASE_DOUBLE_MARK	39
	#define	 SCREEN_STD_MSG_PARAMETER_VALUE_NA	40
	#define	 SCREEN_STD_MSG_LOAD_JOB			41
	#define	 SCREEN_STD_MSG_SAVE_JOB			42
	#define  SCREEN_STD_MSG_WRONG_MEMORY_SLOT	43
	#define  SCREEN_STD_MSG_ERR_TEST_OUTPUT     44
	
/*****************************************************************************/
// Functions declaration
/*****************************************************************************/
	void screenInit(void);
	void screenUpdateCurrentScreen(void);
	void screenOscilloscope(BYTE a_byPage);
	void screenRegister(void);
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
	
#endif