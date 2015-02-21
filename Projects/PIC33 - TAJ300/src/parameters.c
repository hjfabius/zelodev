#include "parameters.h"

/*****************************************************************************/
// Variables declaration
/*****************************************************************************/

		 WORD m_arwoParameters[PARAMETER_NUMBER];
		 BYTE m_arbyParameterChangedFlag[(PARAMETER_NUMBER/8)+1];
		 BYTE m_arbyParameterVisibleFlag[(PARAMETER_NUMBER/8)+1];
		 BYTE m_byParamFirstTime = 0xFF;	//0xFF = First time Taj 200 is start up
		 BYTE m_byEepromAppIndex = PARAM_IDX_EEPROM_APP_01;
volatile BYTE m_arbyScanningHeadSignal[ENCODER_PERIOD/4];

	    double m_dblSpeedFactor;						
	    double m_dblMillimeterInEncoderPulse;
		


static const WORD mc_arwoParameters[][5] = {
/* PARAM_JOB						    */ {1,		1000,	1,		JOB_PARAM_JOB,						EEPROM_ADR_00	},
/* PARAM_CYLINDER_TRAVEL                */ {1500,	25000,	4800,	JOB_PARAM_CYLINDER_TRAVEL,			EEPROM_ADR_00	},	/* Millimeters / 10 */
/* PARAM_GATE_WINDOW                    */ {50,		6000,	200,	JOB_PARAM_GATE_WINDOW,				EEPROM_ADR_00	},	/* Millimeters / 10 */
/* PARAM_ENCODER_NP                     */ {0,		1,		0,		JOB_NONE,							EEPROM_ADR_00	},	
/* PARAM_ALARM_BOUND                    */ {0,		1000,	0,		JOB_PARAM_ALARM_BOUND,				EEPROM_ADR_00	},	/* Millimeters */
/* PARAM_SPEED                          */ {0,		0,		0,		JOB_NONE,							EEPROM_ADR_NONE	},	/* Meter/Minutes */
/* PARAM_SH_GAIN                        */ {0,		96,		96,		JOB_PARAM_SH_GAIN,					EEPROM_ADR_00	},
/* PARAM_ALARM                          */ {0,		0,		0,		JOB_NONE,							EEPROM_ADR_NONE	},
/* PARAM_PAGE                           */ {0,		0,		0,		JOB_NONE,							EEPROM_ADR_NONE	},
/* PARAM_PAGE_SEL                       */ {0,		0,		0,		JOB_NONE,							EEPROM_ADR_NONE	},
/* PARAM_MODE_LONG                      */ {0,		0,		0,		JOB_NONE,							EEPROM_ADR_00	},
/* PARAM_MODE_TRANS                     */ {0,		0,		0,		JOB_NONE,							EEPROM_ADR_00	},
/* PARAM_MODE_PULL                      */ {0,		0,		0,		JOB_NONE,							EEPROM_ADR_00	},
/* PARAM_CORRECTION                     */ {0,		0,		0,		JOB_NONE,							EEPROM_ADR_NONE	},
/* PARAM_ERR_LONG                       */ {0,		0,		0,		JOB_NONE,							EEPROM_ADR_NONE	},	/* Millimeters / 100 */
/* PARAM_ERR_TRANS                      */ {0,		0,		0,		JOB_NONE,							EEPROM_ADR_NONE	},	/* Millimeters / 100 */
/* PARAM_OSCIL_ZOOM                     */ {0,		0,		1,		JOB_NONE,							EEPROM_ADR_NONE	},
/* PARAM_OSCIL_OFFSET                   */ {0,		0,		0,		JOB_NONE,							EEPROM_ADR_NONE	},
/* PARAM_OSCIL_MANUAL_OFFSET            */ {0,		0,		0,		JOB_NONE,							EEPROM_ADR_NONE	},
/* PARAM_ERR_BOUND_LONG                 */ {0,		0,		0,		JOB_NONE,							EEPROM_ADR_00	},	/* Millimeters / 100 */
/* PARAM_VISUAL_SETUP_FULL              */ {0,		0,		0,		JOB_NONE,							EEPROM_ADR_NONE	},
/* PARAM_OFF                            */ {0,		0,		0,		JOB_NONE,							EEPROM_ADR_NONE	},
/* PARAM_TWIN_CURRENT_APPLICATION       */ {0,		7,		0,		JOB_PARAM_TWIN_CURRENT_APPLICATION,	EEPROM_ADR_00	},
/* PARAM_CURRENT_ENCODER                */ {0,		1,		0,		JOB_PARAM_CURRENT_ENCODER,			EEPROM_ADR_00	},
/* PARAM_ENC_GATE01_REFERENCE           */ {0,		1024,	240,	JOB_PARAM_ENC_GATE01_REFERENCE,		EEPROM_ADR_00	},  /* Encoder Pulses */
/* PARAM_ENC_GATE01_REFERENCE_1000      */ {0,		1000,	0,		JOB_PARAM_ENC_GATE01_REFERENCE_1000,EEPROM_ADR_00	},  /* Encoder Pulses / 1000 */
/* PARAM_ENC_GATE01_START               */ {0,		1024,	230,	JOB_PARAM_ENC_GATE01_START,			EEPROM_ADR_00	},	/* Encoder Pulses */
/* PARAM_ENC_GATE01_END                 */ {0,		1024,	250,	JOB_PARAM_ENC_GATE01_END,			EEPROM_ADR_00	},	/* Encoder Pulses */
/* PARAM_CYLINDER_ENCODER_RATIO 		*/ {0,		0,		1000,	JOB_NONE,							EEPROM_ADR_00	},	/* Cylinder/Encoder ratio * 1000 */
/* PARAM_ENC_GATE02_DISTANCE            */ {0,		1024,	200,	JOB_PARAM_ENC_GATE02_DISTANCE,		EEPROM_ADR_00	},  /* Encoder Pulses */
/* PARAM_ENC_GATE02_END                 */ {0,		1024,	470,	JOB_PARAM_ENC_GATE02_END,			EEPROM_ADR_00	},	/* Encoder Pulses */
/* PARAM_ENC_GATE02_START               */ {0,		1024,	450,	JOB_PARAM_ENC_GATE02_START,			EEPROM_ADR_00	},	/* Encoder Pulses */
/* PARAM_SH_PN                          */ {0,		1,		0,		JOB_PARAM_SH_PN,					EEPROM_ADR_00	},	/* 0=Positive	1=Negative */
/* PARAM_BASE_VALUE_DAC                 */ {0,		1000,	500,	JOB_NONE,							EEPROM_ADR_00	},
/* PARAM_SCREEN_REFRESH_COUNT           */ {0,		9000,	0,		JOB_NONE,							EEPROM_ADR_00	},
/* PARAM_MM_POSITION_01             	*/ {1,		10,		1,		JOB_PARAM_MM_POSITION_01,			EEPROM_ADR_00	},
/* PARAM_MM_POSITION_02             	*/ {1,		10,		2,		JOB_PARAM_MM_POSITION_02,			EEPROM_ADR_00	},

/* PARAM_LONG_GAIN                      */ {1,		100,	10,		JOB_PARAM_LONG_GAIN,				EEPROM_ADR_00	},
/* PARAM_LONG_INTERVAL                  */ {1,		100,	3,		JOB_PARAM_LONG_INTERVAL,			EEPROM_ADR_00	},
/* PARAM_LONG_DERIVATIVE                */ {0,		255,	1,		JOB_PARAM_LONG_DERIVATIVE,			EEPROM_ADR_00	},
/* PARAM_LONG_DEAD_ZONE                 */ {0,		100,	10,		JOB_PARAM_LONG_DEAD_ZONE,			EEPROM_ADR_00	},
/* PARAM_LONG_MOTOR_SPEED               */ {1,		255,	10,		JOB_PARAM_LONG_MOTOR_SPEED,			EEPROM_ADR_00	},
/* PARAM_TRANS_GAIN                     */ {1,		100,	10,		JOB_PARAM_TRANS_GAIN,				EEPROM_ADR_00	},
/* PARAM_TRANS_INTERVAL                 */ {1,		100,	3,		JOB_PARAM_TRANS_INTERVAL,			EEPROM_ADR_00	},
/* PARAM_TRANS_DEAD_ZONE                */ {0,		100,	10,		JOB_PARAM_TRANS_DEAD_ZONE,			EEPROM_ADR_00	},
/* PARAM_TRANS_MOTOR_SPEED              */ {1,		255,	10,		JOB_PARAM_TRANS_MOTOR_SPEED,		EEPROM_ADR_00	},
/* PARAM_PULL_GAIN                      */ {1,		255,	10,		JOB_PARAM_PULL_GAIN,				EEPROM_ADR_00	},
/* PARAM_PULL_INTERVAL                  */ {0,		100,	10,		JOB_PARAM_PULL_INTERVAL,			EEPROM_ADR_00	},
/* PARAM_INSERTION_SPEED_THRESHOLD      */ {1,		255,	1,		JOB_PARAM_INSERTION_SPEED_THRESHOLD,EEPROM_ADR_00	},
/* PARAM_JUMP_ERROR                     */ {0,		9,		1,		JOB_PARAM_JUMP_ERROR,				EEPROM_ADR_00	},
/* PARAM_VARIATION_SPEED                */ {0,		14,		0,		JOB_PARAM_VARIATION_SPEED,			EEPROM_ADR_00	},
/* PARAM_REFERENCE_SIGNAL               */ {1,		10,		1,		JOB_PARAM_REFERENCE_SIGNAL,			EEPROM_ADR_00	},
/* PARAM_MM_SIGNAL_POSITION             */ {1,		10,		1,		JOB_PARAM_MM_SIGNAL_POSITION,		EEPROM_ADR_00	},
/* PARAM_MARK_SHAPE                     */ {0,		4,		0,		JOB_PARAM_MARK_SHAPE,				EEPROM_ADR_00	},  /* Reference PARAM_MARK_SHAPE_XX */
/* PARAM_REVERSAL_CORRECTION            */ {0,		1,		0,		JOB_NONE,							EEPROM_ADR_00	},	/* 0=Normal	1=Reverse */
/* PARAM_AUTO_REGISTER_AFTER_F4         */ {0,		1,		0,		JOB_PARAM_AUTO_REGISTER_AFTER_F4,	EEPROM_ADR_00	},	/* 0=Yes	1=No */
/* PARAM_LANGUAGE                       */ {1,		5,		1,		JOB_NONE,							EEPROM_ADR_00	},
/* PARAM_TRANS_ENABLE                   */ {0,		1,		1,		JOB_PARAM_TRANS_ENABLE,				EEPROM_ADR_00	},	/* 0=Enable	1=Off */
/* PARAM_PULL_ENABLE                    */ {0,		1,		1,		JOB_PARAM_PULL_ENABLE,				EEPROM_ADR_00	},	/* 0=Enable	1=Off */
/* PARAM_COLD_SEAL_ENABLE               */ {0,		1,		1,		JOB_PARAM_COLD_SEAL_ENABLE,			EEPROM_ADR_00	},	/* 0=Enable	1=Off */
/* PARAM_ERROR_ZOOM                     */ {1,		10,		2,		JOB_NONE,							EEPROM_ADR_00	},
/* PARAM_TWIN_APPLICATION_01            */ {0,		7,		0,		JOB_NONE,							EEPROM_ADR_00	},
/* PARAM_TWIN_APPLICATION_02            */ {0,		7,		0,		JOB_NONE,							EEPROM_ADR_00	},
/* PARAM_TWIN_ENCODER_ENABLE            */ {0,		1,		1,		JOB_NONE,							EEPROM_ADR_00	},	/* 0=Enable	1=Off */
/* PARAM_MACHINE_SERIAL_NUMBER          */ {100,	1000,	100,	JOB_NONE,							EEPROM_ADR_00	},
/* PARAM_F4_DIMENSION                   */ {0,		600,	0,		JOB_PARAM_F4_DIMENSION,				EEPROM_ADR_00	},
/* PARAM_KEYBOARD_DELAY                 */ {0,		2000,	400,	JOB_NONE,							EEPROM_ADR_00	},
/* PARAM_SH_PN_ENABLE                   */ {0,		1,		1,		JOB_NONE,							EEPROM_ADR_00	},	/* 0=Enable	1=Off */
/* PARAM_LONG_DAC_ENABLE                */ {0,		2,		1,		JOB_NONE,							EEPROM_ADR_00	},
/* PARAM_TRANS_DAC_ENABLE               */ {0,		1,		1,		JOB_NONE,							EEPROM_ADR_00	},	/* 0=Enable	1=Off */
/* PARAM_PULL_DAC_ENABLE                */ {0,		1,		1,		JOB_NONE,							EEPROM_ADR_00	},	/* 0=Enable	1=Off */
/* PARAM_DELTA_COR_DAC                  */ {0,		9000,	0,		JOB_NONE,							EEPROM_ADR_00	},
/* PARAM_DELTA_COR_TENS_DAC             */ {0,		9000,	0,		JOB_NONE,							EEPROM_ADR_00	},
/* PARAM_MANUAL_GAIN_DAC                */ {0,		9000,	0,		JOB_NONE,							EEPROM_ADR_00	},
/* PARAM_OFFSET_DAC                     */ {0,		1000,	96,		JOB_NONE,							EEPROM_ADR_00	},
/* PARAM_SHOW_CYLINDER                  */ {0,		1,		0,		JOB_NONE,							EEPROM_ADR_00	},	/* 0=Yes	1=No */
/* PARAM_SNI_TIMER                      */ {0,		2000,	632,	JOB_NONE,							EEPROM_ADR_00	},
/* PARAM_ALARM_DELAY                    */ {0,		100,	0,		JOB_NONE,							EEPROM_ADR_00	},
/* PARAM_SCREEN_REFRESH                 */ {0,		9000,	0,		JOB_NONE,							EEPROM_ADR_00	},
/* PARAM_RUNNING_MODE             		*/ {0,		1,		0,		JOB_NONE,							EEPROM_ADR_00	}	/* Reference PARAM_RUNNING_MODE_XX */
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
		//parametersVisibleFlagSet(PARAM_TRANS_MOTOR_SPEED);
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
	WORD woValue;
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
	BYTE byAddress;
	
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

		/*TODO: TAJ300: Removed to allow defauls
		if (mc_arwoParameters[byIndex][m_byEepromAppIndex]!=EEPROM_ADR_NONE)
		{
			readEeprom(mc_arwoParameters[byIndex][m_byEepromAppIndex], byIndex*2, 2, (BYTE *) &woValue);
		}
		else*/ if (a_byWithDefault)
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
