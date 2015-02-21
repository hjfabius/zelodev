#include "parameters.h"

/*****************************************************************************/
// Variables declaration
/*****************************************************************************/
//volatile BYTE				m_arbyValues [DISPLAY_MAX_VALUES];
@near	BYTE m_byParamJob 					= (BYTE)   1; //0 used for current job
@near	BYTE m_byParamLanguage 				= (BYTE)   0; //0=IT 1=EN 2=DE
@near	BYTE m_byParamMode 					= (BYTE) 0x00; //Auto
@near	BYTE m_byParamVisual 				= (BYTE) 0x00; 

@near	WORD m_arwoParameters[PARAMETER_NUMBER];
		LWORD m_lwoParameterChangedFlag;
		BYTE m_byParamFirstTime = 0xFF;	//0xFF = First time Taj 200 is start up

/*****************************************************************************/
// Function declaration
/*****************************************************************************/

/*****************************************************************************/
void parametersInit(void)
{
	parametersChangedFlagReset(0xFF);
	parametersLoadJob(0x00);
	if (m_byParamFirstTime == 0xFF) //First time Taj 200 is start up
	{
		parametersReset(); //Save default parameters
	}	
}

/*****************************************************************************/
void parametersChangedFlagReset(BYTE a_byParameterIndex)
{
	if (a_byParameterIndex == 0xFF)
	{
		m_lwoParameterChangedFlag = 0x00000000;
	}
	else
	{
		_bres(m_lwoParameterChangedFlag, a_byParameterIndex);
	}
}

/*****************************************************************************/
BYTE parametersIsChanged(BYTE a_byParameterIndex)
{
	return (BYTE)(_btst(m_lwoParameterChangedFlag, a_byParameterIndex)!=0);
}

/*****************************************************************************/
void parametersReset(void)
{
	m_arwoParameters[PARAM_JOB] 				= (WORD)   1; //0 used for current job
	m_arwoParameters[PARAM_LANGUAGE]			= (WORD)   0; //0=IT 1=EN 2=DE
	m_arwoParameters[PARAM_SPEED]				= (WORD)   0; 
	m_arwoParameters[PAGE_REGISTER]				= (WORD)   0; //
	m_arwoParameters[PARAM_MODE_LONG]			= (WORD)   0; //0=Auto 1=Man
	m_arwoParameters[PARAM_CORRECTION]			= (WORD)   0; //0=Off  1=Minus 2=Plus
	m_arwoParameters[PARAM_ALARM_OUT_OF_BOUND] 	= false;
	m_arwoParameters[PARAM_ALARM]				= (WORD)	STI_ANSWER_OK;
	m_arwoParameters[PARAM_OSCIL_ZOOM] 			= (WORD)   0x0001;
	m_arwoParameters[PARAM_OSCIL_OFFSET] 		= (WORD)   0xFFFF;
	parametersSaveJob(0x00);
}

/*****************************************************************************/
void parametersSave(BYTE a_byParameterIndex)
{
	parametersSaveJob(0x00);
}

/*****************************************************************************/
void parametersSaveJob(BYTE a_byJob)
{
	BYTE arbyParameters[PARAMETER_NUMBER];
	BYTE i = 0x00;
	
	if(a_byJob>0)
	{
		m_arwoParameters[PARAM_JOB] = a_byJob;
	}
	
	//writeEeprom(EEPROM_ADR_RW,(WORD) (a_byJob*PARAMETER_NUMBER), PARAMETER_NUMBER, arbyParameters);

}

/*****************************************************************************/
void parametersLoadJob(BYTE a_byJob)
{
	
	//readEeprom(EEPROM_ADR_RW,(WORD) (a_byJob*PARAMETER_NUMBER), PARAMETER_NUMBER, m_arwoParameters);	

	if (a_byJob > 0x00)
	{
		m_arwoParameters[PARAM_JOB] = a_byJob;
		parametersSaveJob(0x00); //save current parameters in position 0
	}
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
void parametersSet(BYTE a_byParameterIndex, WORD a_woValue)
{
	if (m_arwoParameters[a_byParameterIndex] != a_woValue)
	{
		m_arwoParameters[a_byParameterIndex] = a_woValue;
		_bset(m_lwoParameterChangedFlag, a_byParameterIndex);
	
		//Write to eeprom 
		parametersSaveJob(0x00);
		//sleep(0xFF);
		//sleep(0xFF);
		//sleep(0xFF);
		
	}
}

