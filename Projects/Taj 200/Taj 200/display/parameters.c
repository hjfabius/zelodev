#include "parameters.h"

/*****************************************************************************/
// Variables declaration
/*****************************************************************************/

@near	WORD m_arwoParameters[PARAMETER_NUMBER];
@near	BYTE m_arbyParameterChangedFlag[(PARAMETER_NUMBER/8)+1];
@near	BYTE m_arbyParameterVisibleFlag[(PARAMETER_NUMBER/8)+1];
		BYTE m_byParamFirstTime = 0xFF;	//0xFF = First time Taj 200 is start up
		BYTE m_byEepromAppIndex = PARAM_IDX_EEPROM_APP_01;


static const WORD mc_arwoParameters[][] = {
/* PARAM_JOB */ {1, 1000, 1, STI_NULL_ADDRESS, JOB_PARAM_JOB , EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_CYLINDER_TRAVEL*/ {1500, 25000, 5000, STI_PARAM_CYLINDER_TRAVEL, JOB_PARAM_CYLINDER_TRAVEL, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_GATE_WINDOW*/ {5, 600, 20, STI_PARAM_GATE_WINDOW, JOB_PARAM_GATE_WINDOW, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_ENCODER_NP*/ {0, 1, 0, STI_NULL_ADDRESS, JOB_NONE, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_ALARM_BOUND*/ {0, 1000, 0, STI_PARAM_ALARM_BOUND, JOB_PARAM_ALARM_BOUND, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_SPEED*/ {0, 0, 0, STI_NULL_ADDRESS, JOB_NONE, EEPROM_ADR_NONE, EEPROM_ADR_NONE},
/* PARAM_SH_GAIN*/ {0, 96, 96, STI_PARAM_SH_GAIN, JOB_PARAM_SH_GAIN, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_ALARM*/ {0, 0, 0, STI_NULL_ADDRESS, JOB_NONE, EEPROM_ADR_NONE, EEPROM_ADR_NONE},
/* PARAM_PAGE*/ {0, 0, 0, STI_NULL_ADDRESS, JOB_NONE, EEPROM_ADR_NONE, EEPROM_ADR_NONE},
/* PARAM_PAGE_SEL*/ {0, 0, 0, STI_NULL_ADDRESS, JOB_NONE, EEPROM_ADR_NONE, EEPROM_ADR_NONE},
/* PARAM_MODE_LONG*/ {0, 0, 0, STI_NULL_ADDRESS, JOB_NONE, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_MODE_TRANS*/ {0, 0, 0, STI_NULL_ADDRESS, JOB_NONE, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_MODE_PULL*/ {0, 0, 0, STI_NULL_ADDRESS, JOB_NONE, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_CORRECTION*/ {0, 0, 0, STI_NULL_ADDRESS, JOB_NONE, EEPROM_ADR_NONE, EEPROM_ADR_NONE},
/* PARAM_ERR_LONG*/ {0, 0, 0, STI_NULL_ADDRESS, JOB_NONE, EEPROM_ADR_NONE, EEPROM_ADR_NONE},
/* PARAM_ERR_TRANS*/ {0, 0, 0, STI_NULL_ADDRESS, JOB_NONE, EEPROM_ADR_NONE, EEPROM_ADR_NONE},
/* PARAM_OSCIL_ZOOM*/ {0, 0, 1, STI_NULL_ADDRESS, JOB_NONE, EEPROM_ADR_NONE, EEPROM_ADR_NONE},
/* PARAM_OSCIL_OFFSET*/ {0, 0, 0, STI_NULL_ADDRESS, JOB_NONE, EEPROM_ADR_NONE, EEPROM_ADR_NONE},
/* PARAM_OSCIL_MANUAL_OFFSET*/ {0, 0, 0, STI_NULL_ADDRESS, JOB_NONE, EEPROM_ADR_NONE, EEPROM_ADR_NONE},
/* PARAM_ERR_BOUND_LONG*/ {0, 0, 0, STI_NULL_ADDRESS, JOB_NONE, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_VISUAL_SETUP_FULL*/ {0, 0, 0, STI_NULL_ADDRESS, JOB_NONE, EEPROM_ADR_NONE, EEPROM_ADR_NONE},
/* PARAM_OFF*/ {0, 0, 0, STI_NULL_ADDRESS, JOB_NONE, EEPROM_ADR_NONE, EEPROM_ADR_NONE},
/* PARAM_TWIN_CURRENT_APPLICATION*/ {0, 7, 0, STI_PARAM_TWIN_CURRENT_APPLICATION, JOB_PARAM_TWIN_CURRENT_APPLICATION, EEPROM_ADR_02, EEPROM_ADR_02},
/* PARAM_CURRENT_ENCODER*/ {0, 1, 0, STI_PARAM_CURRENT_ENCODER, JOB_PARAM_CURRENT_ENCODER, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_PHASE_REFERENCE*/ {0, 0, 0, STI_NULL_ADDRESS, JOB_PARAM_PHASE_REFERENCE, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_PHASE_START*/ {0, 0, 0, STI_NULL_ADDRESS, JOB_PARAM_PHASE_START, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_SH_PN*/ {0, 1, 0, STI_PARAM_SH_PN, JOB_PARAM_SH_PN, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_BASE_VALUE_DAC*/ {0, 1000, 500, STI_PARAM_BASE_VALUE_DAC, JOB_NONE, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_SCREEN_REFRESH_COUNT*/ {0, 9000, 0, STI_NULL_ADDRESS, JOB_NONE, EEPROM_ADR_02, EEPROM_ADR_03}, 
/* PARAM_DIVISOR*/ {1, 255, 1, STI_PARAM_DIVISOR, JOB_NONE, EEPROM_ADR_02, EEPROM_ADR_03}, 

/* PARAM_LONG_GAIN*/ {1, 100, 10, STI_PARAM_LONG_GAIN, JOB_PARAM_LONG_GAIN, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_LONG_INTERVAL*/ {1, 100, 3, STI_PARAM_LONG_INTERVAL, JOB_PARAM_LONG_INTERVAL, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_LONG_DERIVATIVE*/ {0, 255, 1, STI_PARAM_LONG_DERIVATIVE, JOB_PARAM_LONG_DERIVATIVE, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_LONG_DEAD_ZONE*/ {0, 100, 10, STI_PARAM_LONG_DEAD_ZONE, JOB_PARAM_LONG_DEAD_ZONE, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_DIVISOR_ENABLE*/ {0, 1, 1, STI_PARAM_DIVISOR_ENABLE, JOB_PARAM_DIVISOR_ENABLE, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_TRANS_GAIN*/ {1, 100, 10, STI_PARAM_TRANS_GAIN, JOB_PARAM_TRANS_GAIN, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_TRANS_INTERVAL*/ {1, 100, 3, STI_PARAM_TRANS_INTERVAL, JOB_PARAM_TRANS_INTERVAL, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_TRANS_DEAD_ZONE*/ {0, 100, 10, STI_PARAM_TRANS_DEAD_ZONE, JOB_PARAM_TRANS_DEAD_ZONE, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_SUPER_CORRECTION*/ {0, 255, 0, STI_PARAM_SUPER_CORRECTION, JOB_PARAM_SUPER_CORRECTION, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_PULL_GAIN*/ {1, 255, 10, STI_PARAM_PULL_GAIN, JOB_PARAM_PULL_GAIN, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_PULL_INTERVAL*/ {0, 100, 10, STI_PARAM_PULL_INTERVAL, JOB_PARAM_PULL_INTERVAL, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_INSERTION_SPEED_THRESHOLD*/ {1, 255, 1, STI_PARAM_INSERTION_SPEED_THRESHOLD, JOB_PARAM_INSERTION_SPEED_THRESHOLD, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_JUMP_ERROR*/ {0, 9, 1, STI_PARAM_JUMP_ERROR, JOB_PARAM_JUMP_ERROR, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_VARIATION_SPEED*/ {0, 14, 0, STI_PARAM_VARIATION_SPEED, JOB_PARAM_VARIATION_SPEED, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_REFERENCE_SIGNAL*/ {1, 10, 1, STI_PARAM_REFERENCE_SIGNAL, JOB_PARAM_REFERENCE_SIGNAL, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_MM_SIGNAL_POSITION*/ {1, 10, 1, STI_PARAM_MM_SIGNAL_POSITION, JOB_PARAM_MM_SIGNAL_POSITION, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_MARK_SHAPE*/ {0, 2, 0, STI_PARAM_MARK_SHAPE, JOB_PARAM_MARK_SHAPE, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_REVERSAL_CORRECTION*/ {0, 1, 0, STI_PARAM_REVERSAL_CORRECTION, JOB_NONE, EEPROM_ADR_06, EEPROM_ADR_07},
/* PARAM_AUTO_REGISTER_AFTER_F4*/ {0, 1, 0, STI_PARAM_AUTO_REGISTER_AFTER_F4, JOB_PARAM_AUTO_REGISTER_AFTER_F4, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_LANGUAGE*/ {1, 5, 1, STI_NULL_ADDRESS, JOB_NONE, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_TRANS_ENABLE*/ {0, 1, 1, STI_PARAM_TRANS_ENABLE, JOB_PARAM_TRANS_ENABLE, EEPROM_ADR_06, EEPROM_ADR_07},
/* PARAM_PULL_ENABLE*/ {0, 1, 1, STI_PARAM_PULL_ENABLE, JOB_PARAM_PULL_ENABLE, EEPROM_ADR_06, EEPROM_ADR_07},
/* PARAM_COLD_SEAL_ENABLE*/ {0, 1, 1, STI_PARAM_COLD_SEAL_ENABLE, JOB_PARAM_COLD_SEAL_ENABLE, EEPROM_ADR_06, EEPROM_ADR_07},
/* PARAM_ERROR_ZOOM*/ {1, 10, 2, STI_NULL_ADDRESS, JOB_NONE, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_TWIN_APPLICATION_01*/ {0, 7, 0, STI_PARAM_TWIN_APPLICATION_01, JOB_NONE, EEPROM_ADR_07, EEPROM_ADR_07},
/* PARAM_TWIN_APPLICATION_02*/ {0, 7, 0, STI_PARAM_TWIN_APPLICATION_02, JOB_NONE, EEPROM_ADR_07, EEPROM_ADR_07},
/* PARAM_TWIN_ENCODER_ENABLE*/ {0, 1, 1, STI_NULL_ADDRESS, JOB_NONE, EEPROM_ADR_07, EEPROM_ADR_07},
/* PARAM_MACHINE_SERIAL_NUMBER*/ {100, 1000, 100, STI_NULL_ADDRESS, JOB_NONE, EEPROM_ADR_07, EEPROM_ADR_07},
/* PARAM_F4_DIMENSION*/ {0, 600, 0, STI_PARAM_F4_DIMENSION, JOB_PARAM_F4_DIMENSION, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_KEYBOARD_DELAY*/ {0, 2000, 400, STI_NULL_ADDRESS, JOB_NONE, EEPROM_ADR_02, EEPROM_ADR_02},
/* PARAM_SH_PN_ENABLE*/ {0, 1, 1, STI_PARAM_SH_PN_ENABLE, JOB_NONE, EEPROM_ADR_02, EEPROM_ADR_02},
/* PARAM_LONG_DAC_ENABLE*/ {0, 2, 1, STI_PARAM_LONG_DAC_ENABLE, JOB_NONE, EEPROM_ADR_06, EEPROM_ADR_07},
/* PARAM_TRANS_DAC_ENABLE*/ {0, 1, 1, STI_PARAM_TRANS_DAC_ENABLE, JOB_NONE, EEPROM_ADR_06, EEPROM_ADR_07},
/* PARAM_PULL_DAC_ENABLE*/ {0, 1, 1, STI_PARAM_PULL_DAC_ENABLE, JOB_NONE, EEPROM_ADR_06, EEPROM_ADR_07},
/* PARAM_DELTA_COR_DAC*/ {0, 9000, 0, STI_PARAM_DELTA_COR_DAC, JOB_NONE, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_DELTA_COR_TENS_DAC*/ {0, 9000, 0, STI_PARAM_DELTA_COR_TENS_DAC, JOB_NONE, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_MANUAL_GAIN_DAC*/ {0, 9000, 0, STI_PARAM_MANUAL_GAIN_DAC, JOB_NONE, EEPROM_ADR_02, EEPROM_ADR_03},
/* PARAM_OFFSET_DAC*/ {0, 1000, 96, STI_PARAM_OFFSET_DAC, JOB_NONE, EEPROM_ADR_07, EEPROM_ADR_07},
/* PARAM_SHOW_CYLINDER*/ {0, 1, 0, STI_NULL_ADDRESS, JOB_NONE, EEPROM_ADR_02, EEPROM_ADR_02},
/* PARAM_SNI_TIMER*/ {0, 2000, 632, STI_NULL_ADDRESS, JOB_NONE, EEPROM_ADR_02, EEPROM_ADR_02},
/* PARAM_ALARM_DELAY*/ {0, 100, 0, STI_PARAM_ALARM_DELAY, JOB_NONE, EEPROM_ADR_02, EEPROM_ADR_02},
/* PARAM_SCREEN_REFRESH*/ {0, 9000, 0, STI_NULL_ADDRESS, JOB_NONE, EEPROM_ADR_02, EEPROM_ADR_02},
/* PARAM_SPI_DELAY*/ {0, 255, 0, STI_NULL_ADDRESS, JOB_NONE, EEPROM_ADR_02, EEPROM_ADR_02}
										  };

/*****************************************************************************/
// Function declaration
/*****************************************************************************/
void parametersVisibleFlagSet(BYTE a_byParameterIndex);
BYTE parametersCheckBound(BYTE a_byParameterIndex, WORD a_woValue);
void parametersInitTwinApplication(void);
BYTE parametersSetForced(BYTE a_byParameterIndex, WORD a_woValue);

/*****************************************************************************/
void parametersInit(void)
{
	parametersInitTwinApplication();
	
	//Init value depending on Current Twin Application
	parametersLoadAll(true);

	m_arwoParameters[PARAM_JOB] 				= (WORD)   1; //0 used for current job
	m_arwoParameters[PARAM_ERR_LONG]			= 0x8000;
	m_arwoParameters[PARAM_ERR_BOUND_LONG] 		= false;
	m_arwoParameters[PARAM_OSCIL_ZOOM] 			= (WORD)   0x0001;
	m_arwoParameters[PARAM_OSCIL_OFFSET] 		= (WORD)   0xFFFF;
	m_arwoParameters[PARAM_OSCIL_MANUAL_OFFSET] = (WORD)   0x0000;
	m_arwoParameters[PARAM_OFF]					= false;	
	m_arwoParameters[PARAM_SCREEN_REFRESH_COUNT]					= 0x0000;
	
	parametersInitVisibleFlags();
	
	parametersChangedFlagReset(0xFF);
	//parametersLoadJob(0x00);
	
}


/*****************************************************************************/
WORD parametersGetSerialNumber(void)
{
	WORD woValue;
	
	//Read Machine ID if available
	readEeprom(mc_arwoParameters[PARAM_MACHINE_SERIAL_NUMBER][PARAM_IDX_EEPROM_APP_01], PARAM_MACHINE_SERIAL_NUMBER*2, 2, (BYTE *) &woValue);
	
	parametersSet(PARAM_MACHINE_SERIAL_NUMBER, woValue);
	
	return woValue;
}


/*****************************************************************************/
void parametersInitTwinApplication(void)
{
	WORD woValue;
	
	//Read Twin application if available
	readEeprom(mc_arwoParameters[PARAM_TWIN_APPLICATION_01][PARAM_IDX_EEPROM_APP_01], PARAM_TWIN_APPLICATION_01*2, 2, (BYTE *) &woValue);
	if(!parametersSet(PARAM_TWIN_APPLICATION_01, woValue))
	{
		parametersSet(PARAM_TWIN_APPLICATION_01, mc_arwoParameters[PARAM_TWIN_APPLICATION_01][PARAM_IDX_DEFAULT]);
	}	
	readEeprom(mc_arwoParameters[PARAM_TWIN_APPLICATION_02][PARAM_IDX_EEPROM_APP_01], PARAM_TWIN_APPLICATION_02*2, 2, (BYTE *) &woValue);
	if(!parametersSet(PARAM_TWIN_APPLICATION_02, woValue))
	{
		parametersSet(PARAM_TWIN_APPLICATION_02, mc_arwoParameters[PARAM_TWIN_APPLICATION_02][PARAM_IDX_DEFAULT]);
	}	
	
	//Configure current application
	if( (parametersGetValue(PARAM_TWIN_APPLICATION_01) == 0x00) ||
		(parametersGetValue(PARAM_TWIN_APPLICATION_02) == 0x00) )
	{
		parametersSet(PARAM_TWIN_CURRENT_APPLICATION, mc_arwoParameters[PARAM_TWIN_CURRENT_APPLICATION][PARAM_IDX_DEFAULT]);
	}	
	else
	{
		readEeprom(mc_arwoParameters[PARAM_TWIN_CURRENT_APPLICATION][PARAM_IDX_EEPROM_APP_01], PARAM_TWIN_CURRENT_APPLICATION*2, 2, (BYTE *) &woValue);
		if(!parametersSet(PARAM_TWIN_CURRENT_APPLICATION, woValue))
		{
			parametersSet(PARAM_TWIN_CURRENT_APPLICATION, mc_arwoParameters[PARAM_TWIN_CURRENT_APPLICATION][PARAM_IDX_DEFAULT]);
		}	
	}

	//Update Current EEprom Index
	if (parametersGetValue(PARAM_TWIN_APPLICATION_02) == parametersGetValue(PARAM_TWIN_CURRENT_APPLICATION))
	{
		m_byEepromAppIndex = PARAM_IDX_EEPROM_APP_02;
	}
	else
	{
		m_byEepromAppIndex = PARAM_IDX_EEPROM_APP_01;
	}
}

/*****************************************************************************/
BYTE parametersCheckBound(BYTE a_byParameterIndex, WORD a_woValue)
{
	if( (mc_arwoParameters[a_byParameterIndex][PARAM_IDX_MIN] == 0x0000) &&
		(mc_arwoParameters[a_byParameterIndex][PARAM_IDX_MAX] == 0x0000))
	{
		return true;
	}
	
	if(a_woValue<mc_arwoParameters[a_byParameterIndex][PARAM_IDX_MIN])
	{
		return false;
	}

	if(a_woValue>mc_arwoParameters[a_byParameterIndex][PARAM_IDX_MAX])
	{
		return false;
	}
	
	return true;
}

/*****************************************************************************/
void parametersInitVisibleFlags(void)
{
	BYTE i;
	for(i=0; i<(PARAMETER_NUMBER/8)+1; i++)
	{
		m_arbyParameterVisibleFlag[i] = 0x00;
	}	
		
	parametersVisibleFlagSet(PARAM_LONG_GAIN);
	parametersVisibleFlagSet(PARAM_LONG_INTERVAL);
	parametersVisibleFlagSet(PARAM_LONG_DERIVATIVE);
	parametersVisibleFlagSet(PARAM_LONG_DEAD_ZONE);
	parametersVisibleFlagSet(PARAM_INSERTION_SPEED_THRESHOLD);
	parametersVisibleFlagSet(PARAM_JUMP_ERROR);
	parametersVisibleFlagSet(PARAM_VARIATION_SPEED);
	parametersVisibleFlagSet(PARAM_LANGUAGE);
	parametersVisibleFlagSet(PARAM_ERROR_ZOOM);
	parametersVisibleFlagSet(PARAM_F4_DIMENSION);
	
	if (parametersGetValue(PARAM_TRANS_ENABLE)==0x0000)
	{
		parametersVisibleFlagSet(PARAM_TRANS_GAIN);
		parametersVisibleFlagSet(PARAM_TRANS_INTERVAL);
		parametersVisibleFlagSet(PARAM_TRANS_DEAD_ZONE);
		//parametersVisibleFlagSet(PARAM_SUPER_CORRECTION);
	}
	
	if (parametersGetValue(PARAM_PULL_ENABLE)==0x0000)
	{
		parametersVisibleFlagSet(PARAM_PULL_GAIN);
		parametersVisibleFlagSet(PARAM_PULL_INTERVAL);
	}
	
	if (
		(parametersGetValue(PARAM_LONG_DAC_ENABLE) == 0x0000) ||
		(parametersGetValue(PARAM_TRANS_DAC_ENABLE) == 0x0000) 
	   )
	{
		parametersVisibleFlagSet(PARAM_DELTA_COR_DAC);
	}
	
	if (parametersGetValue(PARAM_PULL_DAC_ENABLE)==0x0000)
	{
		parametersVisibleFlagSet(PARAM_DELTA_COR_TENS_DAC);
	}

	if (
		(parametersGetValue(PARAM_LONG_DAC_ENABLE) == 0x0000) ||
		(parametersGetValue(PARAM_TRANS_DAC_ENABLE) == 0x0000) ||
		(parametersGetValue(PARAM_PULL_DAC_ENABLE) == 0x0000)
	   )
	{
		parametersVisibleFlagSet(PARAM_REVERSAL_CORRECTION);
		parametersVisibleFlagSet(PARAM_MANUAL_GAIN_DAC);
	}
	
}


/*****************************************************************************/
void parametersVisibleFlagSet(BYTE a_byParameterIndex)
{
	_bset(m_arbyParameterVisibleFlag[a_byParameterIndex/8], a_byParameterIndex & 0b00000111);		
}

/*****************************************************************************/
void parametersChangedFlagReset(BYTE a_byParameterIndex)
{
	BYTE i;
	if (a_byParameterIndex == 0xFF)
	{
		for(i=0; i<(PARAMETER_NUMBER/8)+1; i++)
		{
			m_arbyParameterChangedFlag[i] = 0x00;
		}
	}
	else
	{
		_bres(m_arbyParameterChangedFlag[a_byParameterIndex/8], a_byParameterIndex & 0b00000111);		
	}
}

/*****************************************************************************/
BYTE parametersIsChanged(BYTE a_byParameterIndex)
{
	return (BYTE)(_btst(m_arbyParameterChangedFlag[a_byParameterIndex/8], a_byParameterIndex & 0b00000111)!=0);
}

/*****************************************************************************/
WORD parametersGetValue(BYTE a_byParameterIndex)
{
	WORD woValue = 0x0000;
	parametersGet(a_byParameterIndex, &woValue);
	return woValue;
}

/*****************************************************************************/
void parametersGet(BYTE a_byParameterIndex, WORD * a_woValue)
{
	//if(a_byParameterIndex == PARAM_GATE_WINDOW)
	//{
	//		m_arwoParameters[PARAM_GATE_WINDOW] = STI_GetMessage(STI_PARAM_GATE_WINDOW);
	//}
	
	*a_woValue = (WORD) m_arwoParameters[a_byParameterIndex];
}


/*****************************************************************************/
BYTE parametersSetForced(BYTE a_byParameterIndex, WORD a_woValue)
{
	BYTE byAddress;
	
	if (parametersCheckBound(a_byParameterIndex, a_woValue))
	{
		m_arwoParameters[a_byParameterIndex] = a_woValue;
		_bset(m_arbyParameterChangedFlag[a_byParameterIndex/8], a_byParameterIndex & 0b00000111);	
		byAddress = mc_arwoParameters[a_byParameterIndex][PARAM_IDX_ADDRESS];
		if (byAddress!= STI_NULL_ADDRESS)
		{
			STI_SendMessage(STI_FUNZ_WRITE_PARAM, byAddress, a_woValue);
		}
		
		if (mc_arwoParameters[a_byParameterIndex][m_byEepromAppIndex]!=EEPROM_ADR_NONE)
		{
			writeEeprom(mc_arwoParameters[a_byParameterIndex][m_byEepromAppIndex], a_byParameterIndex*2, 2, (BYTE *) &a_woValue);
		}
		
		return true;
	}
	else
	{
		return false;
	}
	
}

/*****************************************************************************/
BYTE parametersSet(BYTE a_byParameterIndex, WORD a_woValue)
{
	BYTE byAcceptable	= true;

	if (m_arwoParameters[a_byParameterIndex] != a_woValue)
	{
		byAcceptable = parametersSetForced(a_byParameterIndex, a_woValue);
	}

	//Selezione della eeprom
	if (	(a_byParameterIndex == PARAM_TWIN_APPLICATION_01) ||
			(a_byParameterIndex == PARAM_TWIN_APPLICATION_02) ||
			(a_byParameterIndex == PARAM_TWIN_CURRENT_APPLICATION)
		)
	{
		if (parametersGetValue(PARAM_TWIN_APPLICATION_02) == parametersGetValue(PARAM_TWIN_CURRENT_APPLICATION))
		{
			m_byEepromAppIndex = PARAM_IDX_EEPROM_APP_02;
		}
		else
		{
			m_byEepromAppIndex = PARAM_IDX_EEPROM_APP_01;
		}
	}

	return byAcceptable;
}

/*****************************************************************************/
void parametersLoadAll(BYTE a_byWithDefault)
{
	BYTE byIndex	= PARAMETER_NUMBER;
	WORD woValue;
	
	while(byIndex-->0)
	{

		if (mc_arwoParameters[byIndex][m_byEepromAppIndex]!=EEPROM_ADR_NONE)
		{
			readEeprom(mc_arwoParameters[byIndex][m_byEepromAppIndex], byIndex*2, 2, (BYTE *) &woValue);
		}
		else if (a_byWithDefault)
		{
			woValue = mc_arwoParameters[byIndex][PARAM_IDX_DEFAULT];
		}

		if(a_byWithDefault)
		{
			m_arwoParameters[byIndex] = 0xFFFF;  //In order to force to resend all the parameter to Z80
			if(!parametersSetForced(byIndex, woValue))
			{
				parametersSetForced(byIndex, mc_arwoParameters[byIndex][PARAM_IDX_DEFAULT]);
			}
			parametersChangedFlagReset(byIndex);
		}
	}
}

/*****************************************************************************/
void parametersSaveAll(void)
{
	BYTE byIndex	= PARAMETER_NUMBER;
	WORD woValue;
	
	while(byIndex-->0)
	{
		if (mc_arwoParameters[byIndex][m_byEepromAppIndex]!=EEPROM_ADR_NONE)
		{
			woValue = parametersGetValue(byIndex);
			writeEeprom(mc_arwoParameters[byIndex][m_byEepromAppIndex], byIndex*2, 2, (BYTE *) &woValue);
		}
	}
}


/*****************************************************************************/
BYTE * parametersGetLabel(BYTE a_byParameterIndex)
{
	if (a_byParameterIndex<PARAMETER_SETUP_INITIAL_INDEX)
	{
		return NULL;
	}
	else
	{
		return labelSetupGet(a_byParameterIndex-PARAMETER_SETUP_INITIAL_INDEX);
	}
	
}

/*****************************************************************************/
BYTE parametersVisible(BYTE a_byParameterIndex)
{
	return _btst(m_arbyParameterVisibleFlag[a_byParameterIndex/8], a_byParameterIndex & 0b00000111);
}

/*****************************************************************************/
BYTE parametersSaveJob(WORD a_woJob)
{
	WORD arwoJobParameters[JOB_PARAMETERS];
	BYTE byIndex = PARAMETER_NUMBER;
	BYTE byJobIndex;
	
	//1 Job == 32 parameters
	//32 parameters * 2 byte = 64 byte
	//256 Kbit = 32 KByte = 512 Jobs
	//Saved on 2 eeproms
	//512 Kbit = 64 KByte = 1024 Jobs
	
	if (a_woJob<((32768/JOB_PARAMETERS)*2)) // <64KByte
	{
		parametersSet(PARAM_JOB, a_woJob);
		parametersSet(PARAM_GATE_WINDOW, 		STI_GetMessage(STI_PARAM_GATE_WINDOW));
		parametersSet(PARAM_PHASE_REFERENCE, 	STI_GetMessage(STI_PARAM_PHASE_REFERENCE));
		parametersSet(PARAM_PHASE_START, 		STI_GetMessage(STI_PARAM_PHASE_START));
		
		while(byIndex-->0)
		{
			byJobIndex = mc_arwoParameters[byIndex][PARAM_IDX_JOB];
			if (byJobIndex != JOB_NONE)
			{
				arwoJobParameters[byJobIndex] = 	parametersGetValue(byIndex);
			}
		}		
		
		if (a_woJob<(32768/JOB_PARAMETERS)) // <32KByte
		{
			writeEeprom(EEPROM_ADR_00,(WORD) (a_woJob*JOB_PARAMETERS*2), JOB_PARAMETERS*2, (BYTE *) arwoJobParameters);
		}
		else
		{
			writeEeprom(EEPROM_ADR_01,(WORD) (a_woJob*JOB_PARAMETERS*2), JOB_PARAMETERS*2, (BYTE *) arwoJobParameters);
		}
		
		return true;
	}
	else
	{
		return false;
	}
}

/*****************************************************************************/
BYTE parametersLoadJob(WORD a_woJob)
{
	WORD arwoJobParameters[JOB_PARAMETERS];
	BYTE byIndex = PARAMETER_NUMBER;
	BYTE byJobIndex;
	
	//1 Job == 32 parameters
	//32 parameters * 2 byte = 64 byte
	//256 Kbit = 32 KByte = 512 Jobs
	//Saved on 2 eeproms
	//512 Kbit = 64 KByte = 1024 Jobs
	
	if (a_woJob<((32768/JOB_PARAMETERS)*2)) // <64KByte
	{
		if (a_woJob<(32768/JOB_PARAMETERS)) // <32KByte
		{
			readEeprom(EEPROM_ADR_00,(WORD) (a_woJob*JOB_PARAMETERS*2), JOB_PARAMETERS*2, (BYTE *) arwoJobParameters);
		}
		else
		{
			readEeprom(EEPROM_ADR_01,(WORD) (a_woJob*JOB_PARAMETERS*2), JOB_PARAMETERS*2, (BYTE *) arwoJobParameters);
		}
		if(a_woJob != arwoJobParameters[JOB_PARAM_JOB])
		{
			return false;
		}
		
		while(byIndex-->0)
		{
			byJobIndex = mc_arwoParameters[byIndex][PARAM_IDX_JOB];
			if (byJobIndex != JOB_NONE)
			{
				parametersSet(byIndex,arwoJobParameters[byJobIndex]);
			}
		}		
		
		return true;
	}
	else
	{
		return false;
	}	
}