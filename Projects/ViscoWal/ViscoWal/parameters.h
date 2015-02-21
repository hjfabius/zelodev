#ifndef PARAMETERS_H
	#define PARAMETERS_H
	
	#include "common.h"


/*****************************************************************************/
// Variables declaration
/*****************************************************************************/
	
	#define PARAM_ALARM_OK					0x0000	
	#define PARAM_ALARM_MEASURING_VISCOSITY	0x0001		
	#define PARAM_ALARM_MEASURING_TEMPERATURE	0x0002
	#define PARAM_ALARM_PUMP_ON				0x0003
	
	#define PARAM_MODE_AUTO					0x00FF
	#define PARAM_MODE_MANUAL				0x0000
	#define PARAM_MODE_PAUSE				0x0001
	#define PARAM_MODE_OFF					0x0002
	
	
	#define PARAM_LANGUAGE_IT				0x0000
	#define PARAM_LANGUAGE_EN				0x0001
	#define PARAM_LANGUAGE_DE				0x0002
	#define PARAM_LANGUAGE_FR				0x0003
	#define PARAM_LANGUAGE_ES				0x0004
	
	#define PARAM_CUP_FORD_4				0x0000
	#define PARAM_CUP_ZHAN_2				0x0001
	
	

	#define PARAM_IDX_MIN					0
	#define PARAM_IDX_MAX					1
	#define PARAM_IDX_DEFAULT				2
	#define PARAM_IDX_JOB					3
	#define PARAM_IDX_EEPROM_APP_01			4
	
	#define JOB_NONE						255
	#define JOB_PARAMETERS					32
				
	#define PARAM_JOB  0
	#define PARAM_CALC_TEMPERATURE 1
	#define PARAM_CALC_VISCOSITY 2
	#define PARAM_CALC_PH 3
	#define PARAM_CALIBRATION_VALUE 4
	#define PARAM_IN_TEMPERATURE 5
	#define PARAM_IN_VISCOSITY 6
	#define PARAM_IN_PH 7
	#define PARAM_OUT_TEMPERATURE 8
	#define PARAM_OUT_VISCOSITY 9
	#define PARAM_OUT_PH 10
	#define PARAM_REF_VISCOSITY 11
	#define PARAM_REF_PH 12
	#define PARAM_ALARM 13
	#define PARAM_PAGE 14
	#define PARAM_PAGE_SEL 15
	#define PARAM_MODE 16
	#define PARAM_VALVES 17
	#define PARAM_VISUAL_SETUP_FULL 18
	#define PARAMETER_SETUP_INITIAL_INDEX 19
	#define PARAM_VISCOSITY_GAIN 19
	#define PARAM_VISCOSITY_DEAD_ZONE 20
	#define PARAM_INTERMEASURE 21
	#define PARAM_VISCOSITY_P 22
	#define PARAM_VISCOSITY_I 23
	#define PARAM_VISCOSITY_D 24
	#define PARAM_VISCOSITY_AVG 25
	#define PARAM_VISCOSITY_P_VISUAL 26
	#define PARAM_VISCOSITY_I_VISUAL 27
	#define PARAM_VISCOSITY_D_VISUAL 28
	#define PARAM_VISCOSITY_AVG_VISUAL 29
	#define PARAM_JUMP_ERROR 30
	#define PARAM_LANGUAGE 31
	#define PARAM_MACHINE_SERIAL_NUMBER 32
	#define PARAM_DISPLAY_DELAY 33
	#define PARAM_KEYBOARD_DELAY 34
	#define PARAM_CLOCK 35
	#define PARAM_ERROR_ZOOM 36
	#define PARAM_VISCO_MULT 37
	#define PARAM_VISCO_OFFSET 38
	#define PARAM_TEMP_MULT 39
	#define PARAM_TEMP_OFFSET 40
	#define PARAM_MAX_CORRECTION 41
	#define PARAM_ARMA 42
	#define PARAM_CUP 43
	#define PARAM_SHOW_CALIBRATION 44
	#define PARAM_VISCO_OFFSET_FACTORY 45
	#define PARAMETER_NUMBER 46




	
	#define JOB_PARAM_JOB  0
	#define JOB_PARAM_REF_VISCOSITY 1
	#define JOB_PARAM_REF_PH 2
	#define JOB_PARAM_VISCOSITY_GAIN 3
	#define JOB_PARAM_VISCOSITY_DEAD_ZONE 4







/*****************************************************************************/
// Function declaration
/*****************************************************************************/
	void parametersInit(void);
	BYTE parametersSaveJob(WORD a_woJob);
	BYTE parametersLoadJob(WORD a_woJob);
	void parametersLoadAll(BYTE a_byWithDefault);
	void parametersSaveAll(void);
	void parametersGet(BYTE a_byParameterIndex, WORD * a_woValue);
	WORD parametersGetValue(BYTE a_byParameterIndex);
	BYTE parametersSet(BYTE a_byParameterIndex, WORD a_woValue);
	void parametersChangedFlagReset(BYTE a_byParameterIndex);
	void parametersForceChangedFlag(BYTE a_byParameterIndex);
	BYTE parametersIsChanged(BYTE a_byParameterIndex);
	
	BYTE * parametersGetLabel(BYTE a_byParameterIndex);
	BYTE parametersVisible(BYTE a_byParameterIndex);
	void parametersInitVisibleFlags(void);
	void parametersInitVisibleFlagsSimple(void);
	WORD parametersGetSerialNumber(void);
	
#endif