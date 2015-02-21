#include "screen.h"

/*****************************************************************************/
// Variables declaration
/*****************************************************************************/
WORD m_woCurrentValue;
BYTE m_bySelectedMenu;
BYTE m_byDecimal;
BYTE m_byValueChanged;
BYTE m_strString1[20];
BYTE m_strString2[20];

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
	screenDisplayKeyCode(displayGetKeyPressed());
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
	BYTE byPage;
	
	byPage = parametersGetValue(PARAM_PAGE); 
	switch(byPage)
	{
		case PAGE_OSCILLOSCOPE:
			screenOscilloscope(byPage);
			break;
		case PAGE_PHASE_OSCILL:
			screenOscilloscope(byPage);
			break;
		case PAGE_PHASE_FAST:
			screenOscilloscope(byPage);
			break;
		case PAGE_REGISTER:
			if (parametersGetValue(PARAM_ALARM) != STI_ANSWER_OK)
			{
				screenAlarm();
			}
			else
			{
				screenRegister();
			}
			break;
		case PAGE_MESSAGE:
			break;
		case PAGE_ALARM:
			if (parametersGetValue(PARAM_ALARM) != STI_ANSWER_OK)
			{
				screenAlarm();
			}
			else
			{
				screenRegister();
			}
		default:
			break;
	}
}

/*****************************************************************************/
void screenOscilloscope(BYTE a_byPage)
{
	windowMode();
	windowSpeed();
	windowDacValue();
	windowCylinderSizeValue();
	windowOscilloscope(a_byPage);
	parametersSet(PARAM_PAGE, a_byPage);	
}

/*****************************************************************************/
void screenRegister(void)
{
	
	if (parametersGetValue(PARAM_ALARM) == STI_ANSWER_OK)
	{
		//Force Screen Refresh
		if(parametersGetValue(PARAM_SCREEN_REFRESH) > 0)
		{
			if (parametersGetValue(PARAM_SCREEN_REFRESH_COUNT) == 0)
			{
				windowForceRepaint();
				parametersSet(PARAM_SCREEN_REFRESH_COUNT, parametersGetValue(PARAM_SCREEN_REFRESH));
			}
			else
			{
				parametersSet(PARAM_SCREEN_REFRESH_COUNT,  parametersGetValue(PARAM_SCREEN_REFRESH_COUNT) -1);
			}
			
		}
		
		
		windowMode();
		windowSpeed();
		windowDacValue();
		windowCylinderSizeValue();
		windowRegister();
		parametersSet(PARAM_PAGE, PAGE_REGISTER);	
	}
	else
	{
		screenAlarm();
	}
}

/*****************************************************************************/
void screenAlarm(void)
{
	windowMode();
	windowSpeed();
	windowDacValue();
	windowCylinderSizeValue();
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
	if(	(LOBYTE(parametersGetValue(PARAM_PAGE_SEL)) == (*a_bySelected)) &&
		(LOBYTE(parametersGetValue(PARAM_PAGE)) == (*a_byPage)))
	{
		return;
	}

	window6Menu(a_byGroup, a_bySelected);
	parametersSet(PARAM_PAGE, *a_byPage);	
}

/*****************************************************************************/
void screenValue(BYTE * a_byPage, BYTE * a_byKey)
{
	if ((* a_byPage)==PAGE_SAVE)
	{
		switch(parametersGetValue(PARAM_PAGE))
		{
			case PAGE_P1_VALUE:
				if (m_byValueChanged)
				{
					if(parametersSet(PARAM_CYLINDER_TRAVEL,m_woCurrentValue))
					{
						screenBigStdMessage(SCREEN_STD_MSG_PARAMETER_SAVED);
					}
					else
					{
						screenBigStdMessage(SCREEN_STD_MSG_PARAMETER_VALUE_NA);
					}
					sleepFix();
				}
				(* a_byPage) = PAGE_P1;
				break;
			case PAGE_P2_VALUE:
				if (m_byValueChanged)
				{
					if(parametersSet(PARAM_ALARM_BOUND,m_woCurrentValue))
					{
						parametersSet(PARAM_ERR_BOUND_LONG, false);
						screenBigStdMessage(SCREEN_STD_MSG_PARAMETER_SAVED);
					}
					else
					{
						screenBigStdMessage(SCREEN_STD_MSG_PARAMETER_VALUE_NA);
					}
					sleepFix();
				}
				(* a_byPage) = PAGE_P2;
				break;
			case PAGE_P3_VALUE:
				if (m_byValueChanged)
				{
					if(parametersSet(PARAM_GATE_WINDOW,m_woCurrentValue))
					{
						screenBigStdMessage(SCREEN_STD_MSG_PARAMETER_SAVED);
					}
					else
					{
						screenBigStdMessage(SCREEN_STD_MSG_PARAMETER_VALUE_NA);
					}					
					sleepFix();
				}
				(* a_byPage) = PAGE_P3;
				break;
			case PAGE_P5_VALUE:
				if (m_byValueChanged)
				{
					if(parametersSet(PARAM_BASE_VALUE_DAC,m_woCurrentValue))
					{
						screenBigStdMessage(SCREEN_STD_MSG_PARAMETER_SAVED);
					}
					else
					{
						screenBigStdMessage(SCREEN_STD_MSG_PARAMETER_VALUE_NA);
					}					
					sleepFix();
				}
				(* a_byPage) = PAGE_P5;
				break;
			case PAGE_P6_VALUE:
				if (m_byValueChanged)
				{
					if(parametersSet(PARAM_DIVISOR,m_woCurrentValue))
					{
						screenBigStdMessage(SCREEN_STD_MSG_PARAMETER_SAVED);
					}
					else
					{
						screenBigStdMessage(SCREEN_STD_MSG_PARAMETER_VALUE_NA);
					}					
					sleepFix();
				}
				(* a_byPage) = PAGE_P6;
				break;
			case PAGE_COR_MINUS:
				if (m_byValueChanged)
				{
					screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
					STI_SendMessage(STI_FUNZ_SHIFT_REFERENCE_AUTO, STI_DIRECTION_R, m_woCurrentValue);
					sleepFix();
				}
				(* a_byPage) = PAGE_REGISTER;
				break;
			case PAGE_COR_PLUS:
				if (m_byValueChanged)
				{
					screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
					STI_SendMessage(STI_FUNZ_SHIFT_REFERENCE_AUTO, STI_DIRECTION_A, m_woCurrentValue);
					sleepFix();
				}
				(* a_byPage) = PAGE_REGISTER;
				break;
			case PAGE_COR_LEFT:
				if (m_byValueChanged)
				{
					screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
					STI_SendMessage(STI_FUNZ_SHIFT_REFERENCE_AUTO, STI_DIRECTION_O, m_woCurrentValue);
					sleepFix();
				}
				(* a_byPage) = PAGE_REGISTER;
				break;
			case PAGE_COR_RIGHT:
				if (m_byValueChanged)
				{
					screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
					STI_SendMessage(STI_FUNZ_SHIFT_REFERENCE_AUTO, STI_DIRECTION_T, m_woCurrentValue);
					sleepFix();
				}
				(* a_byPage) = PAGE_REGISTER;
				break;
			case PAGE_ARCHIVE_SAVE:
				if (parametersSaveJob(m_woCurrentValue))
				{
					screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
				}
				else
				{
					screenBigStdMessage(SCREEN_STD_MSG_WRONG_MEMORY_SLOT);
				}
				sleepFix();
				(* a_byPage) = PAGE_REGISTER;
				break;
			case PAGE_ARCHIVE_LOAD:
				if (parametersLoadJob(m_woCurrentValue))
				{
					screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
				}
				else
				{
					screenBigStdMessage(SCREEN_STD_MSG_WRONG_MEMORY_SLOT);
				}
				sleepFix();
				(* a_byPage) = PAGE_REGISTER;
				break;
		}
	}
	else
	{
		if (parametersGetValue(PARAM_PAGE) != *a_byPage)
		{
			m_woCurrentValue = 0x0000;
			m_byValueChanged = false;
			m_byDecimal = 0;
			switch(*a_byPage)
			{
				case PAGE_P1_VALUE:
					m_byDecimal = 1;
					screenPrepareStdMessage(SCREEN_STD_MSG_CYLINDER_TRAVEL);
					formatNumber(STI_GetMessage(STI_PARAM_CYLINDER_TRAVEL), 7, 1, m_strString2);
					break;
				case PAGE_P2_VALUE:
					screenPrepareStdMessage(SCREEN_STD_MSG_ALLARM);
					formatNumber(STI_GetMessage(STI_PARAM_ALARM_BOUND), 5, 0, m_strString2);
					break;
				case PAGE_P3_VALUE:
					screenPrepareStdMessage(SCREEN_STD_MSG_GATE_WINDOW);
					formatNumber(STI_GetMessage(STI_PARAM_GATE_WINDOW), 5, 0, m_strString2);
					break;
				case PAGE_P5_VALUE:
					screenPrepareStdMessage(SCREEN_STD_MSG_PARAM_5);
					formatNumber(STI_GetMessage(STI_PARAM_BASE_VALUE_DAC), 5, 0, m_strString2);
					break;
				case PAGE_P6_VALUE:
					screenPrepareStdMessage(SCREEN_STD_MSG_PARAM_6);
					formatNumber(STI_GetMessage(STI_PARAM_DIVISOR), 5, 0, m_strString2);
					break;
				case PAGE_COR_MINUS:
					screenPrepareStdMessage(SCREEN_STD_MSG_DIRECTION_R);
					formatNumber(0, 5, 0, m_strString2);
					break;
				case PAGE_COR_PLUS:
					screenPrepareStdMessage(SCREEN_STD_MSG_DIRECTION_A);	
					formatNumber(0, 5, 0, m_strString2);
					break;
				case PAGE_COR_LEFT:
					screenPrepareStdMessage(SCREEN_STD_MSG_DIRECTION_O);
					formatNumber(0, 5, 0, m_strString2);
					break;
				case PAGE_COR_RIGHT:
					screenPrepareStdMessage(SCREEN_STD_MSG_DIRECTION_T);
					formatNumber(0, 5, 0, m_strString2);
					break;
				case PAGE_ARCHIVE_SAVE:
					screenPrepareStdMessage(SCREEN_STD_MSG_SAVE_JOB);
					formatNumber(0, 5, 0, m_strString2);
					break;
				case PAGE_ARCHIVE_LOAD:
					screenPrepareStdMessage(SCREEN_STD_MSG_LOAD_JOB);
					formatNumber(0, 5, 0, m_strString2);
					break;
			}
			parametersSet(PARAM_PAGE, *a_byPage);	
		}
		else
		{
			m_byValueChanged = true;
			if (
				((m_woCurrentValue <999) && (m_byDecimal == 0)) ||
				((m_woCurrentValue <9999) && (m_byDecimal > 0)) 
			   )
			{
				m_woCurrentValue = (m_woCurrentValue*10) + (*a_byKey);
				if (m_byDecimal>0)
				{
					formatNumber(m_woCurrentValue, 5 + m_byDecimal +1, m_byDecimal, m_strString2);
				}
				else
				{
					formatNumber(m_woCurrentValue, 5, 0, m_strString2);
				}
			}
		}
		
		screenBigMessage(m_strString1, m_strString2);
	}
}

/*****************************************************************************/
void screenSetUpParameter(BYTE a_byKey, BYTE a_bySetupFull)
{
	if (parametersGetValue(PARAM_PAGE) != PAGE_SETUP)
	{
		parametersInitVisibleFlags();
		parametersSet(PARAM_VISUAL_SETUP_FULL, a_bySetupFull);
		parametersSet(PARAM_PAGE_SEL, 0);	
		m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL), 0xFFFF);
		m_woCurrentValue = 0x0000;
		m_byValueChanged = false;
		parametersSet(PARAM_PAGE, PAGE_SETUP);
		parametersChangedFlagReset(PARAM_PAGE_SEL);		
	}
	else
	{
		if(a_byKey == KEY_ARROW_UP) 
		{
			if (m_byValueChanged)
			{
				m_byValueChanged = false;
				m_woCurrentValue = 0x0000;
			}
			
			parametersSet(PARAM_PAGE_SEL, (PARAMETER_NUMBER-PARAMETER_SETUP_INITIAL_INDEX-1)+parametersGetValue(PARAM_PAGE_SEL));		
			m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL), 0xFFFF);
			parametersChangedFlagReset(PARAM_PAGE_SEL);		
		}
		else if((a_byKey == KEY_ARROW_DOWN) || (a_byKey == KEY_SETUP))
		{
			if (m_byValueChanged)
			{
				m_byValueChanged = false;
				m_woCurrentValue = 0x0000;
			}
			
			parametersSet(PARAM_PAGE_SEL, (PARAMETER_NUMBER-PARAMETER_SETUP_INITIAL_INDEX+1)+parametersGetValue(PARAM_PAGE_SEL));		
			m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL), 0xFFFF);
			parametersChangedFlagReset(PARAM_PAGE_SEL);		
		}
		else if(a_byKey == KEY_CANCEL) 
		{
			if (m_byValueChanged)
			{
				m_byValueChanged = false;
				m_woCurrentValue = 0x0000;
				m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL), 0xFFFF);
			}
			else
			{
				screenRegister();
			}
		}
		else if(a_byKey == KEY_OK) 
		{
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
				m_byValueChanged = false;
				m_woCurrentValue = 0x0000;
				sleepFix();
				m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL),0xFFFF);				
			}
			else
			{
				parametersSet(PARAM_MODE_LONG, STI_GetMessage(STI_PARAM_MODE_LONG));
				parametersSet(PARAM_MODE_TRANS, STI_GetMessage(STI_PARAM_MODE_TRANS));
				parametersSet(PARAM_CORRECTION, STI_GetMessage(STI_PARAM_CORRECTIONS));				
				screenRegister();
			}
		}
		else //Numeric key
		{
			if (m_woCurrentValue <999)
			{
				m_byValueChanged = true;
				m_woCurrentValue = (m_woCurrentValue*10) + (a_byKey);
				m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL), m_woCurrentValue);
			}			
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

	strString[15] = 0x00;
	strString[16] = 0x00;
	memcpy(strString, "Taj Board v", 11); 
	formatNumber(STI_GetMessage(STI_PARAM_PROGRAM_VERSION), 5, 2, strString+11);
	screenBigMessage("Versione SW", strString);
	sleepSec(2);

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
				case SCREEN_STD_MSG_PHASE_MAN:
					screenBigMessage("Manual", "phase");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_FAST:
					screenBigMessage("Fast correction", "phase");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_OSCIL:
					screenBigMessage("Phase with", "oscilloscope");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_AUTO:
					screenBigMessage("Automatic", "phase");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_SH:
					screenBigMessage("Scanning", "head test");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_ENC:
					screenBigMessage("Encoder", "test");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_OUTPUT:
					screenBigMessage("Outputs", "test");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_4:
					screenBigMessage("Test", "4");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_5:
					screenBigMessage("Test", "5");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_6:
					screenBigMessage("Test", "6");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PARAM_5:
					screenBigMessage("Parameter", "5");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PARAM_6:
					screenBigMessage("Parameter", "6");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_OK:
					screenBigMessage("Phase", "done");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_SPEED_ZERO:
					screenBigMessage("Error", "Machine is stopped");				
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_SPEED_TOO_FAST:
					screenBigMessage("Error: Speed", "too high");				
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_MAN_ERR:
					screenBigMessage("Error", "Machine not stopped");				
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_ERR_TEST_OUTPUT:
					screenBigMessage("Error:", "Machine not stopped");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_AUTO_ERR:
					screenBigMessage("Error in", "automatic phase");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_DOUBLE_MARK:
					screenBigMessage("Error", "double mark");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_OK:
					screenBigMessage("Test", "done");			
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_SH_ERR:
					screenBigMessage("Error in scan.", "head test");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_ENC_ERR:
					screenBigMessage("Error", "encoder test");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_VISUAL_OSCILLOSCOPE:
					screenBigMessage("Visual", "oscilloscope");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_CORRECTION_TRANS:
					screenBigMessage("Lateral Correction", "(not installed)");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_OFFSET_DISTANCE:
					screenBigMessage("Offset", "distance");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PARAMETER_SAVED:
					screenBigMessage("Parameter saved:", m_strString1);			
					break;
				case SCREEN_STD_MSG_CMD_DONE:
					screenBigMessage("Command", "done");
					break;
				case SCREEN_STD_MSG_SW_VERSION:
					screenBigMessage("SW Version", "");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_UNKNOWN_CODE:
					screenBigMessage("Unknown", "code");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_UNKNOWN_ADDCODE:
					screenBigMessage("Unknown", "AdditionalCode");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_RESET_ERROR:
					screenBigMessage("Error", "reset");
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
				default:
					break;
			}
			break;
		case PARAM_LANGUAGE_DE: //Deutch
			switch(a_byStdMessage)
			{
				case SCREEN_STD_MSG_INIT_PARAM:
					screenBigMessage("Einweihung", "Parameter");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_MAN:
					screenBigMessage("manuell", "Einstellung");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_FAST:
					screenBigMessage("Einstellung", "schnell Verbesserung");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_OSCIL:
					screenBigMessage("Einstellung", "Oszilloskop");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_AUTO:
					screenBigMessage("automatische", "Einstellung");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_SH:
					screenBigMessage("Lesekopf", "Test");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_ENC:
					screenBigMessage("Encoder", "Test");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_OUTPUT:
					screenBigMessage("Auseänge", "Test");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_4:
					screenBigMessage("Test", "4");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_5:
					screenBigMessage("Test", "5");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_6:
					screenBigMessage("Test", "6");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PARAM_5:
					screenBigMessage("Parameter", "5");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PARAM_6:
					screenBigMessage("Parameter", "6");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_OK:
					screenBigMessage("Positiv", "Einstellung");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_SPEED_ZERO:
					screenBigMessage("Fehler:", "Machine stop");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_SPEED_TOO_FAST:
					screenBigMessage("Fehler: Geschwindigkeit", "zu hoch");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_ERR_TEST_OUTPUT:
					screenBigMessage("Fehler:", "Machine steht nicht");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_MAN_ERR:
					screenBigMessage("Fehler: Einstellung", "Machine steht nicht");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_AUTO_ERR:
					screenBigMessage("Fehler automatische", "Einstellung");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_DOUBLE_MARK:
					screenBigMessage("Fehler", "doppel Marke");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_OK:
					screenBigMessage("Test OK", "");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_SH_ERR:
					screenBigMessage("Test Fehler", "Lesekopf");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_ENC_ERR:
					screenBigMessage("Test Fehler", "Encoder");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_VISUAL_OSCILLOSCOPE:
					screenBigMessage("Visualisierung", "Oszilloskop");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_CORRECTION_TRANS:
					screenBigMessage("seiten Korrektur", "(nicht in betriebs)");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_OFFSET_DISTANCE:
					screenBigMessage("Interval", "offset");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PARAMETER_SAVED:
					screenBigMessage("Speichern", "Parameter");
					break;
				case SCREEN_STD_MSG_CMD_DONE:
					screenBigMessage("Befelhl", "");
					break;
				case SCREEN_STD_MSG_SW_VERSION:
					screenBigMessage("Version SW", "");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_UNKNOWN_CODE:
					screenBigMessage("Unbekannt", "Code");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_UNKNOWN_ADDCODE:
					screenBigMessage("Unbekannt", "Zusatzlichcode");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_RESET_ERROR:
					screenBigMessage("Nulleistellung", "Irrtum");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PARAMETER_VALUE_NA:
					screenBigMessage("Fehler: Wert", "nicht akzeptabel");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_WRONG_MEMORY_SLOT:
					screenBigMessage("Fehler: Position", "nicht verfugbar");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				default:
					break;
			}
			break;		
		case PARAM_LANGUAGE_FR: //French
			switch(a_byStdMessage)
			{
				case SCREEN_STD_MSG_INIT_PARAM:
					screenBigMessage("Initiation", "parametres");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_MAN:
					screenBigMessage("Mise en", "phase manuel");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_FAST:
					screenBigMessage("Mise en phase", "a corection rapid");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_OSCIL:
					screenBigMessage("Mise en phase", "a oscilloscope");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_AUTO:
					screenBigMessage("Mise en phase", "automatique");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_SH:
					screenBigMessage("Test tete", "explorante");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_ENC:
					screenBigMessage("Test", "encoder");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_OUTPUT:
					screenBigMessage("Test", "sorties");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_4:
					screenBigMessage("Test", "4");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_5:
					screenBigMessage("Test", "5");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_6:
					screenBigMessage("Test", "6");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PARAM_5:
					screenBigMessage("Parametre", "5");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PARAM_6:
					screenBigMessage("Parametre", "6");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_OK:
					screenBigMessage("Mise en phase", "correctement");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_SPEED_ZERO:
					screenBigMessage("Erreur", "machine ferme");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_SPEED_TOO_FAST:
					screenBigMessage("Erreur: velocite", "trop eleve");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_MAN_ERR:
					screenBigMessage("Erreur:", "machine pas arrete");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_ERR_TEST_OUTPUT:
					screenBigMessage("Test erreur:", "Machine pas arrete");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_AUTO_ERR:
					screenBigMessage("Erreur: mise in", "phase automatique");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_DOUBLE_MARK:
					screenBigMessage("Erreur:", "double marque");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_OK:
					screenBigMessage("Test", "OK");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_SH_ERR:
					screenBigMessage("Erreur", "test tete");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_ENC_ERR:
					screenBigMessage("Erreur", "test encoder");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_VISUAL_OSCILLOSCOPE:
					screenBigMessage("Visualisation", "oscilloscope");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_CORRECTION_TRANS:
					screenBigMessage("Correction trasversal", "(pas operationnel)");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_OFFSET_DISTANCE:
					screenBigMessage("Intervalle", "offset");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PARAMETER_SAVED:
					screenBigMessage("Parametre", "sauve");
					break;
				case SCREEN_STD_MSG_CMD_DONE:
					screenBigMessage("Commande execute", "correctement");
					break;
				case SCREEN_STD_MSG_SW_VERSION:
					screenBigMessage("Version SW", "");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_UNKNOWN_CODE:
					screenBigMessage("Code", "inconnu");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_UNKNOWN_ADDCODE:
					screenBigMessage("Code additionnel", "inconnu");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_RESET_ERROR:
					screenBigMessage("Effacement", "erreur");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PARAMETER_VALUE_NA:
					screenBigMessage("Erreur: Valeur", "pas acceptable");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_WRONG_MEMORY_SLOT:
					screenBigMessage("Erreur: Position", "pas disponible");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				default:
					break;
			}
			break;			
		case PARAM_LANGUAGE_ES: //Spanish
			switch(a_byStdMessage)
			{
				case SCREEN_STD_MSG_INIT_PARAM:
					screenBigMessage("Iniciacion", "parametros");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_MAN:
					screenBigMessage("Puesta en", "fase manual");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_FAST:
					screenBigMessage("Puesta en", "fase rapida");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_OSCIL:
					screenBigMessage("Puesta en", "fase osciloscopio");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_AUTO:
					screenBigMessage("Puesta en", "fase automatica");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_SH:
					screenBigMessage("Test", "cabeza");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_ENC:
					screenBigMessage("Test", "encoder");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_OUTPUT:
					screenBigMessage("Test", "salidas");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_4:
					screenBigMessage("Test", "4");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_5:
					screenBigMessage("Test", "5");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_6:
					screenBigMessage("Test", "6");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PARAM_5:
					screenBigMessage("Parametro", "5");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PARAM_6:
					screenBigMessage("Parametro", "6");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_OK:
					screenBigMessage("Puesta en", "fase correcto");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_SPEED_ZERO:
					screenBigMessage("Error", "Maquina parada");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_SPEED_TOO_FAST:
					screenBigMessage("Error: Velocidad", "desmaciado elevada");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_MAN_ERR:
					screenBigMessage("Error : Puesta en fase", "maquina en marcha");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_ERR_TEST_OUTPUT:
					screenBigMessage("Error test", "Maquina en marcha");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_AUTO_ERR:
					screenBigMessage("Error puesta en", "fase automatica");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_DOUBLE_MARK:
					screenBigMessage("Error", "marca doble");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_OK:
					screenBigMessage("Test", "OK");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_SH_ERR:
					screenBigMessage("Error", "test cabeza");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_ENC_ERR:
					screenBigMessage("Error", "test encoder");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_VISUAL_OSCILLOSCOPE:
					screenBigMessage("Visualizacion", "osciloscopio");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_CORRECTION_TRANS:
					screenBigMessage("Correcion transversal", "(non operativa)");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_OFFSET_DISTANCE:
					screenBigMessage("Intervalo", "offset");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PARAMETER_SAVED:
					screenBigMessage("Parametro", "salvado");
					break;
				case SCREEN_STD_MSG_CMD_DONE:
					screenBigMessage("Comando", "ejecutado bien");
					break;
				case SCREEN_STD_MSG_SW_VERSION:
					screenBigMessage("Version", "SW");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_UNKNOWN_CODE:
					screenBigMessage("Code", "desconocido");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_UNKNOWN_ADDCODE:
					screenBigMessage("Adicional", "code desconocido");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_RESET_ERROR:
					screenBigMessage("Anulacion", "error");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PARAMETER_VALUE_NA:
					screenBigMessage("Error: valor", "no aceptable");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_WRONG_MEMORY_SLOT:
					screenBigMessage("Error: posicion", "no disponible");
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
				case SCREEN_STD_MSG_PHASE_MAN:
					screenBigMessage("Fasatura", "manuale");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_FAST:
					screenBigMessage("Fasatura a", "correzione rapida");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_OSCIL:
					screenBigMessage("Fasatura", "ad oscilloscopio");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_AUTO:
					screenBigMessage("Fasatura", "automatica");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_SH:
					screenBigMessage("Test", "testina");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_ENC:
					screenBigMessage("Test", "encoder");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_OUTPUT:
					screenBigMessage("Test", "uscite");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_4:
					screenBigMessage("Test", "4");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_5:
					screenBigMessage("Test", "5");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_6:
					screenBigMessage("Test", "6");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PARAM_5:
					screenBigMessage("Parametro", "5");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PARAM_6:
					screenBigMessage("Parametro", "6");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_OK:
					screenBigMessage("Fasatura eseguita", "correttamente");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_SPEED_ZERO:
					screenBigMessage("Errore", "Macchina ferma");				
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_SPEED_TOO_FAST:
					screenBigMessage("Errore: Velocita'", "troppo elevata ");				
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_MAN_ERR:
					screenBigMessage("Errore fasatura", "Macchina non ferma");				
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_ERR_TEST_OUTPUT:
					screenBigMessage("Errore test", "Macchina non ferma");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_AUTO_ERR:
					screenBigMessage("Errore fasatura", "automatica");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PHASE_DOUBLE_MARK:
					screenBigMessage("Errore", "segno doppio");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_OK:
					screenBigMessage("Test eseguito", "correttamente");			
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_SH_ERR:
					screenBigMessage("Errore test", "testina");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_TEST_ENC_ERR:
					screenBigMessage("Errore test", "encoder");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_VISUAL_OSCILLOSCOPE:
					screenBigMessage("Visualizzazione", "oscilloscopio");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_CORRECTION_TRANS:
					screenBigMessage("Correzione Laterale", "(non operativo)");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_OFFSET_DISTANCE:
					screenBigMessage("Intervallo", "offset");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_PARAMETER_SAVED:
					screenBigMessage("Parametro salvato:", m_strString1);			
					break;
				case SCREEN_STD_MSG_CMD_DONE:
					screenBigMessage("Comando eseguito", "correttamente");
					break;
				case SCREEN_STD_MSG_SW_VERSION:
					screenBigMessage("Versione SW", "");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_UNKNOWN_CODE:
					screenBigMessage("Code", "sconosciuto");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_UNKNOWN_ADDCODE:
					screenBigMessage("AdditionalCode", "sconosciuto");
					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
					break;
				case SCREEN_STD_MSG_RESET_ERROR:
					screenBigMessage("Azzeramento", "errore");
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
				case SCREEN_STD_MSG_CYLINDER_TRAVEL:
					memcpy(m_strString1, "Cylinder size", 20);
					memcpy(m_strString2, "        mm", 20);
					break;
				case SCREEN_STD_MSG_ALLARM:
					memcpy(m_strString1, "Alarm bound", 20);
					memcpy(m_strString2, "      mm/100", 20);
					break;
				case SCREEN_STD_MSG_GATE_WINDOW:
					memcpy(m_strString1, "Gate width", 20);
					memcpy(m_strString2, "      mm", 20);
					break;
				case SCREEN_STD_MSG_DIRECTION_R:
					memcpy(m_strString1, "Retarde", 20);
					memcpy(m_strString2, "      mm/100", 20);
					break;
				case SCREEN_STD_MSG_DIRECTION_A:
					memcpy(m_strString1, "Advance", 20);
					memcpy(m_strString2, "      mm/100", 20);
					break;
				case SCREEN_STD_MSG_DIRECTION_O:
					memcpy(m_strString1, "Operator", 20);
					memcpy(m_strString2, "      mm/100", 20);
					break;
				case SCREEN_STD_MSG_DIRECTION_T:
					memcpy(m_strString1, "Gear",     20);
					memcpy(m_strString2, "      mm/100", 20);		
					break;
				case SCREEN_STD_MSG_DIRECTION_I:
					memcpy(m_strString1, "Tension Increment", 20);
					memcpy(m_strString2, "      mt/min", 20);
					break;
				case SCREEN_STD_MSG_DIRECTION_D:
					memcpy(m_strString1, "Tension Decrement", 20);
					memcpy(m_strString2, "      mt/min", 20);		
					break;
				case SCREEN_STD_MSG_SAVE_JOB:
					memcpy(m_strString1, "Save Job", 20);
					memcpy(m_strString2, "      mem. position", 20);		
					break;
				case SCREEN_STD_MSG_LOAD_JOB:
					memcpy(m_strString1, "Load Job", 20);
					memcpy(m_strString2, "      mem. position", 20);		
					break;
				case SCREEN_STD_MSG_PARAM_5:
					memcpy(m_strString1, "Tension base value", 20);
					memcpy(m_strString2, "        ", 20);
					break;					
				case SCREEN_STD_MSG_PARAM_6:
					memcpy(m_strString1, "Divisor", 20);
					memcpy(m_strString2, "        ", 20);
					break;					
				default:
					break;
			}
			break;
		case PARAM_LANGUAGE_DE: //Deutch
			switch(a_byStdMessage)
			{
				case SCREEN_STD_MSG_CYLINDER_TRAVEL:
					memcpy(m_strString1, "Zylinder Format", 20);
					memcpy(m_strString2, "        mm", 20);
					break;
				case SCREEN_STD_MSG_ALLARM:
					memcpy(m_strString1, "Reg. Alarm", 20);
					memcpy(m_strString2, "      mm/100", 20);
					break;
				case SCREEN_STD_MSG_GATE_WINDOW:
					memcpy(m_strString1, "Tor Weite", 20);
					memcpy(m_strString2, "      mm", 20);
					break;
				case SCREEN_STD_MSG_DIRECTION_R:
					memcpy(m_strString1, "Verzogerung", 20);
					memcpy(m_strString2, "      mm/100", 20);
					break;
				case SCREEN_STD_MSG_DIRECTION_A:
					memcpy(m_strString1, "Vorwats", 20);
					memcpy(m_strString2, "      mm/100", 20);
					break;
				case SCREEN_STD_MSG_DIRECTION_O:
					memcpy(m_strString1, "Machin Fuhrer", 20);
					memcpy(m_strString2, "      mm/100", 20);
					break;
				case SCREEN_STD_MSG_DIRECTION_T:
					memcpy(m_strString1, "Ubertragung", 20);
					memcpy(m_strString2, "      mm/100", 20);
					break;
				case SCREEN_STD_MSG_DIRECTION_I:
					memcpy(m_strString1, "Spannung Erchöhen", 20);
					memcpy(m_strString2, "      mt/min", 20);
					break;
				case SCREEN_STD_MSG_DIRECTION_D:
					memcpy(m_strString1, "Spannung Vermindern", 20);
					memcpy(m_strString2, "      mt/min", 20);
					break;
				case SCREEN_STD_MSG_SAVE_JOB:
					memcpy(m_strString1, "Arbeit aufbewahren", 20);
					memcpy(m_strString1, "      Lage mem", 20);
					break;
				case SCREEN_STD_MSG_LOAD_JOB:
					memcpy(m_strString1, "Arbeit laden", 20);
					memcpy(m_strString1, "      Lage mem", 20);
					break;
				case SCREEN_STD_MSG_PARAM_5:
					memcpy(m_strString1, "Afgangs Spannung", 20);
					memcpy(m_strString2, "        ", 20);
					break;					
				case SCREEN_STD_MSG_PARAM_6:
					memcpy(m_strString1, "Divisor", 20);
					memcpy(m_strString2, "        ", 20);
					break;					
				default:
					break;
			}
			break;		
		case PARAM_LANGUAGE_FR: //French
			switch(a_byStdMessage)
			{
				case SCREEN_STD_MSG_CYLINDER_TRAVEL:
					memcpy(m_strString1, "Cylindre Dimension", 20);
					memcpy(m_strString2, "        mm", 20);
					break;
				case SCREEN_STD_MSG_ALLARM:
					memcpy(m_strString1, "Seuil alarme", 20);
					memcpy(m_strString2, "      mm/100", 20);
					break;
				case SCREEN_STD_MSG_GATE_WINDOW:
					memcpy(m_strString1, "Ampleur gate", 20);
					memcpy(m_strString2, "      mm", 20);
					break;
				case SCREEN_STD_MSG_DIRECTION_R:
					memcpy(m_strString1, "Retard", 20);
					memcpy(m_strString2, "      mm/100", 20);
					break;
				case SCREEN_STD_MSG_DIRECTION_A:
					memcpy(m_strString1, "Avant", 20);
					memcpy(m_strString2, "      mm/100", 20);
					break;
				case SCREEN_STD_MSG_DIRECTION_O:
					memcpy(m_strString1, "Operateur", 20);
					memcpy(m_strString2, "      mm/100", 20);
					break;
				case SCREEN_STD_MSG_DIRECTION_T:
					memcpy(m_strString1, "Trasmission", 20);
					memcpy(m_strString2, "      mm/100", 20);
					break;
				case SCREEN_STD_MSG_DIRECTION_I:
					memcpy(m_strString1, "Augmenter tension", 20);
					memcpy(m_strString2, "      mt/min", 20);
					break;
				case SCREEN_STD_MSG_DIRECTION_D:
					memcpy(m_strString1, "Dimunuer tension", 20);
					memcpy(m_strString2, "      mt/min", 20);
					break;
				case SCREEN_STD_MSG_SAVE_JOB:
					memcpy(m_strString1, "Sauver travail", 20);
					memcpy(m_strString1, "      position mem.", 20);
					break;
				case SCREEN_STD_MSG_LOAD_JOB:
					memcpy(m_strString1, "Chargement travail", 20);
					memcpy(m_strString1, "      position mem.", 20);
					break;
				case SCREEN_STD_MSG_PARAM_5:
					memcpy(m_strString1, "Tension initial", 20);
					memcpy(m_strString2, "        ", 20);
					break;					
				case SCREEN_STD_MSG_PARAM_6:
					memcpy(m_strString1, "Diviseur", 20);
					memcpy(m_strString2, "        ", 20);
					break;					
				default:
					break;
			}
			break;

		case PARAM_LANGUAGE_ES: //Spanish
			switch(a_byStdMessage)
			{
				case SCREEN_STD_MSG_CYLINDER_TRAVEL:
					memcpy(m_strString1, "Cilindro Desarrollo", 20);
					memcpy(m_strString2, "        mm", 20);
					break;
				case SCREEN_STD_MSG_ALLARM:
					memcpy(m_strString1, "Umbral alarma", 20);
					memcpy(m_strString2, "      mm/100", 20);
					break;
				case SCREEN_STD_MSG_GATE_WINDOW:
					memcpy(m_strString1, "Espacio gate", 20);
					memcpy(m_strString2, "      mm", 20);
					break;
				case SCREEN_STD_MSG_DIRECTION_R:
					memcpy(m_strString1, "Retardo", 20);
					memcpy(m_strString2, "      mm/100", 20);
					break;
				case SCREEN_STD_MSG_DIRECTION_A:
					memcpy(m_strString1, "Adelante", 20);
					memcpy(m_strString2, "      mm/100", 20);
					break;
				case SCREEN_STD_MSG_DIRECTION_O:
					memcpy(m_strString1, "Operador", 20);
					memcpy(m_strString2, "      mm/100", 20);
					break;
				case SCREEN_STD_MSG_DIRECTION_T:
					memcpy(m_strString1, "Transmision", 20);
					memcpy(m_strString2, "      mm/100", 20);
					break;
				case SCREEN_STD_MSG_DIRECTION_I:
					memcpy(m_strString1, "Incremento tension", 20);
					memcpy(m_strString2, "      mt/min", 20);
					break;
				case SCREEN_STD_MSG_DIRECTION_D:
					memcpy(m_strString1, "Decremento tension", 20);
					memcpy(m_strString2, "      mt/min", 20);
					break;
				case SCREEN_STD_MSG_SAVE_JOB:
					memcpy(m_strString1, "Salvar labor", 20);
					memcpy(m_strString1, "      posicion mem.", 20);
					break;
				case SCREEN_STD_MSG_LOAD_JOB:
					memcpy(m_strString1, "Cargar labor", 20);
					memcpy(m_strString1, "      posicion mem.", 20);
					break;
				case SCREEN_STD_MSG_PARAM_5:
					memcpy(m_strString1, "Tension inicial", 20);
					memcpy(m_strString2, "        ", 20);
					break;					
				case SCREEN_STD_MSG_PARAM_6:
					memcpy(m_strString1, "Divisor", 20);
					memcpy(m_strString2, "        ", 20);
					break;					
				default:
					break;
			}
			break;			
		default:  	//PARAM_LANGUAGE_IT - Italian
			switch(a_byStdMessage)
			{
				case SCREEN_STD_MSG_CYLINDER_TRAVEL:
					memcpy(m_strString1, "Sviluppo Cilindro", 20);
					memcpy(m_strString2, "        mm", 20);
					break;
				case SCREEN_STD_MSG_ALLARM:
					memcpy(m_strString1, "Soglia d'allarme", 20);
					memcpy(m_strString2, "      mm/100", 20);
					break;
				case SCREEN_STD_MSG_GATE_WINDOW:
					memcpy(m_strString1, "Ampiezza Gate", 20);
					memcpy(m_strString2, "      mm", 20);
					break;
				case SCREEN_STD_MSG_DIRECTION_R:
					memcpy(m_strString1, "Ritardo", 20);
					memcpy(m_strString2, "      mm/100", 20);
					break;
				case SCREEN_STD_MSG_DIRECTION_A:
					memcpy(m_strString1, "Avanti", 20);
					memcpy(m_strString2, "      mm/100", 20);
					break;
				case SCREEN_STD_MSG_DIRECTION_O:
					memcpy(m_strString1, "Operatore", 20);
					memcpy(m_strString2, "      mm/100", 20);
					break;
				case SCREEN_STD_MSG_DIRECTION_T:
					memcpy(m_strString1, "Traversa", 20);
					memcpy(m_strString2, "      mm/100", 20);		
					break;
				case SCREEN_STD_MSG_DIRECTION_I:
					memcpy(m_strString1, "Incrementa tiro", 20);
					memcpy(m_strString2, "      mt/min", 20);
					break;
				case SCREEN_STD_MSG_DIRECTION_D:
					memcpy(m_strString1, "Decrementa tiro", 20);
					memcpy(m_strString2, "      mt/min", 20);		
					break;
				case SCREEN_STD_MSG_SAVE_JOB:
					memcpy(m_strString1, "Salva lavoro", 20);
					memcpy(m_strString2, "      posizione mem", 20);		
					break;
				case SCREEN_STD_MSG_LOAD_JOB:
					memcpy(m_strString1, "Carica lavoro", 20);
					memcpy(m_strString2, "      posizione mem", 20);							
					break;
				case SCREEN_STD_MSG_PARAM_5:
					memcpy(m_strString1, "Tiro iniziale", 20);
					memcpy(m_strString2, "        ", 20);
					break;					
				case SCREEN_STD_MSG_PARAM_6:
					memcpy(m_strString1, "Divisore", 20);
					memcpy(m_strString2, "        ", 20);
					break;					
				default:
					break;
			}			
			break;
	}			
}
