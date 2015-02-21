#ifndef PARAMETERS_H
	#define PARAMETERS_H
	
	#include "common.h"


/*****************************************************************************/
// Variables declaration
/*****************************************************************************/
	

	#define PARAM_LANGUAGE_IT					0x0001
	#define PARAM_LANGUAGE_EN					0x0002
	#define PARAM_LANGUAGE_FR					0x0003
	#define PARAM_LANGUAGE_DE					0x0004
	#define PARAM_LANGUAGE_ES					0x0005


	#define PARAM_IDX_MIN						0
	#define PARAM_IDX_MAX						1
	#define PARAM_IDX_DEFAULT					2
	

	#define PARAM_FREQUENCY 					0
	#define PARAM_CYLINDER   					1
	#define PARAM_SPEED 						2
	#define PARAM_MULT_FACTOR 					3
	#define PARAMETER_NUMBER_SHORT				4

	#define PARAM_LIGHT 						4
	#define PARAM_LANGUAGE						5
	#define PARAMETER_NUMBER					6			

	
	#define PARAM_LANGUAGES						200
	#define PARAM_BATTERY_LOW_01				201
	#define PARAM_BATTERY_LOW_02				202
	#define PARAM_EXTERNAL_TRIGGER_01			203
	#define PARAM_EXTERNAL_TRIGGER_02			204

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
	
	char * parametersGetLabel(BYTE a_byParameterIndex);
	BYTE parametersVisible(BYTE a_byParameterIndex);
	void parametersInitVisibleFlags(void);
	
#endif
