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
/* PARAM_JOB */ {1, 1000, 1, JOB_PARAM_JOB , EEPROM_ADR_02},
/* PARAM_CALC_TEMPERATURE*/ {0, 0, 0, JOB_NONE, EEPROM_ADR_NONE},
/* PARAM_CALC_VISCOSITY*/ {0, 0, 0, JOB_NONE, EEPROM_ADR_NONE},
/* PARAM_CALC_PH*/ {0, 0, 0, JOB_NONE, EEPROM_ADR_NONE},
/* PARAM_CALIBRATION_VALUE*/ {0, 0, 0, JOB_NONE, EEPROM_ADR_NONE},
/* PARAM_IN_TEMPERATURE*/ {0, 0, 0, JOB_NONE, EEPROM_ADR_NONE},
/* PARAM_IN_VISCOSITY*/ {0, 0, 0, JOB_NONE, EEPROM_ADR_NONE},
/* PARAM_IN_PH*/ {0, 0, 0, JOB_NONE, EEPROM_ADR_NONE},
/* PARAM_OUT_TEMPERATURE*/ {0, 0, 0, JOB_NONE, EEPROM_ADR_NONE},
/* PARAM_OUT_VISCOSITY*/ {0, 0, 0, JOB_NONE, EEPROM_ADR_NONE},
/* PARAM_OUT_PH*/ {0, 0, 0, JOB_NONE, EEPROM_ADR_NONE},
/* PARAM_REF_VISCOSITY*/ {1, 999, 100, JOB_PARAM_REF_VISCOSITY, EEPROM_ADR_02},
/* PARAM_REF_PH*/ {1, 999, 100, JOB_PARAM_REF_PH, EEPROM_ADR_02},
/* PARAM_ALARM*/ {0, 0, 0, JOB_NONE, EEPROM_ADR_NONE},
/* PARAM_PAGE*/ {0, 0, 0, JOB_NONE, EEPROM_ADR_NONE},
/* PARAM_PAGE_SEL*/ {0, 255, 0, JOB_NONE, EEPROM_ADR_NONE},
/* PARAM_MODE*/ {0, 255, 0, JOB_NONE, EEPROM_ADR_02},
/* PARAM_VALVES*/ {0, 255, 0, JOB_NONE, EEPROM_ADR_NONE},
/* PARAM_VISUAL_SETUP_FULL*/ {0, 1, 0, JOB_NONE, EEPROM_ADR_NONE},

/* PARAM_VISCOSITY_GAIN*/ {1, 65000, 2000, JOB_PARAM_VISCOSITY_GAIN, EEPROM_ADR_02},
/* PARAM_VISCOSITY_DEAD_ZONE*/ {0, 65000, 0, JOB_PARAM_VISCOSITY_DEAD_ZONE, EEPROM_ADR_02},
/* PARAM_INTERMEASURE*/ {1, 180, 10, JOB_NONE, EEPROM_ADR_02},
/* PARAM_VISCOSITY_P*/ {0, 65000, 100, JOB_NONE, EEPROM_ADR_02},
/* PARAM_VISCOSITY_I*/ {0, 65000, 0, JOB_NONE, EEPROM_ADR_02},
/* PARAM_VISCOSITY_D*/ {0, 65000, 0, JOB_NONE, EEPROM_ADR_02},
/* PARAM_VISCOSITY_AVG*/ {1, 32, 2, JOB_NONE, EEPROM_ADR_02},
/* PARAM_VISCOSITY_P_VISUAL*/ {0, 65000, 100, JOB_NONE, EEPROM_ADR_02},
/* PARAM_VISCOSITY_I_VISUAL*/ {0, 65000, 0, JOB_NONE, EEPROM_ADR_02},
/* PARAM_VISCOSITY_D_VISUAL*/ {0, 65000, 0, JOB_NONE, EEPROM_ADR_02},
/* PARAM_VISCOSITY_AVG_VISUAL*/ {1, 32, 2, JOB_NONE, EEPROM_ADR_02},
/* PARAM_JUMP_ERROR*/ {0, 10, 1, JOB_NONE, EEPROM_ADR_02},
/* PARAM_LANGUAGE*/ {0, 5, 0, JOB_NONE, EEPROM_ADR_02},
/* PARAM_MACHINE_SERIAL_NUMBER*/ {100, 1000, 100, JOB_NONE, EEPROM_ADR_02},
/* PARAM_DISPLAY_DELAY*/ {0, 2000, 30, JOB_NONE, EEPROM_ADR_02},
/* PARAM_KEYBOARD_DELAY*/ {0, 2000, 250, JOB_NONE, EEPROM_ADR_02},
/* PARAM_CLOCK*/ {0, 0, 500, JOB_NONE, EEPROM_ADR_02},
/* PARAM_ERROR_ZOOM*/ {1, 100, 4, JOB_NONE, EEPROM_ADR_02},
/* PARAM_VISCO_MULT*/ {0, 65000, 58, JOB_NONE, EEPROM_ADR_02},
/* PARAM_VISCO_OFFSET*/ {0, 65000, 970, JOB_NONE, EEPROM_ADR_02},
/* PARAM_TEMP_MULT*/ {0, 65000, 2307, JOB_NONE, EEPROM_ADR_02},
/* PARAM_TEMP_OFFSET*/ {0, 65000, 161, JOB_NONE, EEPROM_ADR_02},
/* PARAM_MAX_CORRECTION*/ {0, 65000, 1000, JOB_NONE, EEPROM_ADR_02},
/* PARAM_ARMA*/ {0, 100, 0, JOB_NONE, EEPROM_ADR_02},
/* PARAM_CUP*/ {0, 1, 0, JOB_NONE, EEPROM_ADR_02},
/* PARAM_SHOW_CALIBRATION*/ {0, 1, 0, JOB_NONE, EEPROM_ADR_02},
/* PARAM_VISCO_OFFSET_FACTORY*/ {0, 65000, 970, JOB_NONE, EEPROM_ADR_02}
											};

/*****************************************************************************/
// Function declaration
/*****************************************************************************/
void parametersVisibleFlagSet(BYTE a_byParameterIndex);
BYTE parametersCheckBound(BYTE a_byParameterIndex, WORD a_woValue);
BYTE parametersSetForced(BYTE a_byParameterIndex, WORD a_woValue);

/*****************************************************************************/
void parametersInit(void)
{	
	//Init value depending on Current Twin Application
	m_byEepromAppIndex = PARAM_IDX_EEPROM_APP_01;


	parametersLoadAll(true);

	m_arwoParameters[PARAM_JOB] 				= (WORD)   1; //0 used for current job	
	parametersInitVisibleFlags();
	
	parametersChangedFlagReset(0xFF);
	
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
void parametersInitVisibleFlagsSimple(void)
{
	BYTE i;
	for(i=0; i<(PARAMETER_NUMBER/8)+1; i++)
	{
		m_arbyParameterVisibleFlag[i] = 0x00;
	}	
	
	parametersVisibleFlagSet(PARAM_VISCOSITY_GAIN);
	//parametersVisibleFlagSet(PARAM_VISCOSITY_INTERVAL);
	//parametersVisibleFlagSet(PARAM_VISCOSITY_DERIVATIVE);
	parametersVisibleFlagSet(PARAM_VISCOSITY_DEAD_ZONE);
	parametersVisibleFlagSet(PARAM_INTERMEASURE);
	parametersVisibleFlagSet(PARAM_LANGUAGE);
	/*
	parametersVisibleFlagSet(PARAM_AVG);
	parametersVisibleFlagSet(PARAM_JUMP_ERROR);
	parametersVisibleFlagSet(PARAM_MACHINE_SERIAL_NUMBER);
	parametersVisibleFlagSet(PARAM_DISPLAY_DELAY);
	parametersVisibleFlagSet(PARAM_KEYBOARD_DELAY);
	parametersVisibleFlagSet(PARAM_CLOCK);
	*/
	
}

/*****************************************************************************/
void parametersInitVisibleFlags(void)
{
	BYTE i;
	for(i=0; i<(PARAMETER_NUMBER/8)+1; i++)
	{
		m_arbyParameterVisibleFlag[i] = 0xFF;
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
void parametersForceChangedFlag(BYTE a_byParameterIndex)
{
	_bset(m_arbyParameterChangedFlag[a_byParameterIndex/8], a_byParameterIndex & 0b00000111);		
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
	*a_woValue = (WORD) m_arwoParameters[a_byParameterIndex];
}


/*****************************************************************************/
BYTE parametersSetForced(BYTE a_byParameterIndex, WORD a_woValue)
{
	if (parametersCheckBound(a_byParameterIndex, a_woValue))
	{
		m_arwoParameters[a_byParameterIndex] = a_woValue;
		_bset(m_arbyParameterChangedFlag[a_byParameterIndex/8], a_byParameterIndex & 0b00000111);	

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

	m_byEepromAppIndex = PARAM_IDX_EEPROM_APP_01;

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