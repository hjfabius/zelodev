#include "parameters.h"

/*****************************************************************************/
// Variables declaration
/*****************************************************************************/

WORD m_arwoParameters[PARAMETER_NUMBER];
BYTE m_arbyParameterChangedFlag[(PARAMETER_NUMBER/8)+1];
BYTE m_arbyParameterVisibleFlag[(PARAMETER_NUMBER/8)+1];
BYTE m_byParamFirstTime = 0xFF;	//0xFF = First time application is start up
BYTE m_byParameterSaveCounter = PARAMETER_EEPROM_POLLING_TIME;

static const WORD mc_arwoParameters[PARAMETER_NUMBER][3] = {
/* PARAM_FREQUENCY*/ 				{0, 65000, 2500},
/* PARAM_CYLINDER*/ 				{0, 65000,  480},
/* PARAM_SPEED*/ 					{0, 65000,   72},
/* PARAM_MULT_FACTOR*/ 				{1,     5,    1},
/* PARAM_LIGHT*/ 					{1,   	4,    1},
/* PARAM_LANGUAGE*/ 				{0,     5,    0}
										  };

										  
	const char * m_arwoMenuLanguagesLabels	[5] = 			{"Italiano", 
													 		 "English ",
													    	 "Francais",
													 		 "Deutsch ",
													 		 "Espanol "}; 
	
	const char * m_arwoMenuFrequencyLabels	[5] = 			{"Frequenz", 
													 		 "Frequenc",
													    	 "Frequenc",
													 		 "Frequenz",
													 		 "Frequenc"}; 
	
	const char * m_arwoMenuCylinderLabels	[5] = 			{"Cilindro", 
													 		 "Cylinder",
													    	 "Cylindre",
													 		 "Zylinder",
													 		 "Cilindro"}; 
	
	const char * m_arwoMenuSpeedLabels	[5] = 				{"Velocita", 
													 		 "Speed   ",
													    	 "Vitesse ",
													 		 "Geschwin",
													 		 "Velocida"}; 
	
	const char * m_arwoMenuLanguageLabels	[5] =		 	{"Lingua: ", 
													 		 "Language",
													    	 "Langue  ",
													 		 "Sprache ",
													 		 "Lengua  "}; 
	
	const char * m_arwoMenuFormatLabels	[5] = 				{"Ripetizi", 
													 		 "Repetiti",
													    	 "Repetiti",
													 		 "Wiederho",
													 		 "Repetici"}; 
	
	const char * m_arwoMenuLightLabels	[5] = 				{"Luce    ", 
													 		 "Light   ",
													    	 "Lumiere ",
													 		 "Licht   ",
													 		 "Luz     "}; 
										  
	const char * m_arwoMsgBattery01Labels	[5] = 			{"Batteria", 
													 		 "Battery ",
													    	 "Batterie",
													 		 "Battery ",
													 		 "Bateria "}; 
										  

	const char * m_arwoMsgBattery02Labels	[5] = 			{"Scarica ", 
													 		 "Low     ",
													    	 "Faible  ",
													 		 "Low     ",
													 		 "Baja    "}; 
										  
	const char * m_arwoMsgTrigger01Labels	[5] = 			{"Trigger ", 
													 		 "External",
													    	 "Déclench",
													 		 "Externer",
													 		 "Disparo "}; 
										  

	const char * m_arwoMsgTrigger02Labels	[5] = 			{"Esterno ", 
													 		 "Trigger ",
													    	 "Externe ",
													 		 "Trigger ",
													 		 "Externo "}; 
										  
										  
										  
/*****************************************************************************/
// Function declaration
/*****************************************************************************/
void parametersVisibleFlagSet(BYTE a_byParameterIndex);
BYTE parametersCheckBound(BYTE a_byParameterIndex, WORD a_woValue);
BYTE parametersSetForced(BYTE a_byParameterIndex, WORD a_woValue);
void parametersWriteToEeprom(BYTE a_byParameterIndex);
WORD parametersReadByEeprom(BYTE a_byParameterIndex);

/*****************************************************************************/
void parametersInit(void)
{
	DataEEInit();

	parametersLoadAll(true);
	parametersInitVisibleFlags();
	parametersChangedFlagReset(0xFF);


	// Initialize and enable Timer5 
	// Polling interrupt to save parameters on EEPROM
	T5CONbits.TON = 0; 				// Disable Timer
	T5CONbits.TCS = 0; 				// Select internal instruction cycle clock
	T5CONbits.TGATE = 0; 			// Disable Gated Timer mode
	T5CONbits.TCKPS = 0b11; 		// Select 1:256 Prescaler
	TMR5 = 0x00; 					// Clear timer register
	PR5 = 39063; 					// Load the period value
	IPC7bits.T5IP = 0x07; 			// Set Timer 5 Interrupt Priority Level
	IFS1bits.T5IF = 0; 				// Clear Timer 5 Interrupt Flag
	IEC1bits.T5IE = 1; 				// Enable Timer 5 interrupt
	T5CONbits.TON = 1; 				// Start Timer
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
		
	parametersVisibleFlagSet(PARAM_FREQUENCY);
	parametersVisibleFlagSet(PARAM_CYLINDER);
	parametersVisibleFlagSet(PARAM_SPEED);
	parametersVisibleFlagSet(PARAM_MULT_FACTOR);

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
	*a_woValue = (WORD) m_arwoParameters[a_byParameterIndex];
}


/*****************************************************************************/
BYTE parametersSetForced(BYTE a_byParameterIndex, WORD a_woValue)
{
	if (parametersCheckBound(a_byParameterIndex, a_woValue))
	{
		m_arwoParameters[a_byParameterIndex] = a_woValue;
		_bset(m_arbyParameterChangedFlag[a_byParameterIndex/8], a_byParameterIndex & 0b00000111);	
		
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

	return byAcceptable;
}

/*****************************************************************************/
void parametersLoadAll(BYTE a_byWithDefault)
{
	BYTE byIndex	= PARAMETER_NUMBER;
	WORD woValue;
	
	while(byIndex-->0)
	{
		woValue = parametersReadByEeprom(byIndex);
		if (!parametersSet(byIndex, woValue) && a_byWithDefault)
		{
			woValue = mc_arwoParameters[byIndex][PARAM_IDX_DEFAULT];
			parametersSet(byIndex, woValue);
		}
	}
}

/*****************************************************************************/
void parametersSaveAll(void)
{
	BYTE byIndex	= PARAMETER_NUMBER;
	
	while(byIndex-->0)
	{
		parametersWriteToEeprom(byIndex);
	}
}


/*****************************************************************************/
char * parametersGetLabel(BYTE a_byParameterIndex)
{
	switch(a_byParameterIndex)
	{
		case PARAM_FREQUENCY:
			return m_arwoMenuFrequencyLabels[m_arwoParameters[PARAM_LANGUAGE]];
			break;
		case PARAM_CYLINDER:
			return m_arwoMenuCylinderLabels[m_arwoParameters[PARAM_LANGUAGE]];
			break;
		case PARAM_SPEED:
			return m_arwoMenuSpeedLabels[m_arwoParameters[PARAM_LANGUAGE]];
			break;
		case PARAM_MULT_FACTOR:
			return m_arwoMenuFormatLabels[m_arwoParameters[PARAM_LANGUAGE]];
			break;
		case PARAM_LIGHT:
			return m_arwoMenuLightLabels[m_arwoParameters[PARAM_LANGUAGE]];
			break;
		case PARAM_LANGUAGE:
			return m_arwoMenuLanguageLabels[m_arwoParameters[PARAM_LANGUAGE]];
			break;
		case PARAM_LANGUAGES:
			return m_arwoMenuLanguagesLabels[m_arwoParameters[PARAM_LANGUAGE]];
			break;
			
		case PARAM_BATTERY_LOW_01:
			return m_arwoMsgBattery01Labels[m_arwoParameters[PARAM_LANGUAGE]];
			break;

		case PARAM_BATTERY_LOW_02:
			return m_arwoMsgBattery02Labels[m_arwoParameters[PARAM_LANGUAGE]];
			break;
		case PARAM_EXTERNAL_TRIGGER_01:
			return m_arwoMsgTrigger01Labels[m_arwoParameters[PARAM_LANGUAGE]];
			break;
		case PARAM_EXTERNAL_TRIGGER_02:
			return m_arwoMsgTrigger01Labels[m_arwoParameters[PARAM_LANGUAGE]];
			break;			
			
		default:
			return "??????";
			break;
	}
	
}

/*****************************************************************************/
BYTE parametersVisible(BYTE a_byParameterIndex)
{
	return _btst(m_arbyParameterVisibleFlag[a_byParameterIndex/8], a_byParameterIndex & 0b00000111);
}


/*****************************************************************************/
void parametersWriteToEeprom(BYTE a_byParameterIndex)
{
	BYTE	byValue;

	byValue = LOBYTE(parametersGetValue(a_byParameterIndex));
	if (byValue != DataEERead((a_byParameterIndex*2)))
	{
		DataEEWrite(byValue, (a_byParameterIndex*2));
	}

	byValue = HIBYTE(parametersGetValue(a_byParameterIndex));
	if (byValue != DataEERead((a_byParameterIndex*2)+1))
	{
		DataEEWrite(byValue, (a_byParameterIndex*2)+1);
	}
	Nop();
}

/*****************************************************************************/
WORD parametersReadByEeprom(BYTE a_byParameterIndex)
{
	WORD	woValue;
	woValue = DataEERead((a_byParameterIndex*2));
	woValue += DataEERead((a_byParameterIndex*2)+1) * 256;
	Nop();

	return  woValue;
}



//--------------------------------------------------------------------------------------
// Polling interrupt to save parameters to eeprom
//--------------------------------------------------------------------------------------
void __attribute__((interrupt, auto_psv)) _T5Interrupt( void )
{
	m_byParameterSaveCounter--;
	if (m_byParameterSaveCounter == 0)
	{
		m_byParameterSaveCounter = PARAMETER_EEPROM_POLLING_TIME;
		parametersSaveAll();
	}

	IFS1bits.T5IF = 0;					/* reset timer interrupt flag	*/
}	
