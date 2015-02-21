#include "window.h"


/*****************************************************************************/
// Costants declaration
/*****************************************************************************/
#define 	WIN_MODE			0
#define 	WIN_SPEED			1
#define 	WIN_OSCILLOSCOPE	2
#define 	WIN_REGISTER		3
#define 	WIN_ALARM			4
#define 	WIN_MESSAGE			5
#define 	WIN_FUNCTIONS		6
#define		WIN_PARAMETERS		7
#define		WIN_TESTS			8
#define		WIN_MENUS			9
#define		WIN_SETUP			10
#define 	WIN_ARCHIVES		11
#define 	WIN_APPLICATION		12
#define		WIN_ENCODER			13
#define		WIN_DAC_BASE		14
#define		WIN_CYLINDER_SIZE	15

/*****************************************************************************/
// Variables declaration
/*****************************************************************************/
extern 					BYTE 		m_arbyDisplayCommand[DISPLAY_CMD_BUFFER];
extern 					WORD 		m_woEncoderGateStart;
extern 					WORD 		m_woEncoderGateEnd;
extern					WORD		m_woEncoderGateWidth;

						WORD		m_woRegisterValue;
						BYTE		m_byCurrentSelectorX;
						WORD		m_woDisplayedWindow;
						BYTE		m_byVisibleMenu;
						double 		dblParamErrorZoom;

/*****************************************************************************/
// Functions declaration
/*****************************************************************************/
void windowRegisterPrepareFormateValue(BYTE * a_strErrValue);
WORD windowOffsetToHaveCenteredGate(void);

/*****************************************************************************/
void windowInit(void)
{
	m_byCurrentSelectorX 	= 0x00;
	m_woDisplayedWindow 	= 0x0000;
	m_woEncoderGateStart 	= 1;
	m_woEncoderGateEnd 		= 100;

}

/*****************************************************************************/
void windowForceRepaint(void)
{
	m_woDisplayedWindow = 0x0000;
}

/*****************************************************************************/
void windowForceRepaintAlarm(void)
{
	m_woDisplayedWindow = 0x0000;
	_bres(m_woDisplayedWindow, WIN_ALARM);
}


/*****************************************************************************/
void windowMode(void)
{
	if ((parametersGetValue(PARAM_TRANS_ENABLE)!=0x0000) && (parametersGetValue(PARAM_PULL_ENABLE)!=0x0000))
	{
		if (!_btst(m_woDisplayedWindow, WIN_MODE) || parametersIsChanged(PARAM_MODE_LONG))
		{
			if (parametersGetValue(PARAM_MODE_LONG)==PARAM_MODE_AUTO)
			{
				displayDrawBox(0, 0, 62, 16, labelGet(LABEL_MODE), labelGet(LABEL_AUTO), 0xFFFF,0, 0,_btst(m_woDisplayedWindow, WIN_MODE));
			}
			else
			{
				displayDrawBox(0, 0, 62, 16, labelGet(LABEL_MODE), labelGet(LABEL_MANUAL), 0xFFFF,0, 0,_btst(m_woDisplayedWindow, WIN_MODE));			
			}
			parametersChangedFlagReset(PARAM_MODE_LONG);
		}		
	}
	else 
	{
		if (!_btst(m_woDisplayedWindow, WIN_MODE) || parametersIsChanged(PARAM_MODE_LONG))
		{
			if (parametersGetValue(PARAM_MODE_LONG)==PARAM_MODE_AUTO)
			{
				displayDrawBox(0, 0, 30, 16, labelGet(LABEL_MODE_LONG), labelGet(LABEL_AUTO_SHORT), 0xFFFF,0, 0,_btst(m_woDisplayedWindow, WIN_MODE));
			}
			else
			{
				displayDrawBox(0, 0, 30, 16, labelGet(LABEL_MODE_LONG), labelGet(LABEL_MANUAL_SHORT), 0xFFFF,0, 0,_btst(m_woDisplayedWindow, WIN_MODE));			
			}
			parametersChangedFlagReset(PARAM_MODE_LONG);
		}
		
		if ((parametersGetValue(PARAM_TRANS_ENABLE)==0x0000) && ( !_btst(m_woDisplayedWindow, WIN_MODE) || parametersIsChanged(PARAM_MODE_TRANS)))
		{
			if (parametersGetValue(PARAM_MODE_TRANS)==PARAM_MODE_AUTO)
			{
				displayDrawBox(32, 0, 30, 16, labelGet(LABEL_MODE_TRANS), labelGet(LABEL_AUTO_SHORT), 0xFFFF,0, 0,_btst(m_woDisplayedWindow, WIN_MODE));
			}
			else
			{
				displayDrawBox(32, 0, 30, 16, labelGet(LABEL_MODE_TRANS), labelGet(LABEL_MANUAL_SHORT), 0xFFFF,0, 0,_btst(m_woDisplayedWindow, WIN_MODE));			
			}
			parametersChangedFlagReset(PARAM_MODE_TRANS);
		}
		else if ((parametersGetValue(PARAM_PULL_ENABLE)==0x0000) && (!_btst(m_woDisplayedWindow, WIN_MODE) || parametersIsChanged(PARAM_MODE_PULL)))
		{
			if (parametersGetValue(PARAM_MODE_PULL)==PARAM_MODE_AUTO)
			{
				displayDrawBox(32, 0, 30, 16, labelGet(LABEL_MODE_PULL), labelGet(LABEL_AUTO_SHORT), 0xFFFF,0, 0,_btst(m_woDisplayedWindow, WIN_MODE));
			}
			else
			{
				displayDrawBox(32, 0, 30, 16, labelGet(LABEL_MODE_PULL), labelGet(LABEL_MANUAL_SHORT), 0xFFFF,0, 0,_btst(m_woDisplayedWindow, WIN_MODE));			
			}
			parametersChangedFlagReset(PARAM_MODE_PULL);
		}
	}

	
	_bset(m_woDisplayedWindow, WIN_MODE);
	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
	_bres(m_woDisplayedWindow, WIN_TESTS);
	_bres(m_woDisplayedWindow, WIN_MESSAGE);
	_bres(m_woDisplayedWindow, WIN_SETUP);
	_bres(m_woDisplayedWindow, WIN_MENUS);
	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
	_bres(m_woDisplayedWindow, WIN_APPLICATION);
	_bres(m_woDisplayedWindow, WIN_ENCODER);
}

/*****************************************************************************/
void windowSpeed(void)
{
	if (!_btst(m_woDisplayedWindow, WIN_SPEED) || parametersIsChanged(PARAM_SPEED))
	{
		if (
			(parametersGetValue(PARAM_LONG_DAC_ENABLE) == 0x00) ||
			(parametersGetValue(PARAM_TRANS_DAC_ENABLE) == 0x00) ||
			(parametersGetValue(PARAM_PULL_DAC_ENABLE) == 0x00) ||
			(parametersGetValue(PARAM_SHOW_CYLINDER) == 0x00)
		   )		
		{
			displayDrawBox(98, 0, 28, 16, labelGet(LABEL_SPEED_SHORT), "", parametersGetValue(PARAM_SPEED), 4, 0,_btst(m_woDisplayedWindow, WIN_SPEED));
			parametersChangedFlagReset(PARAM_SPEED);
		}
		else
		{
			displayDrawBox(64, 0, 62, 16, labelGet(LABEL_SPEED), labelGet(LABEL_MT_MIN), parametersGetValue(PARAM_SPEED), 4, 0,_btst(m_woDisplayedWindow, WIN_SPEED));
			parametersChangedFlagReset(PARAM_SPEED);
		}
	}

	_bset(m_woDisplayedWindow, WIN_SPEED);
	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
	_bres(m_woDisplayedWindow, WIN_TESTS);
	_bres(m_woDisplayedWindow, WIN_MESSAGE);
	_bres(m_woDisplayedWindow, WIN_SETUP);
	_bres(m_woDisplayedWindow, WIN_MENUS);
	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
	_bres(m_woDisplayedWindow, WIN_APPLICATION);
	_bres(m_woDisplayedWindow, WIN_ENCODER);
}

/*****************************************************************************/
void windowCylinderSizeValue(void)
{
	if (
	    (parametersGetValue(PARAM_SHOW_CYLINDER) != 0x00) ||
		(parametersGetValue(PARAM_LONG_DAC_ENABLE) == 0x00) ||
		(parametersGetValue(PARAM_TRANS_DAC_ENABLE) == 0x00) ||
		(parametersGetValue(PARAM_PULL_DAC_ENABLE) == 0x00)
	   )		
   {
	   return;
   }	
	
	if (!_btst(m_woDisplayedWindow, WIN_CYLINDER_SIZE) || parametersIsChanged(PARAM_CYLINDER_TRAVEL))
	{
		displayDrawBox(64, 0, 32, 16, labelGet(LABEL_CYLINDER_SIZE), "", parametersGetValue(PARAM_CYLINDER_TRAVEL), 5, 1,_btst(m_woDisplayedWindow, WIN_CYLINDER_SIZE));
		parametersChangedFlagReset(PARAM_CYLINDER_TRAVEL);
	}

	_bset(m_woDisplayedWindow, WIN_CYLINDER_SIZE);
	_bres(m_woDisplayedWindow, WIN_DAC_BASE);
	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
	_bres(m_woDisplayedWindow, WIN_TESTS);
	_bres(m_woDisplayedWindow, WIN_MESSAGE);
	_bres(m_woDisplayedWindow, WIN_SETUP);
	_bres(m_woDisplayedWindow, WIN_MENUS);
	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
	_bres(m_woDisplayedWindow, WIN_APPLICATION);
	_bres(m_woDisplayedWindow, WIN_ENCODER);	
}

/*****************************************************************************/
void windowDacValue(void)
{
	if (
		(parametersGetValue(PARAM_LONG_DAC_ENABLE) != 0x00) &&
		(parametersGetValue(PARAM_TRANS_DAC_ENABLE) != 0x00) &&
		(parametersGetValue(PARAM_PULL_DAC_ENABLE) != 0x00)
	   )		
   {
	   return;
   }


	if (!_btst(m_woDisplayedWindow, WIN_DAC_BASE) || parametersIsChanged(PARAM_BASE_VALUE_DAC))
	{
		displayDrawBox(64, 0, 32, 16, labelGet(LABEL_MODE_PULL), "", parametersGetValue(PARAM_BASE_VALUE_DAC), 4, 0,_btst(m_woDisplayedWindow, WIN_DAC_BASE));
		parametersChangedFlagReset(PARAM_BASE_VALUE_DAC);
	}

	_bset(m_woDisplayedWindow, WIN_DAC_BASE);
	_bres(m_woDisplayedWindow, WIN_CYLINDER_SIZE);
	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
	_bres(m_woDisplayedWindow, WIN_TESTS);
	_bres(m_woDisplayedWindow, WIN_MESSAGE);
	_bres(m_woDisplayedWindow, WIN_SETUP);
	_bres(m_woDisplayedWindow, WIN_MENUS);
	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
	_bres(m_woDisplayedWindow, WIN_APPLICATION);
	_bres(m_woDisplayedWindow, WIN_ENCODER);
}

/*****************************************************************************/
void windowBigMessage(BYTE * a_strMessage1, BYTE * a_strMessage2)
{
	if (!_btst(m_woDisplayedWindow, WIN_MESSAGE)) //Not displayed
	{
		displayClearArea(0, 0, 126, 64);
		displaySetOutLine(0, 0, 126, 64, false);
		//Label
		displayWriteString(labelGet(LABEL_MESSAGE), DISPLAY_SELECT_FONT_MINI, 2, 6);
		displayInvertArea(1, 1, 124, 6);
	}
	
	displayWriteString(a_strMessage1, DISPLAY_SELECT_FONT_5x7, 5, 25);	
	displayWriteString(a_strMessage2, DISPLAY_SELECT_FONT_5x7, 5, 40);	
	
	
	_bres(m_woDisplayedWindow, WIN_MODE);
	_bres(m_woDisplayedWindow, WIN_SPEED);
	_bres(m_woDisplayedWindow, WIN_CYLINDER_SIZE);
	_bres(m_woDisplayedWindow, WIN_DAC_BASE);
	_bres(m_woDisplayedWindow, WIN_OSCILLOSCOPE);
	_bres(m_woDisplayedWindow, WIN_REGISTER);
	_bres(m_woDisplayedWindow, WIN_ALARM);
	_bset(m_woDisplayedWindow, WIN_MESSAGE);
	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
	_bres(m_woDisplayedWindow, WIN_TESTS);
	_bres(m_woDisplayedWindow, WIN_SETUP);
	_bres(m_woDisplayedWindow, WIN_MENUS);
	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
	_bres(m_woDisplayedWindow, WIN_APPLICATION);
	_bres(m_woDisplayedWindow, WIN_ENCODER);
}

/*****************************************************************************/
void windowAlarm(void)
{
	BYTE strValue[16];
	WORD woAlarm;
	
	woAlarm = parametersGetValue(PARAM_ALARM);
	
	if (!_btst(m_woDisplayedWindow, WIN_ALARM) || parametersIsChanged(PARAM_ALARM)) //Not displayed
	{
		displayClearArea(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM);
		displaySetOutLine(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM, false);

		//Label 
		displayWriteString(labelGet(LABEL_ALARM), DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT+2, WINDOW_3_TOP+6);
		displayInvertArea(WINDOW_3_LEFT+1, WINDOW_3_TOP+1, WINDOW_3_RIGHT-2, WINDOW_3_TOP+6);

		if _btst(woAlarm, STI_ANSWER_ALARM_CYLINDER_TRAVEL)
		{
			displayWriteString(labelGet(LABEL_ALARM_CYLINDER_TRAVEL_01), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
			displayWriteString(labelGet(LABEL_ALARM_CYLINDER_TRAVEL_02), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
	
			_bres(woAlarm,STI_ANSWER_ALARM_CYLINDER_TRAVEL);
			parametersSet(PARAM_ALARM, woAlarm);
			sleepFix();
		}
		else if _btst(woAlarm, STI_ANSWER_ALARM_GATE_WINDOW)
		{
			displayWriteString(labelGet(LABEL_ALARM_GATE_WINDOW_01), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
			displayWriteString(labelGet(LABEL_ALARM_GATE_WINDOW_02), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
	
			_bres(woAlarm,STI_ANSWER_ALARM_GATE_WINDOW);
			parametersSet(PARAM_ALARM, woAlarm);
			sleepFix();
		}
		else if _btst(woAlarm, STI_ANSWER_ALARM_ERR_TEST_SH)
		{
			displayWriteString(labelGet(LABEL_ALARM_ERR_TEST_SH_01), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
			displayWriteString(labelGet(LABEL_ALARM_ERR_TEST_SH_02), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
			_bres(woAlarm,STI_ANSWER_ALARM_ERR_TEST_SH);
			parametersSet(PARAM_ALARM, woAlarm);
			sleepFix();
		}
		else if _btst(woAlarm, STI_ANSWER_ALARM_ERR_TEST_ENC)
		{
			displayWriteString(labelGet(LABEL_ALARM_ERR_TEST_ENC_01), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
			displayWriteString(labelGet(LABEL_ALARM_ERR_TEST_ENC_02), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
			_bres(woAlarm,STI_ANSWER_ALARM_ERR_TEST_ENC);
			parametersSet(PARAM_ALARM, woAlarm);
			sleepFix();
		}
		/*else if _btst(woAlarm, STI_ANSWER_ALARM_ERR_PHASE_AUTO)
		{
			displayWriteString(labelGet(LABEL_ALARM_ERR_PHASE_AUTO_01), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
			displayWriteString(labelGet(LABEL_ALARM_ERR_PHASE_AUTO_02), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
			_bres(woAlarm,STI_ANSWER_ALARM_ERR_PHASE_AUTO);
			parametersSet(PARAM_ALARM, woAlarm);
			sleepFix();
		}*/
		else if _btst(woAlarm, STI_ANSWER_ALARM_ERR_DOUBLE_MARK)
		{
			displayWriteString(labelGet(LABEL_ALARM_ERR_DOUBLE_MARK), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+25);	
			_bres(woAlarm,STI_ANSWER_ALARM_ERR_DOUBLE_MARK);
			parametersSet(PARAM_ALARM, woAlarm);
			sleepFix();
		}	
		
		else if _btst(woAlarm, STI_ANSWER_ALARM_ERR_LOW_SPEED)
		{
			displayWriteString(labelGet(LABEL_ALARM_ERR_LOW_SPEED), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+25);	
		}
		else if _btst(woAlarm, STI_ANSWER_ALARM_ERR_ACCELERATION)
		{
			displayWriteString(labelGet(LABEL_ALARM_ERR_ACCELERATION), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+25);	
		}
		else if _btst(woAlarm, STI_ANSWER_ALARM_ERR_DECELERATION)
		{
			displayWriteString(labelGet(LABEL_ALARM_ERR_DECELERATION), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+25);	
		}
		else if _btst(woAlarm, STI_ANSWER_ALARM_ERR_NO_PRINT)
		{
			displayWriteString(labelGet(LABEL_ALARM_ERR_NO_PRINT), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+25);	
		}
		else if _btst(woAlarm, STI_ANSWER_OK)
		{
			displayWriteString(labelGet(LABEL_ANSWER_OK), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+25);	
		}
		else
		{
			memcpy(strValue, labelGet(LABEL_GENERIC_ALARM_01), 16);
			formatNumber(parametersGetValue(PARAM_ALARM), 5, 0, strValue + 8);
			
			displayWriteString(strValue, DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
			displayWriteString(labelGet(LABEL_GENERIC_ALARM_02), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
		}
	}

	parametersChangedFlagReset(PARAM_ALARM);
	
	
	_bres(m_woDisplayedWindow, WIN_OSCILLOSCOPE);
	_bres(m_woDisplayedWindow, WIN_REGISTER);
	_bset(m_woDisplayedWindow, WIN_ALARM);
	_bres(m_woDisplayedWindow, WIN_MESSAGE);
	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
	_bres(m_woDisplayedWindow, WIN_TESTS);
	_bres(m_woDisplayedWindow, WIN_SETUP);
	_bres(m_woDisplayedWindow, WIN_MENUS);
	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
	_bres(m_woDisplayedWindow, WIN_APPLICATION);
	_bres(m_woDisplayedWindow, WIN_ENCODER);
}


/*****************************************************************************/
BYTE windowOscilloscopeGetValue(WORD a_woEncIndex)
{
	BYTE byValue;

	//a_woEncIndex = (a_woEncIndex+8)& (ENCODER_PERIOD-1);
	byValue = m_arbyScanningHeadSignal[(WORD)(a_woEncIndex>>2)];  //Array Index
	
	switch ((BYTE)(a_woEncIndex & 0x0003)) //0b00000011 -->  Byte Index
	{
		case 0:
			return (BYTE)((byValue & 0b11000000)>>6);
			break;
		case 1:
			return (BYTE)((byValue & 0b00110000)>>4);
			break;
		case 2:
			return (BYTE)((byValue & 0b00001100)>>2);
			break;
		case 3:
			return (BYTE)(byValue & 0b00000011);
			break;
	}
	
}


/*****************************************************************************/
BYTE windowIsInGate(WORD a_woEncIndex)
{
	if (m_woEncoderGateEnd > m_woEncoderGateStart)
	{
		return ((a_woEncIndex >m_woEncoderGateStart) && (a_woEncIndex<m_woEncoderGateEnd));
	}
	else
	{
		return ((a_woEncIndex >m_woEncoderGateStart) || (a_woEncIndex<m_woEncoderGateEnd));
	}	
}

/*****************************************************************************/
WORD windowOffsetToHaveCenteredGate(void)
{
	WORD woEncoderGateCenter;
	
	if ((m_woEncoderGateStart != 0xFFFF) && (m_woEncoderGateEnd != 0xFFFF))
	{
		if (m_woEncoderGateEnd > m_woEncoderGateStart)
		{
			woEncoderGateCenter = (m_woEncoderGateEnd + m_woEncoderGateStart)/2;
		}
		else
		{
			woEncoderGateCenter = convertEncoder((m_woEncoderGateEnd+m_woEncoderGateStart)/2);
		}
		
		return convertEncoder (woEncoderGateCenter - (((WINDOW_3_WIDTH-4)/2)*parametersGetValue(PARAM_OSCIL_ZOOM)));
	}
	return 0x0000;
	
}

/*****************************************************************************/
void windowOscilloscope(BYTE a_byPage)
{
	BYTE i;
	BYTE j;
	BYTE byLeft;
	WORD woEncoderIndex;
	WORD woEncoderIndexOnGate;
	BYTE byValue;
	BYTE byPrevValue = WINDOW_3_OSCILLOSCOPE_Y;
	BYTE byPrevGateValue;
	WORD woGateWidth;
	WORD arwoValue[16];
	WORD woEncoderGateCenter;
	
	
	if (!_btst(m_woDisplayedWindow, WIN_OSCILLOSCOPE)) //Not displayed
	{
		displayClearArea(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM);
		displaySetOutLine(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM, false);

		//Label
		switch(a_byPage)
		{
			case PAGE_PHASE_OSCILL:
				displayWriteString(labelGet(LABEL_PHASE_OSCILL), DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT+2, WINDOW_3_TOP+6);
				break;
			case PAGE_PHASE_FAST:
				displayWriteString(labelGet(LABEL_PHASE_FAST), DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT+2, WINDOW_3_TOP+6);
				break;
			default:
				displayWriteString(labelGet(LABEL_OSCILLOSCOPE), DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT+2, WINDOW_3_TOP+6);
				break;
		}
		
		displayInvertArea(WINDOW_3_LEFT+1, WINDOW_3_TOP+1, WINDOW_3_RIGHT-2, WINDOW_3_TOP+7);
		
		// No offset set-up
		parametersSet(PARAM_OSCIL_ZOOM, 0x0002);
		parametersSet(PARAM_OSCIL_OFFSET, windowOffsetToHaveCenteredGate());
		parametersSet(PARAM_OSCIL_MANUAL_OFFSET, 0x0000);
	}

	
	//Draw Correction Leds
/*	if (parametersIsChanged(PARAM_CORRECTION))
	{
		displayDrawCorrection(WINDOW_3_LEFT,  WINDOW_3_TOP+2, WINDOW_3_WIDTH, LOBYTE(parametersGetValue(PARAM_CORRECTION)));
		parametersChangedFlagReset(PARAM_CORRECTION);
	}	*/


	//A key is pressed during scanning head or gate acquisition
	if ((m_woEncoderGateStart != 0xFFFF) && (m_woEncoderGateEnd != 0xFFFF))
	{
		woEncoderIndex = parametersGetValue(PARAM_OSCIL_OFFSET);
			
		if(a_byPage == PAGE_PHASE_OSCILL)
		{
			woEncoderIndexOnGate = convertEncoder(woEncoderIndex - parametersGetValue(PARAM_OSCIL_MANUAL_OFFSET));
		}
		else
		{
			woEncoderIndexOnGate = woEncoderIndex;
		}
			
		byPrevGateValue = windowIsInGate((woEncoderIndexOnGate+parametersGetValue(PARAM_OSCIL_ZOOM)-1)& (ENCODER_PERIOD-1))?WINDOW_3_GATE_LOW_Y:WINDOW_3_GATE_HIGH_Y;
		
		//Common Command
		m_arbyDisplayCommand[0] = DISPLAY_CLEAR_AREA;
		m_arbyDisplayCommand[5] = DISPLAY_WAIT;
		m_arbyDisplayCommand[6] = DISPLAY_SET_AREA;
		m_arbyDisplayCommand[11] = DISPLAY_EOF;		
		
		//For each pixel
		for(i=0; (i<(WINDOW_3_WIDTH-4)&&(!displayIsKeyPressed())) ; i++)
		{
			//Get Max value in a set, starting in woEncoderIndex and with width = PARAM_OSCIL_ZOOM
			j = parametersGetValue(PARAM_OSCIL_ZOOM);
			byValue = 0x0000;
			while(j-->0)
			{
				byValue = (WORD) MAX(byValue,windowOscilloscopeGetValue(woEncoderIndex));  //(woValue>arwoValue[j]?woValue:arwoValue[j]);
				//Increment Encoder Index
				woEncoderIndex = (woEncoderIndex+1) & (ENCODER_PERIOD-1);
				woEncoderIndexOnGate = (woEncoderIndexOnGate+1) & (ENCODER_PERIOD-1);
			}
	
			byValue = WINDOW_3_OSCILLOSCOPE_Y-(byValue<<2);
			byLeft = WINDOW_3_LEFT + i + 2;

			
			//Clear Gate
			//m_arbyDisplayCommand[0] = DISPLAY_CLEAR_AREA;
			m_arbyDisplayCommand[1] = byLeft;
			m_arbyDisplayCommand[2] = WINDOW_3_GATE_LOW_Y;
			m_arbyDisplayCommand[3] = byLeft;
			m_arbyDisplayCommand[4] = WINDOW_3_GATE_HIGH_Y; 
			//m_arbyDisplayCommand[5] = DISPLAY_WAIT;
	
			//Show Gate
			//m_arbyDisplayCommand[6] = DISPLAY_SET_AREA;
			m_arbyDisplayCommand[7] = byLeft;
			m_arbyDisplayCommand[8] = byPrevGateValue;
			m_arbyDisplayCommand[9] = byLeft;
			m_arbyDisplayCommand[10] = windowIsInGate(woEncoderIndexOnGate)?WINDOW_3_GATE_LOW_Y:WINDOW_3_GATE_HIGH_Y; 
			//m_arbyDisplayCommand[11] = DISPLAY_EOF;
			byPrevGateValue =m_arbyDisplayCommand[10];
			
			displayCmdToDisplay(m_arbyDisplayCommand);

			//Clear Scanning head signal
			//m_arbyDisplayCommand[0] = DISPLAY_CLEAR_AREA;
			m_arbyDisplayCommand[1] = byLeft;
			m_arbyDisplayCommand[2] = WINDOW_3_OSCILLOSCOPE_Y-12;
			m_arbyDisplayCommand[3] = byLeft;
			m_arbyDisplayCommand[4] = WINDOW_3_OSCILLOSCOPE_Y-1;
			//m_arbyDisplayCommand[5] = DISPLAY_WAIT;
			
			//Show scanning head signal
			//m_arbyDisplayCommand[6] = DISPLAY_SET_AREA;
			m_arbyDisplayCommand[7] = byLeft;
			m_arbyDisplayCommand[8] = WINDOW_3_OSCILLOSCOPE_Y;
			m_arbyDisplayCommand[9] = byLeft;
			m_arbyDisplayCommand[10] = byValue;
			//m_arbyDisplayCommand[11] = DISPLAY_EOF;
			byPrevValue = byValue;

			displayCmdToDisplay(m_arbyDisplayCommand);			
		}

		parametersChangedFlagReset(PARAM_OSCIL_ZOOM);
		parametersChangedFlagReset(PARAM_OSCIL_OFFSET);
		parametersChangedFlagReset(PARAM_OSCIL_MANUAL_OFFSET);
		
	}

	_bset(m_woDisplayedWindow, WIN_OSCILLOSCOPE);
	_bres(m_woDisplayedWindow, WIN_REGISTER);
	_bres(m_woDisplayedWindow, WIN_ALARM);
	_bres(m_woDisplayedWindow, WIN_MESSAGE);
	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
	_bres(m_woDisplayedWindow, WIN_TESTS);
	_bres(m_woDisplayedWindow, WIN_SETUP);
	_bres(m_woDisplayedWindow, WIN_MENUS);
	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
	_bres(m_woDisplayedWindow, WIN_APPLICATION);
	_bres(m_woDisplayedWindow, WIN_ENCODER);
}

/*****************************************************************************/
void windowRegisterPrepareFormateValue(BYTE * a_strErrValue)
{
	WORD woValue;
	
	if (parametersGetValue(PARAM_ERR_LONG) > 0x8000)
	{
		a_strErrValue[0] = '+';
	}
	else if (parametersGetValue(PARAM_ERR_LONG) < 0x8000)
	{
		a_strErrValue[0] = '-';
	}
	else
	{
		a_strErrValue[0] = ' ';
	}
	a_strErrValue[6] = 0x00;
	a_strErrValue[7] = 0x00;

	woValue = parametersGetValue(PARAM_ERR_LONG) - 0x8000;
	
	if(woValue==0x0000) //never sent before
	{
		a_strErrValue[0] = ' ';
		formatNumber(0x0000, 6, 2, a_strErrValue+1);
	}
	else
	{
		if (woValue<0x8000)
		{
			formatNumber(woValue, 6, 2, a_strErrValue+1);
		}
		else
		{
			//Negative Number
			woValue = ((WORD)(~woValue)) + 1;
			formatNumber(woValue, 6, 2, a_strErrValue+1);
		}	
	}
}

/*****************************************************************************/
void windowRegister(void)
{
	double 	dblPercentValue;
	BYTE	byRulerTop;
	BYTE 	byCurrentSelectorX;
	BYTE	strString[8];

	byRulerTop = WINDOW_3_TOP+22;

	if (!_btst(m_woDisplayedWindow, WIN_REGISTER)) //Not displayed
	{
		displayClearArea(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM);
		displaySetOutLine(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM, false);

		//Label
		if (parametersGetValue(PARAM_TWIN_APPLICATION_01) != 0x00)
		{
			displayWriteString(labelGet(LABEL_REGISTER + parametersGetValue(PARAM_TWIN_CURRENT_APPLICATION)), DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT+2, WINDOW_3_TOP+6);
		}
		else
		{
			displayWriteString(labelGet(LABEL_REGISTER), DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT+2, WINDOW_3_TOP+6);
		}
		displayInvertArea(WINDOW_3_LEFT+1, WINDOW_3_TOP+1, WINDOW_3_RIGHT-2, WINDOW_3_TOP+6);
		
		//Lines Selector
		displayDrawHorizontalLine(byRulerTop + 1, WINDOW_3_LEFT + 6, WINDOW_3_WIDTH - 13);
		/* -1   */ displayDrawVerticalLine(WINDOW_3_LEFT + 5								, byRulerTop - 1, 6);	
		/*  0   */ displayDrawVerticalLine(WINDOW_3_LEFT + 5 + (WINDOW_3_WIDTH - 11) / 2	, byRulerTop - 1, 6);
		/*  1   */ displayDrawVerticalLine(WINDOW_3_LEFT + 5 + (WINDOW_3_WIDTH - 11)		, byRulerTop - 1, 6);
		/* -0.5 */ displayDrawVerticalLine(WINDOW_3_LEFT + 5 + (WINDOW_3_WIDTH - 11) / 4	, byRulerTop + 2, 1);
		/* +0.5 */ displayDrawVerticalLine(WINDOW_3_LEFT + 5 + (WINDOW_3_WIDTH - 11) * 3 / 4, byRulerTop + 2, 1);
		
		dblParamErrorZoom = (double) LOBYTE(parametersGetValue(PARAM_ERROR_ZOOM));
	}
	
	
	
	//Draw Selector
	if (parametersIsChanged(PARAM_ERR_LONG) || (!_btst(m_woDisplayedWindow, WIN_REGISTER)) )
	{
		//Selector has to be reprinted
		dblPercentValue = ((double) parametersGetValue(PARAM_ERR_LONG)- (double) 0x8000) / 100.0;
		dblPercentValue = (dblPercentValue>dblParamErrorZoom?dblParamErrorZoom:dblPercentValue);
		dblPercentValue = (dblPercentValue<-dblParamErrorZoom?-dblParamErrorZoom:dblPercentValue);
		dblPercentValue = dblPercentValue  / dblParamErrorZoom;
		
		//displayWriteString("0", DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT + 4 + ((WINDOW_3_WIDTH - 11) / 2), 	byRulerTop - 3);
		
		//Selector
		if (m_byCurrentSelectorX>0)
		{
			displayClearArea(m_byCurrentSelectorX-1, byRulerTop - 11, m_byCurrentSelectorX+1, byRulerTop-3);
		}

		displayWriteString("-", DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT + 4								 , 	byRulerTop - 3);
		displayWriteString("+", DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT + 4 + (WINDOW_3_WIDTH - 11)		 , 	byRulerTop - 3);


		m_byCurrentSelectorX = WINDOW_3_LEFT + 5 + ((WINDOW_3_WIDTH - 11) / 2 * (dblPercentValue + 1));
		displayDrawSelector( m_byCurrentSelectorX, byRulerTop - 11,  (dblPercentValue != 0), true);
							 
		//Error string has to be reprinted
		windowRegisterPrepareFormateValue(strString);
		displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+42, byRulerTop + 18);	
		
		parametersChangedFlagReset(PARAM_ERR_LONG);
	}
	
	//Draw Correction Leds
	if (parametersIsChanged(PARAM_CORRECTION))
	{
		displayDrawCorrection(WINDOW_3_LEFT, byRulerTop+3, WINDOW_3_WIDTH, LOBYTE(parametersGetValue(PARAM_CORRECTION)));
		parametersChangedFlagReset(PARAM_CORRECTION);
	}

	//Draw alarm out of bound
	if (parametersIsChanged(PARAM_ERR_BOUND_LONG))
	{
		if (parametersGetValue(PARAM_ERR_BOUND_LONG))
		{
			displayDrawAlarm(87, 45);
		}
		else
		{
			displayClearArea(87+2,45+7, 87+10, 45+14);
		}		
	}
	
	
	_bres(m_woDisplayedWindow, WIN_OSCILLOSCOPE);
	_bset(m_woDisplayedWindow, WIN_REGISTER);
	_bres(m_woDisplayedWindow, WIN_ALARM);
	_bres(m_woDisplayedWindow, WIN_MESSAGE);
	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
	_bres(m_woDisplayedWindow, WIN_TESTS);
	_bres(m_woDisplayedWindow, WIN_SETUP);
	_bres(m_woDisplayedWindow, WIN_MENUS);
	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
	_bres(m_woDisplayedWindow, WIN_APPLICATION);
	_bres(m_woDisplayedWindow, WIN_ENCODER);
}

/*****************************************************************************/
void window6Menu(BYTE * a_byGroup, BYTE * a_bySelected)
{
	if ( !  (	((*a_byGroup == MENU_GROUP_FUNCTION) 	&& _btst(m_woDisplayedWindow, WIN_FUNCTIONS)) ||
				((*a_byGroup == MENU_GROUP_PARAMETER) 	&& _btst(m_woDisplayedWindow, WIN_PARAMETERS)) ||
				((*a_byGroup == MENU_GROUP_MENU) 		&& _btst(m_woDisplayedWindow, WIN_MENUS)) ||
				((*a_byGroup == MENU_GROUP_ARCHIVE) 	&& _btst(m_woDisplayedWindow, WIN_ARCHIVES)) ||
				((*a_byGroup == MENU_GROUP_APP) 		&& _btst(m_woDisplayedWindow, WIN_APPLICATION)) ||
				((*a_byGroup == MENU_GROUP_ENC) 		&& _btst(m_woDisplayedWindow, WIN_ENCODER)) ||
				((*a_byGroup == MENU_GROUP_TEST) 		&& _btst(m_woDisplayedWindow, WIN_TESTS))
			))  // Is not only a refresh
	{
		displayClearArea(0,0,126,64);
		
		displayWriteString("1", 			DISPLAY_SELECT_FONT_10x14, 	2, 		17);
		displayWriteString("2", 			DISPLAY_NULL, 				2, 		39);
		displayWriteString("3", 			DISPLAY_NULL, 				2, 		61);
		displayWriteString("4", 			DISPLAY_NULL, 				67,		17);
		displayWriteString("5", 			DISPLAY_NULL, 				67, 	39);
		displayWriteString("6", 			DISPLAY_NULL, 				67, 	61);
		
		
		
		switch(*a_byGroup)
		{
			case MENU_GROUP_FUNCTION:
				displayWriteString(labelGet(LABEL_PHASE_CENTER_01), 		DISPLAY_SELECT_FONT_MINI, 	13, 	9);
				displayWriteString(labelGet(LABEL_PHASE_CENTER_02), 		DISPLAY_NULL, 				13, 	18);
				//displayWriteString("", 			DISPLAY_NULL, 				13, 	31);
				//displayWriteString("", 			DISPLAY_NULL, 				13, 	40);				
				displayWriteString(labelGet(LABEL_PHASE_OSCILL_01), 		DISPLAY_NULL, 				13, 	52);
				displayWriteString(labelGet(LABEL_PHASE_OSCILL_02), 		DISPLAY_NULL, 				13, 	61);
				displayWriteString(labelGet(LABEL_PHASE_AUTO_01), 			DISPLAY_NULL, 				78, 	9);
				displayWriteString(labelGet(LABEL_PHASE_AUTO_02), 			DISPLAY_NULL, 				78, 	18);
				displayWriteString(labelGet(LABEL_PHASE_MANUAL_01), 		DISPLAY_NULL, 				78, 	31);
				displayWriteString(labelGet(LABEL_PHASE_MANUAL_02), 		DISPLAY_NULL, 				78, 	40);
				if (parametersGetValue(PARAM_COLD_SEAL_ENABLE) == 0x0000)
				{
					displayWriteString(labelGet(LABEL_PHASE_FAST_01), 			DISPLAY_NULL, 				78, 	52);
					displayWriteString(labelGet(LABEL_PHASE_FAST_02), 			DISPLAY_NULL, 				78, 	61);
				}
				windowForceRepaint();
				_bset(m_woDisplayedWindow, WIN_FUNCTIONS);
				break;
			case MENU_GROUP_PARAMETER:
				displayWriteString(labelGet(LABEL_CYLINDER_TRAVEL_01), 		DISPLAY_SELECT_FONT_MINI, 	13, 	9);
				displayWriteString(labelGet(LABEL_CYLINDER_TRAVEL_02), 		DISPLAY_NULL, 				13, 	18);
				displayWriteString(labelGet(LABEL_ALARM_BOUND_01), 			DISPLAY_NULL, 				13, 	31);
				displayWriteString(labelGet(LABEL_ALARM_BOUND_02), 			DISPLAY_NULL, 				13, 	40);
				displayWriteString(labelGet(LABEL_GATE_WINDOW_01), 			DISPLAY_NULL, 				13, 	52);
				displayWriteString(labelGet(LABEL_GATE_WINDOW_02), 			DISPLAY_NULL, 				13, 	61);
				displayWriteString(labelGet(LABEL_SW_VERSION_01), 			DISPLAY_NULL, 				78, 	9);
				displayWriteString(labelGet(LABEL_SW_VERSION_02),			DISPLAY_NULL, 				78, 	18);
				if (
					(parametersGetValue(PARAM_LONG_DAC_ENABLE) == 0x0000) ||
					(parametersGetValue(PARAM_TRANS_DAC_ENABLE) == 0x0000) ||
					(parametersGetValue(PARAM_PULL_DAC_ENABLE) == 0x0000)
				   )
				{
					displayWriteString(labelGet(LABEL_TENSION_BASE_VALUE_01),		DISPLAY_NULL, 				78, 	31);
					displayWriteString(labelGet(LABEL_TENSION_BASE_VALUE_02), 		DISPLAY_NULL, 				78, 	40);
				}
				if (
					(parametersGetValue(PARAM_RUNNING_MODE) == PARAM_RUNNING_MODE_MM)
				   )
				{
					displayWriteString(labelGet(LABEL_SELECT_MM_01),		DISPLAY_NULL, 				78, 	52);
					displayWriteString(labelGet(LABEL_SELECT_MM_02), 		DISPLAY_NULL, 				78, 	61);
				}				
				windowForceRepaint();
				_bset(m_woDisplayedWindow, WIN_PARAMETERS);
				break;
			case MENU_GROUP_TEST:
				displayWriteString(labelGet(LABEL_TEST_SH_01), 				DISPLAY_SELECT_FONT_MINI, 	13, 	9);
				displayWriteString(labelGet(LABEL_TEST_SH_02), 				DISPLAY_NULL, 				13, 	18);
				displayWriteString(labelGet(LABEL_TEST_ENC_01), 			DISPLAY_NULL, 				13, 	31);
				displayWriteString(labelGet(LABEL_TEST_ENC_02), 			DISPLAY_NULL, 				13, 	40);
				displayWriteString(labelGet(LABEL_TEST_OUTPUT_01), 			DISPLAY_NULL, 				13, 	52);
				displayWriteString(labelGet(LABEL_TEST_OUTPUT_02), 			DISPLAY_NULL, 				13, 	61);
				//displayWriteString("", 									DISPLAY_NULL, 				78, 	9);
				//displayWriteString("",									DISPLAY_NULL, 				78, 	18);
				//displayWriteString("",									DISPLAY_NULL, 				78, 	31);
				//displayWriteString("", 									DISPLAY_NULL, 				78, 	40);
				//displayWriteString("", 									DISPLAY_NULL, 				78, 	52);
				//displayWriteString("", 									DISPLAY_NULL, 				78, 	61);
				windowForceRepaint();
				_bset(m_woDisplayedWindow, WIN_TESTS);
				break;
			case MENU_GROUP_MENU:
				displayWriteString(labelGet(LABEL_VISUAL_REGISTER_01),		DISPLAY_SELECT_FONT_MINI, 	13, 	9);
				displayWriteString(labelGet(LABEL_VISUAL_REGISTER_02), 		DISPLAY_NULL, 				13, 	18);
				displayWriteString(labelGet(LABEL_VISUAL_OSCILL_01), 		DISPLAY_NULL, 				13, 	31);
				displayWriteString(labelGet(LABEL_VISUAL_OSCILL_02), 		DISPLAY_NULL, 				13, 	40);
				displayWriteString(labelGet(LABEL_JOB_ARCHIVE_01), 			DISPLAY_NULL, 				13, 	52);
				displayWriteString(labelGet(LABEL_JOB_ARCHIVE_02), 			DISPLAY_NULL, 				13, 	61);
				if ((parametersGetValue(PARAM_TWIN_APPLICATION_01)>0) && 
					(parametersGetValue(PARAM_TWIN_APPLICATION_02)>0))
				{
					displayWriteString(labelGet(LABEL_SELECT_APPLICATION_01), 	DISPLAY_NULL, 			78, 	9);
					displayWriteString(labelGet(LABEL_SELECT_APPLICATION_02),	DISPLAY_NULL, 			78, 	18);
				}
				
				if (parametersGetValue(PARAM_TWIN_ENCODER_ENABLE)==0x0000)
				{
					displayWriteString(labelGet(LABEL_SELECT_ENCODER_01),		DISPLAY_NULL, 			78, 	31);
					displayWriteString(labelGet(LABEL_SELECT_ENCODER_02), 		DISPLAY_NULL, 			78, 	40);
				}
				if (parametersGetValue(PARAM_SH_PN_ENABLE)==0x0000)
				{
					displayWriteString(labelGet(LABEL_SELECT_SH_PN_01), 		DISPLAY_NULL, 				78, 	52);
					displayWriteString(labelGet(LABEL_SELECT_SH_PN_02), 		DISPLAY_NULL, 				78, 	61);
				}				
				windowForceRepaint();
				_bset(m_woDisplayedWindow, WIN_MENUS);
				break;
			case MENU_GROUP_ARCHIVE:
				displayWriteString(labelGet(LABEL_SAVE_JOB_01),				DISPLAY_SELECT_FONT_MINI, 	13, 	9);
				displayWriteString(labelGet(LABEL_SAVE_JOB_02), 			DISPLAY_NULL, 				13, 	18);
				displayWriteString(labelGet(LABEL_LOAD_JOB_01), 			DISPLAY_NULL, 				13, 	31);
				displayWriteString(labelGet(LABEL_LOAD_JOB_02), 			DISPLAY_NULL, 				13, 	40);
				windowForceRepaint();
				_bset(m_woDisplayedWindow, WIN_ARCHIVES);
				break;
			case MENU_GROUP_APP:
				switch(parametersGetValue(PARAM_TWIN_APPLICATION_01))
				{
					case PARAM_TWIN_APPLICATION_FBSIDE:
						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_01_01), 		DISPLAY_SELECT_FONT_MINI, 	13, 	9);
						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_01_02), 		DISPLAY_NULL, 	13, 	18);
						break;
					case PARAM_TWIN_APPLICATION_INSETTER:
						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_02_01), 		DISPLAY_SELECT_FONT_MINI, 	13, 	9);
						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_02_02), 		DISPLAY_NULL, 	13, 	18);
						break;
					case PARAM_TWIN_APPLICATION_CUT:
						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_03_01), 		DISPLAY_SELECT_FONT_MINI, 	13, 	9);
						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_03_02), 		DISPLAY_NULL, 	13, 	18);
						break;
					case PARAM_TWIN_APPLICATION_WEBFOLD:
						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_04_01), 		DISPLAY_SELECT_FONT_MINI, 	13, 	9);
						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_04_02), 		DISPLAY_NULL, 	13, 	18);
						break;
					case PARAM_TWIN_APPLICATION_PERFORAT:
						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_05_01), 		DISPLAY_SELECT_FONT_MINI, 	13, 	9);
						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_05_02), 		DISPLAY_NULL, 	13, 	18);
						break;
					case PARAM_TWIN_APPLICATION_FSIDE:
						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_06_01), 		DISPLAY_SELECT_FONT_MINI, 	13, 	9);
						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_06_02), 		DISPLAY_NULL, 	13, 	18);
						break;
					case PARAM_TWIN_APPLICATION_BSIDE:
						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_07_01), 		DISPLAY_SELECT_FONT_MINI, 	13, 	9);
						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_07_02), 		DISPLAY_NULL, 	13, 	18);
						break;						
					default:
						break;
				}

				switch(parametersGetValue(PARAM_TWIN_APPLICATION_02))
				{
					case PARAM_TWIN_APPLICATION_FBSIDE:
						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_01_01), 		DISPLAY_NULL, 	13, 	31);
						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_01_02), 		DISPLAY_NULL, 	13, 	40);
						break;
					case PARAM_TWIN_APPLICATION_INSETTER:
						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_02_01), 		DISPLAY_NULL, 	13, 	31);
						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_02_02), 		DISPLAY_NULL, 	13, 	40);
						break;
					case PARAM_TWIN_APPLICATION_CUT:
						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_03_01), 		DISPLAY_NULL, 	13, 	31);
						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_03_02), 		DISPLAY_NULL, 	13, 	40);
						break;
					case PARAM_TWIN_APPLICATION_WEBFOLD:
						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_04_01), 		DISPLAY_NULL, 	13, 	31);
						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_04_02), 		DISPLAY_NULL, 	13, 	40);
						break;
					case PARAM_TWIN_APPLICATION_PERFORAT:
						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_05_01), 		DISPLAY_NULL, 	13, 	31);
						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_05_02), 		DISPLAY_NULL, 	13, 	40);
						break;
					case PARAM_TWIN_APPLICATION_FSIDE:
						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_06_01), 		DISPLAY_NULL, 	13, 	31);
						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_06_02), 		DISPLAY_NULL, 	13, 	40);
						break;
					case PARAM_TWIN_APPLICATION_BSIDE:
						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_07_01), 		DISPLAY_NULL, 	13, 	31);
						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_07_02), 		DISPLAY_NULL, 	13, 	40);
						break;
					default:
						break;
				}			
				windowForceRepaint();
				_bset(m_woDisplayedWindow, WIN_APPLICATION);
				break;
			case MENU_GROUP_ENC:
				displayWriteString(labelGet(LABEL_ENCODER_01_01),			DISPLAY_SELECT_FONT_MINI, 	13, 	9);
				displayWriteString(labelGet(LABEL_ENCODER_01_02), 			DISPLAY_NULL, 				13, 	18);
				displayWriteString(labelGet(LABEL_ENCODER_02_01), 			DISPLAY_NULL, 				13, 	31);
				displayWriteString(labelGet(LABEL_ENCODER_02_02), 			DISPLAY_NULL, 				13, 	40);
				windowForceRepaint();
				_bset(m_woDisplayedWindow, WIN_ENCODER);
				break;
			case MENU_GROUP_SH_PN:
				displayWriteString(labelGet(LABEL_SH_PN_01_01),				DISPLAY_SELECT_FONT_MINI, 	13, 	9);
				displayWriteString(labelGet(LABEL_SH_PN_01_02), 			DISPLAY_NULL, 				13, 	18);
				displayWriteString(labelGet(LABEL_SH_PN_02_01), 			DISPLAY_NULL, 				13, 	31);
				displayWriteString(labelGet(LABEL_SH_PN_02_02), 			DISPLAY_NULL, 				13, 	40);
				windowForceRepaint();
				_bset(m_woDisplayedWindow, WIN_ENCODER);
				break;			
			case MENU_GROUP_MM_POS:
				displayWriteString(labelGet(LABEL_MM_POSITION_01_01),		DISPLAY_SELECT_FONT_MINI, 	13, 	9);
				displayWriteString(labelGet(LABEL_MM_POSITION_01_02), 		DISPLAY_NULL, 				13, 	18);
				displayWriteString(labelGet(LABEL_MM_POSITION_02_01), 		DISPLAY_NULL, 				13, 	31);
				displayWriteString(labelGet(LABEL_MM_POSITION_02_02), 		DISPLAY_NULL, 				13, 	40);
				windowForceRepaint();
				_bset(m_woDisplayedWindow, WIN_ENCODER);
				break;			
		}	
		

		displaySetOutLine(0, 	0, 	63, 	20, 	(*a_bySelected == 1));
		displaySetOutLine(0, 	22, 63, 	42, 	(*a_bySelected == 2));
		displaySetOutLine(0, 	44, 63, 	64, 	(*a_bySelected == 3));
		displaySetOutLine(65, 	0, 	126, 	20, 	(*a_bySelected == 4));
		displaySetOutLine(65, 	22, 126, 	42, 	(*a_bySelected == 5));
		displaySetOutLine(65, 	44,	126, 	64, 	(*a_bySelected == 6));
		
	}
	else
	{
		if ((*a_bySelected == 1) || parametersGetValue(PARAM_PAGE_SEL) == 1)
			displayInvertArea(1, 	1, 	62, 	19);
			
		if ((*a_bySelected == 2) || parametersGetValue(PARAM_PAGE_SEL) == 2)
			displayInvertArea(1, 	23, 62, 	41);
			
		if ((*a_bySelected == 3) || parametersGetValue(PARAM_PAGE_SEL) == 3)
			displayInvertArea(1, 	45, 62, 	63);
			
		if ((*a_bySelected == 4) || parametersGetValue(PARAM_PAGE_SEL) == 4)
			displayInvertArea(66, 	1, 	125, 	19);
			
		if ((*a_bySelected == 5) || parametersGetValue(PARAM_PAGE_SEL) == 5)
			displayInvertArea(66, 	23, 125, 	41);
			
		if ((*a_bySelected == 6) || parametersGetValue(PARAM_PAGE_SEL) == 6)
			displayInvertArea(66, 	45,	125, 	63);
	}

	parametersSet(PARAM_PAGE_SEL, *a_bySelected);	
}

/*****************************************************************************/
BYTE windowSetupParameter(BYTE a_byOffset, WORD a_woCurrentValue)
{
	BYTE i;
	BYTE byParametersJumped = 0x00;
	BYTE byProgressive		= 0x00;
	BYTE byParameterIndex;
	BYTE strMessage[50];
	BYTE bySelectedIndex	= 0xFF;
	WORD woCurrentValue;
	
	while(a_byOffset > PARAMETER_NUMBER-PARAMETER_SETUP_INITIAL_INDEX)
	{
		a_byOffset-=PARAMETER_NUMBER-PARAMETER_SETUP_INITIAL_INDEX;
	}
	
	
	if (!_btst(m_woDisplayedWindow, WIN_SETUP)) //Not displayed
	{
		displayClearArea(0, 0, 126, 64);
		displaySetOutLine(0, 0, 126, 64, false);

		//Label
		if (parametersGetValue(PARAM_VISUAL_SETUP_FULL))
		{
			displayWriteString(labelGet(LABEL_FULL_SETUP), DISPLAY_SELECT_FONT_MINI, 2, 6);
		}
		else
		{
			displayWriteString(labelGet(LABEL_SIMPLE_SETUP), DISPLAY_SELECT_FONT_MINI, 2, 6);
		}
		displayInvertArea(1, 1, 124, 6);
		
		
		//Count the visible menus
		if (parametersGetValue(PARAM_VISUAL_SETUP_FULL))
		{
			m_byVisibleMenu = PARAMETER_NUMBER-PARAMETER_SETUP_INITIAL_INDEX;
		}
		else
		{
			m_byVisibleMenu = 0x01;
			
			i=PARAMETER_NUMBER-PARAMETER_SETUP_INITIAL_INDEX;
			while(i-->0)
			{
				if(parametersVisible(i + PARAMETER_SETUP_INITIAL_INDEX))
				{
					m_byVisibleMenu++;
				}
			}
		}
	}
	
	
	a_byOffset = MAX(0, a_byOffset);
	for(i=0; i<7+byParametersJumped; i++)
	{
		byParameterIndex = a_byOffset + i;
		while(byProgressive>=m_byVisibleMenu)
		{
			byProgressive -= m_byVisibleMenu;
		}
		while(byParameterIndex>= (PARAMETER_NUMBER-PARAMETER_SETUP_INITIAL_INDEX))
		{
			byParameterIndex -= (PARAMETER_NUMBER-PARAMETER_SETUP_INITIAL_INDEX);
		}

		//Looking for a parameter to display
		if(	parametersVisible(byParameterIndex + PARAMETER_SETUP_INITIAL_INDEX) || 
			parametersGetValue(PARAM_VISUAL_SETUP_FULL) ) //Not displayed
		{
			if(bySelectedIndex == 0xFF)
			{
				bySelectedIndex = byParameterIndex + PARAMETER_SETUP_INITIAL_INDEX;
				parametersSet(PARAM_PAGE_SEL, byParameterIndex);
				
				if (a_woCurrentValue == 0xFFFF)
				{
					woCurrentValue = parametersGetValue(byParameterIndex + PARAMETER_SETUP_INITIAL_INDEX);
				}
				else
				{
					woCurrentValue = a_woCurrentValue;
				}
			}
			else
			{
				woCurrentValue = parametersGetValue(byParameterIndex + PARAMETER_SETUP_INITIAL_INDEX);
			}
			
			if ( parametersIsChanged(PARAM_PAGE_SEL) ||
				(parametersGetValue(PARAM_PAGE) != PAGE_SETUP) ||
				!_btst(m_woDisplayedWindow, WIN_SETUP))
			{
				displayClearArea(1,8+(byProgressive * 8), 10, MIN(15 + (byProgressive * 8), 62));
				formatNumber(byParameterIndex+1, 2, 0, strMessage);
				strMessage[2] = 0x00;
				displayWriteString(strMessage, 				DISPLAY_SELECT_FONT_MINI, 	2, 14 + (byProgressive * 8));
				
				displayClearArea(11,8+(byProgressive * 8), 104, MIN(15 + (byProgressive * 8), 62));
				memcpy(strMessage,  parametersGetLabel(byParameterIndex + PARAMETER_SETUP_INITIAL_INDEX),22);
				strMessage[22] = 0x00;
				displayWriteString(strMessage, 				DISPLAY_SELECT_FONT_MINI, 	11, 14 + (byProgressive * 8));
			}
	
			displayClearArea(105,8+(byProgressive * 8), 124, MIN(15 + (byProgressive * 8), 62));
			formatNumber(woCurrentValue , 5, 0, strMessage);
			strMessage[5] = 0x00;
			displayWriteString(strMessage, 				DISPLAY_SELECT_FONT_MINI, 105, 14 + (byProgressive * 8));
			
			byProgressive++;
		}
		else
		{
			byParametersJumped++;
		}
	}
	
	//Select the first one
	if ( parametersIsChanged(PARAM_PAGE_SEL) ||
		(parametersGetValue(PARAM_PAGE) != PAGE_SETUP) ||
		!_btst(m_woDisplayedWindow, WIN_SETUP))
	{
		displayInvertArea(1,8, 124, 14 );
	}
	else
	{
		displayInvertArea(105,8, 124, 14 );
	}
	
	_bres(m_woDisplayedWindow, WIN_SPEED);
	_bres(m_woDisplayedWindow, WIN_CYLINDER_SIZE);
	_bres(m_woDisplayedWindow, WIN_DAC_BASE);
	_bres(m_woDisplayedWindow, WIN_MODE);
	_bres(m_woDisplayedWindow, WIN_OSCILLOSCOPE);
	_bres(m_woDisplayedWindow, WIN_REGISTER);
	_bres(m_woDisplayedWindow, WIN_ALARM);
	_bres(m_woDisplayedWindow, WIN_MESSAGE);
	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
	_bres(m_woDisplayedWindow, WIN_TESTS);
	_bset(m_woDisplayedWindow, WIN_SETUP);
	_bres(m_woDisplayedWindow, WIN_MENUS);	
	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
	_bres(m_woDisplayedWindow, WIN_APPLICATION);
	_bres(m_woDisplayedWindow, WIN_ENCODER);

	
	return bySelectedIndex;
}
