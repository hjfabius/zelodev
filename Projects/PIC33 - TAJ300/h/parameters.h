#ifndef PARAMETERS_H
	#define PARAMETERS_H
	
	#include "common.h"


/*****************************************************************************/
// Variables declaration
/*****************************************************************************/
	
	
	#define PARAM_MODE_AUTO						0x00FF
	#define PARAM_MODE_MANUAL					0x0000
	//#define PARAM_MODE_PAUSE					0x0001
	//#define PARAM_MODE_STANDBY				0x0002
		
		
	#define PARAM_LANGUAGE_IT					0x0001
	#define PARAM_LANGUAGE_EN					0x0002
	#define PARAM_LANGUAGE_FR					0x0003
	#define PARAM_LANGUAGE_ES					0x0004
	#define PARAM_LANGUAGE_DE					0x0005
	
	#define	PARAM_MARK_SHAPE_FRONT 				0
	#define	PARAM_MARK_SHAPE_SQUARE 			1
	#define	PARAM_MARK_SHAPE_TRIANGLE_60 		2
	#define	PARAM_MARK_SHAPE_TRIANGLE_45 		3
	#define	PARAM_MARK_SHAPE_TRIANGLE_30 		4
	
	#define PARAM_RUNNING_MODE_MC				0
	#define PARAM_RUNNING_MODE_MM				1
	
	
	#define PARAM_TWIN_APPLICATION_NONE			0x0000
	#define PARAM_TWIN_APPLICATION_FBSIDE		0x0001
	#define PARAM_TWIN_APPLICATION_INSETTER 	0x0002
	#define PARAM_TWIN_APPLICATION_CUT  		0x0003
	#define PARAM_TWIN_APPLICATION_WEBFOLD  	0x0004
	#define PARAM_TWIN_APPLICATION_PERFORAT 	0x0005
	#define PARAM_TWIN_APPLICATION_FSIDE		0x0006
	#define PARAM_TWIN_APPLICATION_BSIDE		0x0007
	
	
	#define PARAM_IDX_MIN						0
	#define PARAM_IDX_MAX						1
	#define PARAM_IDX_DEFAULT					2
	#define PARAM_IDX_ADDRESS					4
	#define PARAM_IDX_JOB						5
	#define PARAM_IDX_EEPROM_APP_01				6
	#define PARAM_IDX_EEPROM_APP_02				6
		
		
			
				
	#define PARAM_JOB  							0
	#define PARAM_CYLINDER_TRAVEL 				1
	#define PARAM_GATE_WINDOW 					2
	#define PARAM_ENCODER_NP 					3
	#define PARAM_ALARM_BOUND 					4
	#define PARAM_SPEED 						5
	#define PARAM_SH_GAIN 						6
	#define PARAM_ALARM 						7
	#define PARAM_PAGE 							8
	#define PARAM_PAGE_SEL 						9
	#define PARAM_MODE_LONG 					10
	#define PARAM_MODE_TRANS 					11
	#define PARAM_MODE_PULL 					12
	#define PARAM_CORRECTION 					13
	#define PARAM_ERR_LONG 						14
	#define PARAM_ERR_TRANS 					15
	#define PARAM_OSCIL_ZOOM 					16
	#define PARAM_OSCIL_OFFSET 					17
	#define PARAM_OSCIL_MANUAL_OFFSET 			18
	#define PARAM_ERR_BOUND_LONG 				19
	#define PARAM_VISUAL_SETUP_FULL 			20
	#define PARAM_OFF 							21
	#define PARAM_TWIN_CURRENT_APPLICATION 		22
	#define PARAM_CURRENT_ENCODER 				23
	#define PARAM_ENC_GATE01_REFERENCE 			24
	#define PARAM_ENC_GATE01_REFERENCE_1000		25
	#define PARAM_ENC_GATE01_START 				26
	#define PARAM_ENC_GATE01_END				27
	#define PARAM_CYLINDER_ENCODER_RATIO		28
	#define PARAM_ENC_GATE02_DISTANCE			29
	#define PARAM_ENC_GATE02_END                30
	#define PARAM_ENC_GATE02_START              31
	#define PARAM_SH_PN 						32
	#define PARAM_BASE_VALUE_DAC 				33
	#define PARAM_SCREEN_REFRESH_COUNT 			34
	#define PARAM_MM_POSITION_01				35
	#define PARAM_MM_POSITION_02				36
	#define PARAMETER_SETUP_INITIAL_INDEX 		37

	#define PARAM_LONG_GAIN 					37
	#define PARAM_LONG_INTERVAL 				38
	#define PARAM_LONG_DERIVATIVE 				39
	#define PARAM_LONG_DEAD_ZONE 				40
	#define PARAM_LONG_MOTOR_SPEED 				41
	#define PARAM_TRANS_GAIN 					42
	#define PARAM_TRANS_INTERVAL 				43
	#define PARAM_TRANS_DEAD_ZONE 				44
	#define PARAM_TRANS_MOTOR_SPEED 			45
	#define PARAM_PULL_GAIN 					46
	#define PARAM_PULL_INTERVAL 				47
	#define PARAM_INSERTION_SPEED_THRESHOLD 	48
	#define PARAM_JUMP_ERROR 					49
	#define PARAM_VARIATION_SPEED 				50
	#define PARAM_REFERENCE_SIGNAL 				51
	#define PARAM_MM_SIGNAL_POSITION 			52
	#define PARAM_MARK_SHAPE 					53
	#define PARAM_REVERSAL_CORRECTION 			54
	#define PARAM_AUTO_REGISTER_AFTER_F4 		55
	#define PARAM_LANGUAGE 						56
	#define PARAM_TRANS_ENABLE 					57
	#define PARAM_PULL_ENABLE 					58
	#define PARAM_COLD_SEAL_ENABLE 				59
	#define PARAM_ERROR_ZOOM 					60
	#define PARAM_TWIN_APPLICATION_01 			61
	#define PARAM_TWIN_APPLICATION_02 			62
	#define PARAM_TWIN_ENCODER_ENABLE 			63
	#define PARAM_MACHINE_SERIAL_NUMBER 		64
	#define PARAM_F4_DIMENSION 					65
	#define PARAM_KEYBOARD_DELAY 				66
	#define PARAM_SH_PN_ENABLE 					67
	#define PARAM_LONG_DAC_ENABLE 				68
	#define PARAM_TRANS_DAC_ENABLE 				69
	#define PARAM_PULL_DAC_ENABLE 				70
	#define PARAM_DELTA_COR_DAC 				71
	#define PARAM_DELTA_COR_TENS_DAC 			72
	#define PARAM_MANUAL_GAIN_DAC 				73
	#define PARAM_OFFSET_DAC 					74
	#define PARAM_SHOW_CYLINDER 				75
	#define PARAM_SNI_TIMER 					76
    #define PARAM_ALARM_DELAY 					77
	#define PARAM_SCREEN_REFRESH 				78
	#define PARAM_RUNNING_MODE					79
		
	#define PARAMETER_NUMBER 					80
	
	
	
	
	#define JOB_PARAM_JOB  						0
	#define JOB_PARAM_CYLINDER_TRAVEL 			1
	#define JOB_PARAM_GATE_WINDOW 				2
	#define JOB_PARAM_ALARM_BOUND 				3
	#define JOB_PARAM_TWIN_CURRENT_APPLICATION 	4
	#define JOB_PARAM_CURRENT_ENCODER 			5
	#define JOB_PARAM_ENC_GATE01_REFERENCE 		6
	#define JOB_PARAM_ENC_GATE01_REFERENCE_1000 7
	#define JOB_PARAM_ENC_GATE01_START 			8
	#define JOB_PARAM_ENC_GATE01_END 			9
	#define JOB_PARAM_ENC_GATE02_DISTANCE       10
	#define JOB_PARAM_ENC_GATE02_START          11
	#define JOB_PARAM_ENC_GATE02_END            12
	#define JOB_PARAM_LONG_GAIN 				13
	#define JOB_PARAM_LONG_INTERVAL 			14
	#define JOB_PARAM_LONG_DERIVATIVE 			15
	#define JOB_PARAM_LONG_DEAD_ZONE 			16
	#define JOB_PARAM_LONG_MOTOR_SPEED 			17
	#define JOB_PARAM_TRANS_GAIN 				18
	#define JOB_PARAM_TRANS_INTERVAL 			19
	#define JOB_PARAM_TRANS_DEAD_ZONE 			20
	#define JOB_PARAM_TRANS_MOTOR_SPEED 		21
	#define JOB_PARAM_PULL_GAIN 				22
	#define JOB_PARAM_PULL_INTERVAL 			23
	#define JOB_PARAM_INSERTION_SPEED_THRESHOLD 24
	#define JOB_PARAM_JUMP_ERROR 				25
	#define JOB_PARAM_VARIATION_SPEED 			26
	#define JOB_PARAM_REFERENCE_SIGNAL 			27
	#define JOB_PARAM_MM_SIGNAL_POSITION 		28
	#define JOB_PARAM_MARK_SHAPE 				29
	#define JOB_PARAM_AUTO_REGISTER_AFTER_F4 	30
	#define JOB_PARAM_TRANS_ENABLE 				31
	#define JOB_PARAM_PULL_ENABLE 				32
	#define JOB_PARAM_COLD_SEAL_ENABLE 			33
	#define JOB_PARAM_SH_GAIN 					34
	#define JOB_PARAM_F4_DIMENSION 				35
	#define JOB_PARAM_SH_PN 					36
	#define JOB_PARAM_MM_POSITION_01			37
	#define JOB_PARAM_MM_POSITION_02			38
	
                                                
	#define JOB_PARAMETERS						37
	#define JOB_NONE							255

	

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
