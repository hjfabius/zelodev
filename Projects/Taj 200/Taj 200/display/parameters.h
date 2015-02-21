#ifndef PARAMETERS_H
	#define PARAMETERS_H
	
	#include "common.h"


/*****************************************************************************/
// Variables declaration
/*****************************************************************************/
	
	
	#define PARAM_MODE_AUTO					0x00FF
	#define PARAM_MODE_MANUAL				0x0000
	//#define PARAM_MODE_PAUSE				0x0001
	//#define PARAM_MODE_STANDBY			0x0002
	
	
	#define PARAM_LANGUAGE_IT				0x0001
	#define PARAM_LANGUAGE_EN				0x0002
	#define PARAM_LANGUAGE_FR				0x0003
	#define PARAM_LANGUAGE_ES				0x0004
	#define PARAM_LANGUAGE_DE				0x0005


	#define PARAM_TWIN_APPLICATION_NONE		0x0000
	#define PARAM_TWIN_APPLICATION_FBSIDE	0x0001
	#define PARAM_TWIN_APPLICATION_INSETTER 0x0002
	#define PARAM_TWIN_APPLICATION_CUT  	0x0003
	#define PARAM_TWIN_APPLICATION_WEBFOLD  0x0004
	#define PARAM_TWIN_APPLICATION_PERFORAT 0x0005
	#define PARAM_TWIN_APPLICATION_FSIDE	0x0006
	#define PARAM_TWIN_APPLICATION_BSIDE	0x0007


	#define PARAM_IDX_MIN					0
	#define PARAM_IDX_MAX					1
	#define PARAM_IDX_DEFAULT				2
	#define PARAM_IDX_ADDRESS				3
	#define PARAM_IDX_JOB					4
	#define PARAM_IDX_EEPROM_APP_01				5
	#define PARAM_IDX_EEPROM_APP_02				6
	
	#define JOB_NONE					255
	#define JOB_PARAMETERS					32
	
		
			
	#define PARAM_JOB  0
	#define PARAM_CYLINDER_TRAVEL 1
	#define PARAM_GATE_WINDOW 2
	#define PARAM_ENCODER_NP 3
	#define PARAM_ALARM_BOUND 4
	#define PARAM_SPEED 5
	#define PARAM_SH_GAIN 6
	#define PARAM_ALARM 7
	#define PARAM_PAGE 8
	#define PARAM_PAGE_SEL 9
	#define PARAM_MODE_LONG 10
	#define PARAM_MODE_TRANS 11
	#define PARAM_MODE_PULL 12
	#define PARAM_CORRECTION 13
	#define PARAM_ERR_LONG 14
	#define PARAM_ERR_TRANS 15
	#define PARAM_OSCIL_ZOOM 16
	#define PARAM_OSCIL_OFFSET 17
	#define PARAM_OSCIL_MANUAL_OFFSET 18
	#define PARAM_ERR_BOUND_LONG 19
	#define PARAM_VISUAL_SETUP_FULL 20
	#define PARAM_OFF 21
	#define PARAM_TWIN_CURRENT_APPLICATION 22
	#define PARAM_CURRENT_ENCODER 23
	#define PARAM_PHASE_REFERENCE 24
	#define PARAM_PHASE_START 25
	#define PARAM_SH_PN 26
	#define PARAM_BASE_VALUE_DAC 27
	#define PARAM_SCREEN_REFRESH_COUNT 28     
	#define PARAM_DIVISOR 29
	
	
	#define PARAMETER_SETUP_INITIAL_INDEX 30
	#define PARAM_LONG_GAIN 30
	#define PARAM_LONG_INTERVAL 31
	#define PARAM_LONG_DERIVATIVE 32
	#define PARAM_LONG_DEAD_ZONE 33
	#define PARAM_DIVISOR_ENABLE 34
	#define PARAM_TRANS_GAIN 35
	#define PARAM_TRANS_INTERVAL 36
	#define PARAM_TRANS_DEAD_ZONE 37
	#define PARAM_SUPER_CORRECTION 38
	#define PARAM_PULL_GAIN 39
	#define PARAM_PULL_INTERVAL 40
	#define PARAM_INSERTION_SPEED_THRESHOLD 41
	#define PARAM_JUMP_ERROR 42
	#define PARAM_VARIATION_SPEED 43
	#define PARAM_REFERENCE_SIGNAL 44
	#define PARAM_MM_SIGNAL_POSITION 45
	#define PARAM_MARK_SHAPE 46
	#define PARAM_REVERSAL_CORRECTION 47
	#define PARAM_AUTO_REGISTER_AFTER_F4 48
	#define PARAM_LANGUAGE 49
	#define PARAM_TRANS_ENABLE 50
	#define PARAM_PULL_ENABLE 51
	#define PARAM_COLD_SEAL_ENABLE 52
	#define PARAM_ERROR_ZOOM 53
	#define PARAM_TWIN_APPLICATION_01 54
	#define PARAM_TWIN_APPLICATION_02 55
	#define PARAM_TWIN_ENCODER_ENABLE 56
	#define PARAM_MACHINE_SERIAL_NUMBER 57
	#define PARAM_F4_DIMENSION 58
	#define PARAM_KEYBOARD_DELAY 59
	#define PARAM_SH_PN_ENABLE 60
	#define PARAM_LONG_DAC_ENABLE 61
	#define PARAM_TRANS_DAC_ENABLE 62
	#define PARAM_PULL_DAC_ENABLE 63
	#define PARAM_DELTA_COR_DAC 64
	#define PARAM_DELTA_COR_TENS_DAC 65
	#define PARAM_MANUAL_GAIN_DAC 66
	#define PARAM_OFFSET_DAC 67
	#define PARAM_SHOW_CYLINDER 68
	#define PARAM_SNI_TIMER 69
	#define PARAM_ALARM_DELAY 70
	#define PARAM_SCREEN_REFRESH 71
	#define PARAM_SPI_DELAY 72
	#define PARAMETER_NUMBER 73


	
	#define JOB_PARAM_JOB  0
	#define JOB_PARAM_CYLINDER_TRAVEL 1
	#define JOB_PARAM_GATE_WINDOW 2
	#define JOB_PARAM_ALARM_BOUND 3
	#define JOB_PARAM_SH_GAIN 29
	#define JOB_PARAM_TWIN_CURRENT_APPLICATION 4
	#define JOB_PARAM_CURRENT_ENCODER 5
	#define JOB_PARAM_PHASE_REFERENCE 6
	#define JOB_PARAM_PHASE_START 7
	#define JOB_PARAM_SH_PN 31
	#define JOB_PARAM_LONG_GAIN 8
	#define JOB_PARAM_LONG_INTERVAL 9
	#define JOB_PARAM_LONG_DERIVATIVE 10
	#define JOB_PARAM_LONG_DEAD_ZONE 11
	#define JOB_PARAM_DIVISOR_ENABLE 12
	#define JOB_PARAM_TRANS_GAIN 13
	#define JOB_PARAM_TRANS_INTERVAL 14
	#define JOB_PARAM_TRANS_DEAD_ZONE 15
	#define JOB_PARAM_SUPER_CORRECTION 16
	#define JOB_PARAM_PULL_GAIN 17
	#define JOB_PARAM_PULL_INTERVAL 18
	#define JOB_PARAM_INSERTION_SPEED_THRESHOLD 19
	#define JOB_PARAM_JUMP_ERROR 20
	#define JOB_PARAM_VARIATION_SPEED 21
	#define JOB_PARAM_REFERENCE_SIGNAL 22
	#define JOB_PARAM_MM_SIGNAL_POSITION 23
	#define JOB_PARAM_MARK_SHAPE 24
	#define JOB_PARAM_AUTO_REGISTER_AFTER_F4 25
	#define JOB_PARAM_TRANS_ENABLE 26
	#define JOB_PARAM_PULL_ENABLE 27
	#define JOB_PARAM_COLD_SEAL_ENABLE 28
	#define JOB_PARAM_F4_DIMENSION 30
	#define JOB_PARAM_DIVISOR 31



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
	BYTE parametersIsChanged(BYTE a_byParameterIndex);
	
	BYTE * parametersGetLabel(BYTE a_byParameterIndex);
	BYTE parametersVisible(BYTE a_byParameterIndex);
	void parametersInitVisibleFlags(void);
	WORD parametersGetSerialNumber(void);
	
#endif