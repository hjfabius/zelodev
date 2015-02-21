#include "screen.h"

/*****************************************************************************/
// Variables declaration
/*****************************************************************************/
WORD m_woCurrentValue;
BYTE m_bySelectedMenu;
BYTE m_byValueChanged;
BYTE m_strString1[20];
BYTE m_strString2[20];
BYTE m_byDecimal;
	

/*****************************************************************************/
// Functions declaration
/*****************************************************************************/
void screenBigMessage(BYTE * a_strMessage1, BYTE * a_strMessage2);
void screenPrepareStdMessage(BYTE a_byStdMessage);

/*****************************************************************************/
void screenInit(void)
{	
	windowInit();
}

/*****************************************************************************/
void screenReceivedCode(BYTE a_byCode, BYTE a_byCode2, WORD a_woValue)
{
	BYTE i;
	WORD j;
	BYTE strString[16];

	displayClearArea(0, 0, 126, 126);
	displaySetOutLine(0, 0, 126, 126, false);

	strString[12] = 0x00;
	memcpy(strString, "Code 1 = ", 9); 
	formatNumber(a_byCode, 3, 0, strString+9);
	displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 10, 10);
	

	memcpy(strString, "Code 2 = ", 9); 
	formatNumber(a_byCode2, 3, 0, strString+9);
	displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 10, 20);

	strString[15] = 0x00;
	memcpy(strString, "Value  = ", 9); 
	formatNumber(a_woValue, 6, 0, strString+9);
	displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 10, 30);
	
	parametersSet(PARAM_PAGE, PAGE_UNKNOWN_CODE);		
}

/*****************************************************************************/
void screenKeyCode(void)
{
	//screenDisplayKeyCode(displayGetKeyPressed());
	screenReceivedCode(displayGetKeyPressed(),0,0);
}

/*****************************************************************************/
void screenDisplayKeyCode(BYTE a_byKey)
{
	BYTE strString[20];
	BYTE i;

	if (a_byKey != KEY_NULL)
	{
		displayClearArea (0, 0, 126, 126);
		displaySetOutLine(0, 0, 126, 126, false);	
		strString[0] = DISPLAY_CURSOR_POSITION;
		strString[1] = 0x0A;
		strString[2] = 0x0A;
		strString[3] = DISPLAY_WAIT;
		strString[4] = DISPLAY_EOF;
		displayCmdToDisplay(strString);

		for (i=0x00;i<20; i++)
		{
			strString[i] = 0x00;
		}
		memcpy(strString, "KeyPad = ", 9); 
		formatNumberBinary(a_byKey,strString+9);
		displayCmdToDisplay(strString);	
		displayKeyPressedReset();
	}
	
}

/*****************************************************************************/
void screenUpdateCurrentScreen(void)
{
	switch(parametersGetValue(PARAM_PAGE))
	{
		case PAGE_MAIN:
			if (parametersGetValue(PARAM_ALARM) != PARAM_ALARM_OK)
			{
				screenAlarm();
			}
			else
			{
				screenMain();
			}
			break;
		case PAGE_MESSAGE:
			break;
		case PAGE_ALARM:
			if (parametersGetValue(PARAM_ALARM) != PARAM_ALARM_OK)
			{
				screenAlarm();
			}
			else
			{
				screenMain();
			}
			break;
		case PAGE_HISTORY_VALUE:
			screenHistoricalValues();
			break;
		default:
			break;
	}
}


/*****************************************************************************/
void screenMain(void)
{
	windowMode();
	windowViscosityRef();
	windowViscosityReal();
	windowTemperature();	
	if (parametersGetValue(PARAM_ALARM) == PARAM_ALARM_OK)
	{
		windowMain();
		parametersSet(PARAM_PAGE, PAGE_MAIN);	
	}
	else
	{
		windowAlarm();
		parametersSet(PARAM_PAGE, PAGE_ALARM);	
	}
}

/*****************************************************************************/
void screenAlarm(void)
{
	windowMode();
	windowViscosityRef();
	windowViscosityReal();
	windowTemperature();
	windowAlarm();
	parametersSet(PARAM_PAGE, PAGE_ALARM);	
}

/*****************************************************************************/
void screenBigMessage(BYTE * a_strMessage1, BYTE * a_strMessage2)
{
	windowForceRepaint();	
	windowBigMessage(a_strMessage1, a_strMessage2);
}

/*****************************************************************************/
void screen6Menus(BYTE * a_byPage, BYTE * a_byGroup, BYTE * a_bySelected)
{
	window6Menu(a_byGroup, a_bySelected);
	parametersSet(PARAM_PAGE, *a_byPage);	
}

/*****************************************************************************/
void screenValue(BYTE * a_byPage, BYTE * a_byKey)
{
	switch(* a_byPage)
	{
		case PAGE_EXECUTE_SAVE:
			if (parametersSaveJob(m_woCurrentValue))
			{
				screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
			}
			else
			{
				screenBigStdMessage(SCREEN_STD_MSG_WRONG_MEMORY_SLOT);
			}
			sleepFix();
			(* a_byPage) = PAGE_MAIN;		
			break;
		case PAGE_EXECUTE_LOAD:
			if (parametersLoadJob(m_woCurrentValue))
			{
				screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
			}
			else
			{
				screenBigStdMessage(SCREEN_STD_MSG_WRONG_MEMORY_SLOT);
			}
			sleepFix();
			(* a_byPage) = PAGE_MAIN;		
			break;
		case PAGE_EXECUTE_CUP_01:
			parametersSet(PARAM_CUP, PARAM_CUP_FORD_4);
			screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
			sleepFix();
			(* a_byPage) = PAGE_MAIN;		
			break;
		case PAGE_EXECUTE_CUP_02:
			parametersSet(PARAM_CUP, PARAM_CUP_ZHAN_2);
			screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
			sleepFix();
			(* a_byPage) = PAGE_MAIN;		
			break;
		case PAGE_EXECUTE_CALIBRATION:
			parametersSet(PARAM_CALIBRATION_VALUE, m_woCurrentValue);
			screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
			sleepFix();
			(* a_byPage) = PAGE_EXECUTE_CALIBRATION_2;		
			break;
		case PAGE_EXECUTE_RESET_CALIBRATION:
			parametersSet(PARAM_VISCO_OFFSET, parametersGetValue(PARAM_VISCO_OFFSET_FACTORY));

			screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
			sleepFix();
			(* a_byPage) = PAGE_MAIN;		
			break;		
			
		default:
			if (parametersGetValue(PARAM_PAGE) != *a_byPage)
			{
				m_woCurrentValue = 0x0000;
				m_byValueChanged = false;
				switch(*a_byPage)
				{
					case PAGE_ARCHIVE_SAVE:
						m_byDecimal = 0;
						screenPrepareStdMessage(SCREEN_STD_MSG_SAVE_JOB);
						formatNumber(0, 5, m_byDecimal, m_strString2);
						break;
					case PAGE_ARCHIVE_LOAD:
						m_byDecimal = 0;
						screenPrepareStdMessage(SCREEN_STD_MSG_LOAD_JOB);
						formatNumber(0, 5, m_byDecimal, m_strString2);
						break;
					case PAGE_CALIBRATION:
						if (parametersGetValue(PARAM_SHOW_CALIBRATION) == 0) 
						{
							m_byDecimal = 1;
							screenPrepareStdMessage(SCREEN_STD_MSG_CALIBRATION);
							formatNumber(0, 5, m_byDecimal, m_strString2);
						}
						else
						{
							screenBigStdMessage(SCREEN_STD_MSG_CMD_NA);
							sleepFix();
							(* a_byPage) = PAGE_MAIN;									
						}
						break;					
				}
				parametersSet(PARAM_PAGE, *a_byPage);	
			}
			else
			{
				switch((BYTE) (*a_byKey))
				{
					case KEY_ARROW_UP:
						m_byValueChanged = true;
						m_woCurrentValue = m_woCurrentValue+1;
						formatNumber(m_woCurrentValue, 5, m_byDecimal, m_strString2);
						break;
					case KEY_ARROW_DOWN:
						m_byValueChanged = true;
						m_woCurrentValue = m_woCurrentValue-1;
						formatNumber(m_woCurrentValue, 5, m_byDecimal, m_strString2);
						break;
					case KEY_ARROW_UP_F:
						m_byValueChanged = true;
						m_woCurrentValue = m_woCurrentValue+10;
						formatNumber(m_woCurrentValue, 5, m_byDecimal, m_strString2);
						break;
					case KEY_ARROW_DOWN_F:
						m_byValueChanged = true;
						m_woCurrentValue = m_woCurrentValue-10;
						formatNumber(m_woCurrentValue, 5, m_byDecimal, m_strString2);
						break;
					case KEY_FUNCTION:
						m_byValueChanged = true;
						m_woCurrentValue = 0x0000;
						formatNumber(m_woCurrentValue, 5, m_byDecimal, m_strString2);
						break;
					default:
						break;
				}
			}
			
			screenBigMessage(m_strString1, m_strString2);
			break;
	}
}

/*****************************************************************************/
void screenSetUpParameter(BYTE a_byKey, BYTE a_bySetupFull)
{
	parametersSet(PARAM_VISUAL_SETUP_FULL, a_bySetupFull);

	if (parametersGetValue(PARAM_PAGE) == PAGE_SETUP_FULL)
	{
		parametersInitVisibleFlags();
		parametersSet(PARAM_PAGE_SEL, 0);	
		m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL), 0xFFFF);
		m_woCurrentValue = parametersGetValue(m_bySelectedMenu);
		m_byValueChanged = false;
		parametersSet(PARAM_PAGE, PAGE_SETUP);
		parametersChangedFlagReset(PARAM_PAGE_SEL);		
	}
	else if (parametersGetValue(PARAM_PAGE) != PAGE_SETUP)
	{
		if(a_bySetupFull) 
		{
			parametersInitVisibleFlags();
		}
		else
		{
			parametersInitVisibleFlagsSimple();
		}
		parametersSet(PARAM_PAGE_SEL, 0);	
		m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL), 0xFFFF);
		m_woCurrentValue = parametersGetValue(m_bySelectedMenu);
		m_byValueChanged = false;
		parametersSet(PARAM_PAGE, PAGE_SETUP);
		parametersChangedFlagReset(PARAM_PAGE_SEL);		
	}
	else
	{
		switch(a_byKey)
		{
			case KEY_ARCHIVE:
				if (parametersGetValue(PARAM_PAGE_SEL)>0)
				{
					parametersSet(PARAM_PAGE_SEL, parametersGetValue(PARAM_PAGE_SEL)-1);
				}
				else
				{
					parametersSet(PARAM_PAGE_SEL, (PARAMETER_NUMBER-PARAMETER_SETUP_INITIAL_INDEX) + parametersGetValue(PARAM_PAGE_SEL)-1);
				}
				m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL), 0xFFFF);
				m_woCurrentValue = parametersGetValue(m_bySelectedMenu);
				parametersChangedFlagReset(PARAM_PAGE_SEL);	
				m_byValueChanged = false;				
				break;
			
			case KEY_MENU:
				if (m_byValueChanged)
				{
					m_byValueChanged = false;
					m_woCurrentValue = 0x0000;
				}
				
				parametersSet(PARAM_PAGE_SEL, parametersGetValue(PARAM_PAGE_SEL)+1);		
				m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL), 0xFFFF);
				m_woCurrentValue = parametersGetValue(m_bySelectedMenu);
				parametersChangedFlagReset(PARAM_PAGE_SEL);				
				break;
			case KEY_CANCEL:
				if (m_byValueChanged)
				{
					m_byValueChanged = false;
					m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL), 0xFFFF);
					m_woCurrentValue = parametersGetValue(m_bySelectedMenu);
				}
				else
				{
					screenMain();
				}			
				break;
			case KEY_OK:
				if (m_byValueChanged)
				{
					if(parametersSet(m_bySelectedMenu, m_woCurrentValue))
					{
						memcpy(m_strString1, parametersGetLabel(m_bySelectedMenu), 20); 
						m_strString1[19] = 0x00;
						screenBigStdMessage(SCREEN_STD_MSG_PARAMETER_SAVED);
					}
					else
					{
						screenBigStdMessage(SCREEN_STD_MSG_PARAMETER_VALUE_NA);
						parametersSet(PARAM_PAGE, PAGE_SETUP);	
					}
					sleepFix();
					m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL),0xFFFF);				
					m_byValueChanged = false;
					m_woCurrentValue = parametersGetValue(m_bySelectedMenu);
				}
				else
				{
					screenMain();
				}		
				break;
			case KEY_ARROW_UP:
				m_byValueChanged = true;
				m_woCurrentValue = m_woCurrentValue+1;
				m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL), m_woCurrentValue);
				break;
			case KEY_ARROW_DOWN:
				m_byValueChanged = true;
				m_woCurrentValue = m_woCurrentValue-1;
				m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL), m_woCurrentValue);
				break;
			case KEY_ARROW_UP_F:
				m_byValueChanged = true;
				m_woCurrentValue = m_woCurrentValue+10;
				m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL), m_woCurrentValue);
				break;
			case KEY_ARROW_DOWN_F:
				m_byValueChanged = true;
				m_woCurrentValue = m_woCurrentValue-10;
				m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL), m_woCurrentValue);
				break;
			case KEY_FUNCTION:
				m_byValueChanged = true;
				m_woCurrentValue = 0x0000;
				m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL), m_woCurrentValue);
				break;
			default:
				break;
		}
	}
}

/*****************************************************************************/
void screenArchive(void)
{
	screenBigMessage("ARCHIVE", "(operativo)");
}

/*****************************************************************************/
void screenVersion(void)
{
	BYTE strString[20];	

	//screenBigStdMessage(SCREEN_STD_MSG_SW_VERSION);
	//sleepFix();
	
	strString[15] = 0x00;
	strString[16] = 0x00;

	memcpy(strString, "Cpu Board ", 10); 
	memcpy(strString+10, "v     ", 6); 
	formatNumber(mc_byApplicationVersion, 4, 2, strString+12);
	screenBigMessage("Versione SW", strString);
	sleepSec(2);
}


/*****************************************************************************/
void screenBigStdMessage(BYTE a_byStdMessage)
{
	switch(parametersGetValue(PARAM_LANGUAGE))
	{
		case PARAM_LANGUAGE_EN: //English
			switch(a_byStdMessage)
			{
				case SCREEN_STD_MSG_INIT_PARAM:
					screenBigMessage("Parameter", "Initialization");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_WASHING:
					screenBigMessage("Washing", "viscometer...");			
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_ADDING_SOLVENT:
					screenBigMessage("Adding", "solvent...");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;		
				case SCREEN_STD_MSG_RESET:
					screenBigMessage("Restarting", "ViscoWal...");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;		
				case SCREEN_STD_MSG_PARAMETER_SAVED:
					screenBigMessage("Parameter saved:", m_strString1);			
					break;
				case SCREEN_STD_MSG_CMD_DONE:
					screenBigMessage("Command", "done");
					break;
				case SCREEN_STD_MSG_CMD_NA:
					screenBigMessage("Command", "not available");
					break;
				case SCREEN_STD_MSG_SW_VERSION:
					screenBigMessage("SW Version", "");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PARAMETER_VALUE_NA:
					screenBigMessage("Error", "Unacceptable value");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_WRONG_MEMORY_SLOT:
					screenBigMessage("Error: Position", "not available");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_CHECK_PUMP:
					screenBigMessage("Checking", "pump...");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				default:
					break;
			}
		
			break;
		case PARAM_LANGUAGE_DE: //***TODO: Da cambiare*** German
			switch(a_byStdMessage)
			{
				case SCREEN_STD_MSG_INIT_PARAM:
					screenBigMessage("Inizializzazione", "parametri");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_WASHING:
					screenBigMessage("Contro-lavaggio", "pompa");			
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_ADDING_SOLVENT:
					screenBigMessage("Aggiunta solvente", "in corso");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_RESET:
					screenBigMessage("Riavvio ViscoWal", "in corso");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PARAMETER_SAVED:
					screenBigMessage("Parametro salvato:", m_strString1);			
					break;
				case SCREEN_STD_MSG_CMD_DONE:
					screenBigMessage("Comando eseguito", "correttamente");
					break;
				case SCREEN_STD_MSG_CMD_NA:
					screenBigMessage("Comando non", "disponibile");
					break;
				case SCREEN_STD_MSG_SW_VERSION:
					screenBigMessage("Versione SW", "");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PARAMETER_VALUE_NA:
					screenBigMessage("Errore: Valore ", "non accettabile");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_WRONG_MEMORY_SLOT:
					screenBigMessage("Errore: Posizione", "non disponibile");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_CHECK_PUMP:
					screenBigMessage("Controllo pompa", "in corso");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;					
				default:
					break;
			}
			break;
		case PARAM_LANGUAGE_FR: //***TODO: Da cambiare*** French
			switch(a_byStdMessage)
			{
				case SCREEN_STD_MSG_INIT_PARAM:
					screenBigMessage("Inizializzazione", "parametri");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_WASHING:
					screenBigMessage("Contro-lavaggio", "pompa");			
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_ADDING_SOLVENT:
					screenBigMessage("Aggiunta solvente", "in corso");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_RESET:
					screenBigMessage("Riavvio ViscoWal", "in corso");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PARAMETER_SAVED:
					screenBigMessage("Parametro salvato:", m_strString1);			
					break;
				case SCREEN_STD_MSG_CMD_DONE:
					screenBigMessage("Comando eseguito", "correttamente");
					break;
				case SCREEN_STD_MSG_CMD_NA:
					screenBigMessage("Comando non", "disponibile");
					break;
				case SCREEN_STD_MSG_SW_VERSION:
					screenBigMessage("Versione SW", "");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PARAMETER_VALUE_NA:
					screenBigMessage("Errore: Valore ", "non accettabile");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_WRONG_MEMORY_SLOT:
					screenBigMessage("Errore: Posizione", "non disponibile");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_CHECK_PUMP:
					screenBigMessage("Controllo pompa", "in corso");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;					
				default:
					break;
			}
			break;
		case PARAM_LANGUAGE_ES: //***TODO: Da cambiare*** Spanish
			switch(a_byStdMessage)
			{
				case SCREEN_STD_MSG_INIT_PARAM:
					screenBigMessage("Inizializzazione", "parametri");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_WASHING:
					screenBigMessage("Contro-lavaggio", "pompa");			
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_ADDING_SOLVENT:
					screenBigMessage("Aggiunta solvente", "in corso");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_RESET:
					screenBigMessage("Riavvio ViscoWal", "in corso");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PARAMETER_SAVED:
					screenBigMessage("Parametro salvato:", m_strString1);			
					break;
				case SCREEN_STD_MSG_CMD_DONE:
					screenBigMessage("Comando eseguito", "correttamente");
					break;
				case SCREEN_STD_MSG_CMD_NA:
					screenBigMessage("Comando non", "disponibile");
					break;
				case SCREEN_STD_MSG_SW_VERSION:
					screenBigMessage("Versione SW", "");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PARAMETER_VALUE_NA:
					screenBigMessage("Errore: Valore ", "non accettabile");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_WRONG_MEMORY_SLOT:
					screenBigMessage("Errore: Posizione", "non disponibile");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_CHECK_PUMP:
					screenBigMessage("Controllo pompa", "in corso");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;					
				default:
					break;
			}
			break;
		default:  	//PARAM_LANGUAGE_IT - Italian
			switch(a_byStdMessage)
			{
				case SCREEN_STD_MSG_INIT_PARAM:
					screenBigMessage("Inizializzazione", "parametri");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_WASHING:
					screenBigMessage("Contro-lavaggio", "pompa");			
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_ADDING_SOLVENT:
					screenBigMessage("Aggiunta solvente", "in corso");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_RESET:
					screenBigMessage("Riavvio ViscoWal", "in corso");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PARAMETER_SAVED:
					screenBigMessage("Parametro salvato:", m_strString1);			
					break;
				case SCREEN_STD_MSG_CMD_DONE:
					screenBigMessage("Comando eseguito", "correttamente");
					break;
				case SCREEN_STD_MSG_CMD_NA:
					screenBigMessage("Comando non", "disponibile");
					break;
				case SCREEN_STD_MSG_SW_VERSION:
					screenBigMessage("Versione SW", "");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PARAMETER_VALUE_NA:
					screenBigMessage("Errore: Valore ", "non accettabile");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_WRONG_MEMORY_SLOT:
					screenBigMessage("Errore: Posizione", "non disponibile");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_CHECK_PUMP:
					screenBigMessage("Controllo pompa", "in corso");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;					
				default:
					break;
			}
			break;
	}	
}

/*****************************************************************************/
void screenPrepareStdMessage(BYTE a_byStdMessage)
{
	switch(parametersGetValue(PARAM_LANGUAGE))
	{
		case PARAM_LANGUAGE_EN: //English
			switch(a_byStdMessage)
			{
				case SCREEN_STD_MSG_SAVE_JOB:
					memcpy(m_strString1, "Save Job", 20);
					memcpy(m_strString2, "      mem. position", 20);		
					break;
				case SCREEN_STD_MSG_LOAD_JOB:
					memcpy(m_strString1, "Load Job", 20);
					memcpy(m_strString2, "      mem. position", 20);		
					break;
				case SCREEN_STD_MSG_CALIBRATION:
					memcpy(m_strString1, "Viscosity value", 20);
					memcpy(m_strString2, "      (sec)", 20);		
					break;
				default:
					break;
			}
			break;
		default:  	//PARAM_LANGUAGE_IT - Italian
			switch(a_byStdMessage)
			{
				case SCREEN_STD_MSG_SAVE_JOB:
					memcpy(m_strString1, "Salva lavoro", 20);
					memcpy(m_strString2, "      posizione mem", 20);		
					break;
				case SCREEN_STD_MSG_LOAD_JOB:
					memcpy(m_strString1, "Carica lavoro", 20);
					memcpy(m_strString2, "      posizione mem", 20);
					break;
				case SCREEN_STD_MSG_CALIBRATION:
					memcpy(m_strString1, "Valore Viscosita'", 20);
					memcpy(m_strString2, "      (sec)", 20);		
					break;
				default:
					break;
			}			
			break;
	}			
}

/*****************************************************************************/
void screenHistoricalValues(void)
{	
	window6Messages();					
	parametersSet(PARAM_PAGE, PAGE_HISTORY_VALUE);
}
