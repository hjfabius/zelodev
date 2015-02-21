#ifndef PARAMETERS_H
	#define PARAMETERS_H
	
	#include "common.h"


/*****************************************************************************/
// Variables declaration
/*****************************************************************************/
	#define PARAMETER_NUMBER			15
	
	#define PARAM_JOB 					0
	#define PARAM_LANGUAGE				1
	#define PARAM_ALARM					2
	#define PARAM_SPEED					3
	#define PARAM_PAGE					4
	#define PARAM_PAGE_SEL				5
	#define PARAM_MODE_LONG				6
	#define PARAM_MODE_TRANS			7
	#define PARAM_CORRECTION			8
	#define PARAM_ERR_LONG				9
	#define PARAM_ERR_TRANS				10
	#define PARAM_OSCIL_ZOOM			11
	#define PARAM_OSCIL_OFFSET			12
	#define PARAM_ERR_BOUND_LONG		13
	#define PARAM_ALARM_OUT_OF_BOUND	14
	
	
	#define PARAM_MODE_AUTO		0x00FF
	#define PARAM_MODE_MANUAL	0x0000
	#define PARAM_MODE_PAUSE	0x0001
	#define PARAM_MODE_STANDBY	0x0002
	
	



/*****************************************************************************/
// Function declaration
/*****************************************************************************/
	void parametersInit(void);
	void parametersReset(void);
	void parametersSave(BYTE a_byParameterIndex);
	void parametersSaveJob(BYTE a_byJob);
	void parametersLoadJob(BYTE a_byJob);
	void parametersGet(BYTE a_byParameterIndex, WORD * a_woValue);
	WORD parametersGetValue(BYTE a_byParameterIndex);
	void parametersSet(BYTE a_byParameterIndex, WORD a_woValue);
	void parametersChangedFlagReset(BYTE a_byParameterIndex);
	BYTE parametersIsChanged(BYTE a_byParameterIndex);
	
#endif