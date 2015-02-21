#ifndef STI_H
	#define STI_H

	#include "common.h"

	/*---------------------------------------------------------------------------*/
	BYTE STI_MoveByte (BYTE a_byData);
	void STI_GetMessage(BYTE * a_byCode, BYTE * a_byAdditionalCode, WORD * a_woValue);
	WORD STI_SendMessage(BYTE a_byCode, BYTE a_byAdditionalCode, WORD a_woValue);


	/* Functions */
	#define STI_FUNZ_READ_PARAM					0x80
	#define STI_FUNZ_WRITE_PARAM				0x81
	#define STI_FUNZ_PHASE_AUTO					0x82
	#define STI_FUNZ_PHASE_OSCILL				0x83
	#define STI_FUNZ_TEST_SCANNING_HEAD			0x84
	#define STI_FUNZ_TEST_ENCODER				0x85
	#define STI_FUNZ_OFFSET_GAP					0x86
	#define STI_FUNZ_OSCILL_ANTICIPATE			0x87
	#define STI_FUNZ_OSCILL_DELAY				0x88
	#define STI_FUNZ_OSCILL_STOP				0x89
	#define STI_FUNZ_SHIFT_REFERENCE_AUTO		0x8A
	#define STI_FUNZ_SHIFT_REFERENCE_MAN		0x8B
	#define STI_FUNZ_STOP_REFERENCE_MAN			0x8C
	#define STI_FUNZ_PHASE_FAST					0x8D
	#define STI_FUNZ_INIT_PARAM					0x8E
	#define STI_FUNZ_CANCEL_OPERATION			0x8F
	#define STI_FUNZ_GATE_CENTER				0x90
	#define STI_FUNZ_PHASE_MANUAL				0x91
	
	/* Direction */
	#define STI_DIRECTION_A						0x03
	#define STI_DIRECTION_R						0x0C
	#define STI_DIRECTION_T						0x30  /* TODO: Changed from 0x28, check on Taj 200 */
	#define STI_DIRECTION_O						0xC0
	
	/* Answers and Allarms */
	#define STI_ANSWER							0xC4
	
	#define STI_ANSWER_OK						0x0000
	
	#define STI_ANSWER_ALARM_CYLINDER_TRAVEL	8
	#define STI_ANSWER_ALARM_GATE_WINDOW		9
	#define STI_ANSWER_ALARM_REFERENCE_SIGNAL	10 
	#define STI_ANSWER_ALARM_ERR_GENERIC		11
	#define STI_ANSWER_ALARM_ERR_NO_PRINT		12
	#define STI_ANSWER_ALARM_ERR_LOW_SPEED		13
	#define STI_ANSWER_ALARM_ERR_OUT_OF_BOUND  	14

	#define STI_ANSWER_ALARM_ERR_TEST_SH		0
	#define STI_ANSWER_ALARM_ERR_TEST_ENC		1
	#define STI_ANSWER_ALARM_ERR_PHASE_AUTO		2
	#define STI_ANSWER_ALARMS					0b0011111100000111
	
	#define STI_ANSWER_TIMEOUT					0xFFFF

	/* Parameters */
	#define STI_PARAM_CYLINDER_TRAVEL			0x00
	#define STI_PARAM_ALLARM					0x01
	#define STI_PARAM_GATE_WINDOW				0x02

	#define STI_PARAM_MODE_LONG					0x0D
	#define STI_PARAM_MODE_TRANS				0x0E
	
	#define STI_PARAM_PROGRAM_VERSION			0x18

	#define STI_PARAM_MINIMUM_SPEED				0x11
	#define STI_PARAM_ERROR_A					0x1A
	#define STI_PARAM_ERROR_R					0x1B
	#define STI_PARAM_CORRECTIONS				0x1C
	#define STI_PARAM_SPEED						0x20
	#define STI_PARAM_ERROR_T					0x1A
	#define STI_PARAM_ERROR_O					0x1B
	#define STI_PARAM_ALARM_STATUS				0x26
	#define STI_PARAM_ENC_SIGNAL				0x28


	#define STI_SETUP_NUMBERS					0x20



#endif