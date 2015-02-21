#ifndef __MAIN_H__
	#define __MAIN_H__
	
	#include "common.h"
	#include "variables.h"

	void Init();		
	void UpdateCurrentValue(WORD a_woNewValue);
	void DisplayCurrentValue();
	void DisplaySplashScreen();
	void DisplayBattery();
	void DisplayExternalTrigger();
	void SetCurrentParameterToEncoder(BYTE a_byNewParameter);
	
	
	#define CALC_FREQUENCY   0 
	#define CALC_SPEED       1
	#define CALC_CYLINDER    2
	#define CALC_MULT_FACTOR 3
	void calculateValues(BYTE a_byMode);
	
	//static const WORD mc_woApplicationVersion		= APPLICATION_VERSION;

	
#endif
