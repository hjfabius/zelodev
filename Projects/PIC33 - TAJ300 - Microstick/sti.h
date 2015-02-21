#ifndef STI_H
	#define STI_H

	#include "common.h"

	/*---------------------------------------------------------------------------*/
	BYTE STI_MoveByte (BYTE a_byData);
	WORD STI_GetMessage(BYTE a_byParamCode);
	WORD STI_SendMessage(BYTE a_byCode, BYTE a_byAdditionalCode, WORD a_woValue);
	void STI_ReceiveMessage(BYTE * a_byCode, BYTE * a_byAdditionalCode, WORD * a_woValue);


	/* Functions */
	#define STI_NULL_ADDRESS					0xFF
	
	
	#define STI_FUNZ_READ_PARAM					0x80
	#define STI_FUNZ_WRITE_PARAM				0x81
	#define STI_FUNZ_PHASE_AUTO					0x82
	#define STI_FUNZ_INIT_Z80					0x83
	#define STI_FUNZ_TEST_SCANNING_HEAD			0x84
	#define STI_FUNZ_TEST_ENCODER				0x85
	#define STI_FUNZ_OFFSET_GAP					0x86
//	#define STI_FUNZ_OSCILL_ANTICIPATE			0x87
//	#define STI_FUNZ_OSCILL_DELAY				0x88
//	#define STI_FUNZ_OSCILL_STOP				0x89
	#define STI_FUNZ_SHIFT_REFERENCE_AUTO		0x8A
	#define STI_FUNZ_SHIFT_REFERENCE_MAN		0x8B
	#define STI_FUNZ_STOP_REFERENCE_MAN			0x8C
	#define STI_FUNZ_PHASE_FAST					0x8D
	#define STI_FUNZ_INIT_PARAM					0x8E
	#define STI_FUNZ_CANCEL_OPERATION			0x8F
	#define STI_FUNZ_GATE_CENTER				0x90
	#define STI_FUNZ_PHASE_MANUAL				0x91
	#define STI_FUNZ_TEST_OUTPUT				0x92
	#define STI_FUNZ_RESET						0x93
	#define STI_FUNZ_TWIN_APP_01				0x94
	#define STI_FUNZ_TWIN_APP_02				0x95
	
	/* Direction */
	#define STI_DIRECTION_A						0x03
	#define STI_DIRECTION_R						0x0C
	#define STI_DIRECTION_T						0x30
	#define STI_DIRECTION_O						0xC0
	#define STI_DIRECTION_I						0x00  
	#define STI_DIRECTION_D						0xFF
	
	/* Answers and Allarms */
	#define STI_ANSWER							0xC4
	
	#define STI_ANSWER_OK						0x0000
	
//	#define STI_ANSWER_ALARM_CYLINDER_TRAVEL	0 /*	1 */
//	#define STI_ANSWER_ALARM_GATE_WINDOW		1 /*	2 */
//	#define STI_ANSWER_ALARM_REFERENCE_SIGNAL	2 /*	4 */
//	#define STI_ANSWER_ALARM_ERR_GENERIC		3 /*	8 */
//		
//	#define STI_ANSWER_ALARM_ERR_NO_PRINT		4 /*   16 */
//	#define STI_ANSWER_ALARM_ERR_LOW_SPEED		5 /*   32 */
//	#define STI_ANSWER_ALARM_ERR_OUT_OF_BOUND  	6 /*   64 */ /*Non usato*/
//	#define STI_ANSWER_ALARM_ERR_DOUBLE_MARK  	7 /*  128 */
//	
//	#define STI_ANSWER_ALARM_ERR_TEST_SH		8 /*  256 */
//	#define STI_ANSWER_ALARM_ERR_TEST_ENC		9 /*  512 */
//	#define STI_ANSWER_ALARM_ERR_PHASE_AUTO		10 /*1024 */
//	#define STI_ANSWER_ALARM_ERR_DECELERATION	11 /*2048 */
//	
//	#define STI_ANSWER_ALARM_ERR_ACCELERATION	12 /*4096 */
//		
//	#define STI_ANSWER_ALARMS					0b0001111110111111
	

	#define STI_ANSWER_ALARM_ERR_TEST_SH			0 /*	 1 */
	#define STI_ANSWER_ALARM_ERR_TEST_ENC			1 /*	 2 */
	//#define STI_ANSWER_ALARM_ERR_PHASE_AUTO			2 /*	 4 */
	#define STI_ANSWER_ALARM_ERR_DECELERATION		3 /*	 8 */
	
	#define STI_ANSWER_ALARM_ERR_ACCELERATION		4 /*    16 */
	
	#define STI_ANSWER_ALARM_CYLINDER_TRAVEL		8 /*   256 */
	#define STI_ANSWER_ALARM_GATE_WINDOW			9 /*   512 */
	#define STI_ANSWER_ALARM_REFERENCE_SIGNAL		10 /* 1024 */
	#define STI_ANSWER_ALARM_ERR_GENERIC			11 /* 2048 */
	
	#define STI_ANSWER_ALARM_ERR_NO_PRINT			12 /* 4096 */
	#define STI_ANSWER_ALARM_ERR_LOW_SPEED			13 /* 8192 */
	#define STI_ANSWER_ALARM_ERR_OUT_OF_BOUND  		14 /*16384 */ /*Non usato*/
	#define STI_ANSWER_ALARM_ERR_DOUBLE_MARK  		15 /*32768 */
		
	#define STI_ANSWER_ALARMS						0b1011111100011111



	//#define STI_ANSWER_PERMANET_ALARMS			0b0001100001111111
	
	//#define STI_ANSWER_TIMEOUT					0xFFFF

	/* Parameters */
	#define STI_PARAM_CYLINDER_TRAVEL			0x00
	#define STI_PARAM_ALARM_BOUND				0x01
	#define STI_PARAM_GATE_WINDOW				0x02
	#define STI_PARAM_MM_SIGNAL_POSITION		0x03
	#define STI_PARAM_VARIATION_SPEED			0x04
	#define STI_PARAM_LONG_GAIN					0x05
	#define STI_PARAM_TRANS_GAIN				0x06
	#define STI_PARAM_LONG_INTERVAL				0x07
	#define STI_PARAM_TRANS_INTERVAL			0x08
	#define STI_PARAM_LONG_DEAD_ZONE			0x09
	#define STI_PARAM_TRANS_DEAD_ZONE			0x0A
	#define STI_PARAM_LONG_MOTOR_SPEED			0x0B
	#define STI_PARAM_TRANS_MOTOR_SPEED			0x0C	
	#define STI_PARAM_MODE_LONG					0x0D
	#define STI_PARAM_MODE_TRANS				0x0E
	#define STI_PARAM_JUMP_ERROR				0x0F
	#define STI_PARAM_LONG_DERIVATIVE			0x10
	#define STI_PARAM_INSERTION_SPEED_THRESHOLD	0x11
	#define STI_PARAM_LANGUAGE					0x12
	#define STI_PARAM_REFERENCE_SIGNAL			0x13
	#define STI_PARAM_MARK_SHAPE				0x14
	#define STI_PARAM_AUTO_REGISTER_AFTER_F4	0x15
	#define STI_PARAM_REVERSAL_CORRECTION		0x16
	#define STI_PARAM_MM_MC						0x17
	#define STI_PARAM_PROGRAM_VERSION			0x18
	#define STI_PARAM_SH_GAIN					0x19
	#define STI_PARAM_ERROR_A					0x1A
	#define STI_PARAM_ERROR_R					0x1B
	#define STI_PARAM_CORRECTIONS				0x1C
	#define STI_PARAM_LONG_DAC_ENABLE			0x1D
	#define STI_PARAM_TRANS_DAC_ENABLE			0x1E
	#define STI_PARAM_PULL_DAC_ENABLE			0x1F
	#define STI_PARAM_SPEED						0x20
	#define STI_PARAM_BASE_VALUE_DAC			0x21
	#define STI_PARAM_DELTA_COR_DAC				0x22
	#define STI_PARAM_MODE_PULL					0x23
	#define STI_PARAM_DELTA_COR_TENS_DAC		0x24
	#define STI_PARAM_MANUAL_GAIN_DAC			0x25
		
	#define STI_PARAM_ALARM_STATUS				0x26

	#define STI_PARAM_GATE01_START				0x28
	#define STI_PARAM_ZERO_ENCODER				0x29
	#define STI_PARAM_PULL_GAIN					0x2A
	#define STI_PARAM_PULL_INTERVAL				0x2B
	#define STI_PARAM_PULL_ENABLE				0x2C
	#define STI_PARAM_TRANS_ENABLE				0x2D
	#define STI_PARAM_CURRENT_JOB				0x2E
	#define STI_PARAM_GATE01_REFERENCE			0x2F
	#define STI_PARAM_COLD_SEAL_ENABLE			0x30
	#define STI_PARAM_ERROR_ZOOM				0x31
	#define STI_PARAM_TWIN_APPLICATION_01		0x32
	#define STI_PARAM_TWIN_APPLICATION_02		0x33
	#define STI_PARAM_TWIN_CURRENT_APPLICATION	0x34
	#define STI_PARAM_CURRENT_ENCODER			0x35
	#define STI_PARAM_F4_DIMENSION				0x36
	#define STI_PARAM_SH_PN_ENABLE				0x37
	#define STI_PARAM_SH_PN								0x38
	#define STI_PARAM_OFFSET_DAC					0x39
	#define STI_PARAM_ALARM_DELAY					0x3A
	//#define STI_PARAM_SCREEN_REFRESH   		0x3B
	
	//#define STI_SETUP_NUMBERS					0x20

	
	
	
	
	void STI_GateGeneration(void);

	void STI_Calculation(void);
											/* STI_FUNZ_READ_PARAM				*/
											/* STI_FUNZ_WRITE_PARAM				*/
	BYTE STI_PhaseAutomatic(void);			/* STI_FUNZ_PHASE_AUTO				*/
	BYTE STI_PhaseManual(void);				/* STI_FUNZ_PHASE_MANUAL			*/
	
	void STI_InitZ80(void);					/* STI_FUNZ_INIT_Z80				*/
	BYTE STI_TestScanningHead(void);		/* STI_FUNZ_TEST_SCANNING_HEAD		*/
	BYTE STI_TestEncoder(void);				/* STI_FUNZ_TEST_ENCODER			*/
	BYTE STI_TestOutput(void);				/* STI_FUNZ_TEST_OUTPUT				*/
	void STI_OffsetGap(void);				/* STI_FUNZ_OFFSET_GAP				*/
	void STI_ShiftReferenceAuto(void);		/* STI_FUNZ_SHIFT_REFERENCE_AUTO	*/
	void STI_ShiftReferenceManual(BYTE a_byDirection);	/* STI_FUNZ_SHIFT_REFERENCE_MAN		*/
	void STI_StopReferenceManual(void);		/* STI_FUNZ_STOP_REFERENCE_MAN		*/
	void STI_PhaseFast(void);				/* STI_FUNZ_PHASE_FAST				*/
	void STI_InitParam(void);				/* STI_FUNZ_INIT_PARAM				*/
	void STI_CancelOperation(void);			/* STI_FUNZ_CANCEL_OPERATION		*/
	void STI_CenterGate(void);				/* STI_FUNZ_GATE_CENTER				*/
	void STI_Reset(void);					/* STI_FUNZ_RESET					*/
	void STI_TwinApp01(void);				/* STI_FUNZ_TWIN_APP_01				*/
	void STI_TwinApp02(void);				/* STI_FUNZ_TWIN_APP_02				*/
	
	
	void STI_ExecuteCalculationMarkCylinder(void);
	void STI_ExecuteCalculationMarkMark(void);
	void STI_ExecutePrecalculation(void);
	void STI_ConvertAcquisitionToDouble(void);
	
#endif
