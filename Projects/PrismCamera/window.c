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


/*****************************************************************************/
// Variables declaration
/*****************************************************************************/
extern 	@near 			BYTE 		m_arbyDisplayCommand[DISPLAY_CMD_BUFFER];
extern 	@near 			BYTE 		m_arbyScanningHeadSignal[256];
extern 					WORD 		m_woEncoderGateStart;
extern 					WORD 		m_woEncoderGateEnd;
extern					WORD		m_woEncoderGateWidth;

						WORD		m_woRegisterValue;
						BYTE		m_byCurrentSelectorX;
						WORD		m_woDisplayedWindow;

/*

BYTE m_arstrSetupParametersLabel[13][12] =
{
	"Guadagno L ",
	"Ciclico L  ",
	"Z.morta L  ",
	"Vel.motor L",
	"Lingua     ",
	"Salto      ",
	"Derivativo ",
	"Inserzione ",
	"Trip       ",
	"Inverti Cor",
	"Inserzione ",
	"MM/MC      ",
	"Segno in MM"
};

@near	BYTE 	m_arbySetupParametersCode[13] =
{
	0x05,
	0x07,
	0x09,
	0x0B,
	0x12,
	0x0F,
	0x10,
	0x11,
	0x04,
	0x16,
	0x11,
	0x17,
	0x03
};

@near	WORD	m_arwoSetupParametersValue[13];*/

//@near	WORD	m_arwoSetupParametersValue[STI_SETUP_NUMBERS];


/*****************************************************************************/
// Functions declaration
/*****************************************************************************/
void windowRegisterPrepareFormateValue(BYTE * a_strErrValue);


/*****************************************************************************/
void windowInit(void)
{
	m_byCurrentSelectorX = 0x00;
	m_woDisplayedWindow = 0x00;
	m_woEncoderGateStart 	= 1;
	m_woEncoderGateEnd 		= 100;

}

/*****************************************************************************/
void windowForceRepaint(void)
{
	m_woDisplayedWindow = 0x0000;
}

/*****************************************************************************/
void windowMode(void)
{
	if (!_btst(m_woDisplayedWindow, WIN_MODE) || parametersIsChanged(PARAM_MODE_LONG))
	{
		if (parametersGetValue(PARAM_MODE_LONG)==PARAM_MODE_AUTO)
		{
			displayDrawBox(0, 0, 62, 16, "modo:", "automatico", 0xFFFF,0, _btst(m_woDisplayedWindow, WIN_MODE));
		}
		else
		{
			displayDrawBox(0, 0, 62, 16, "modo:", "manuale", 0xFFFF,0, _btst(m_woDisplayedWindow, WIN_MODE));			
		}
		parametersChangedFlagReset(PARAM_MODE_LONG);
	}
	
	_bset(m_woDisplayedWindow, WIN_MODE);
	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
	_bres(m_woDisplayedWindow, WIN_TESTS);
	_bres(m_woDisplayedWindow, WIN_MENUS);
}

/*****************************************************************************/
void windowSpeed(void)
{
	if (!_btst(m_woDisplayedWindow, WIN_SPEED) || parametersIsChanged(PARAM_SPEED))
	{
		displayDrawBox(64, 0, 62, 16, "velocita:", "mt/min", parametersGetValue(PARAM_SPEED), 4, _btst(m_woDisplayedWindow, WIN_SPEED));
		parametersChangedFlagReset(PARAM_SPEED);
	}

	_bset(m_woDisplayedWindow, WIN_SPEED);
	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
	_bres(m_woDisplayedWindow, WIN_TESTS);
	_bres(m_woDisplayedWindow, WIN_MENUS);
}

/*****************************************************************************/
void windowMessage(BYTE * a_strMessage1, BYTE * a_strMessage2)
{
	if (!_btst(m_woDisplayedWindow, WIN_MESSAGE)) //Not displayed
	{
		displayClearArea(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM);
		displaySetOutLine(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM, false);

		//Label
		displayWriteString("messaggio:", DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT+2, WINDOW_3_TOP+6);
		displayInvertArea(WINDOW_3_LEFT+1, WINDOW_3_TOP+1, WINDOW_3_RIGHT-2, WINDOW_3_TOP+6);
	}
	
	displayWriteString(a_strMessage1, DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+10);	
	displayWriteString(a_strMessage2, DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
	
	
	_bset(m_woDisplayedWindow, WIN_MESSAGE);
	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
	_bres(m_woDisplayedWindow, WIN_TESTS);
	_bres(m_woDisplayedWindow, WIN_MENUS);
}

/*****************************************************************************/
void windowBigMessage(BYTE * a_strMessage1, BYTE * a_strMessage2)
{
	if (!_btst(m_woDisplayedWindow, WIN_MESSAGE)) //Not displayed
	{
		displayClearArea(0, 0, 126, 64);
		displaySetOutLine(0, 0, 126, 64, false);

		//Label
		displayWriteString("messaggio:", DISPLAY_SELECT_FONT_MINI, 2, 6);
		displayInvertArea(1, 1, 124, 6);
	}
	
	displayWriteString(a_strMessage1, DISPLAY_SELECT_FONT_5x7, 5, 25);	
	displayWriteString(a_strMessage2, DISPLAY_SELECT_FONT_5x7, 5, 40);	
	
	
	_bres(m_woDisplayedWindow, WIN_MODE);
	_bres(m_woDisplayedWindow, WIN_SPEED);
	_bres(m_woDisplayedWindow, WIN_OSCILLOSCOPE);
	_bres(m_woDisplayedWindow, WIN_REGISTER);
	_bres(m_woDisplayedWindow, WIN_ALARM);
	_bset(m_woDisplayedWindow, WIN_MESSAGE);
	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
	_bres(m_woDisplayedWindow, WIN_TESTS);
	_bres(m_woDisplayedWindow, WIN_MENUS);
}

/*****************************************************************************/
void windowAlarm(void)
{
	
	if (!_btst(m_woDisplayedWindow, WIN_ALARM)) //Not displayed
	{
		displayClearArea(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM);
		displaySetOutLine(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM, false);

		//Label
		displayWriteString("allarme:", DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT+2, WINDOW_3_TOP+6);
		displayInvertArea(WINDOW_3_LEFT+1, WINDOW_3_TOP+1, WINDOW_3_RIGHT-2, WINDOW_3_TOP+6);
	}
	
	if _btst(parametersGetValue(PARAM_ALARM), STI_ANSWER_ALARM_ERR_NO_PRINT)
	{
		displayWriteString("Mancanza stampa", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+25);	
	}
	else if _btst(parametersGetValue(PARAM_ALARM), STI_ANSWER_ALARM_ERR_LOW_SPEED)
	{
		displayWriteString("Velocita' bassa", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+25);	
	}
	else if _btst(parametersGetValue(PARAM_ALARM), STI_ANSWER_ALARM_ERR_TEST_SH)
	{
		displayWriteString("Test testina", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
		displayWriteString("fallito", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
	}
	else if _btst(parametersGetValue(PARAM_ALARM), STI_ANSWER_ALARM_ERR_TEST_ENC)
	{
		displayWriteString("Test encoder", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
		displayWriteString("fallito", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
	}
	else if _btst(parametersGetValue(PARAM_ALARM), STI_ANSWER_ALARM_ERR_PHASE_AUTO)
	{
		displayWriteString("Fasatura automatica", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
		displayWriteString("fallita", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
	}
	else if _btst(parametersGetValue(PARAM_ALARM), STI_ANSWER_ALARM_CYLINDER_TRAVEL)
	{
		displayWriteString("Sviluppo Cilindro (P1)", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
		displayWriteString("non accettabile", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
	}
	else if _btst(parametersGetValue(PARAM_ALARM), STI_ANSWER_ALARM_GATE_WINDOW)
	{
		displayWriteString("Ampiezza Gate (P3)", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
		displayWriteString("non accettabile", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
	}
	else if _btst(parametersGetValue(PARAM_ALARM), STI_ANSWER_OK)
	{
		displayWriteString("Nessun problema!", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+25);	
	}
	else
	{
		displayWriteString("Codice allarme", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
		displayWriteString("non riconosciuto", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
	}
	
	_bres(m_woDisplayedWindow, WIN_OSCILLOSCOPE);
	_bres(m_woDisplayedWindow, WIN_REGISTER);
	_bset(m_woDisplayedWindow, WIN_ALARM);
	_bres(m_woDisplayedWindow, WIN_MESSAGE);
	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
	_bres(m_woDisplayedWindow, WIN_TESTS);
	_bres(m_woDisplayedWindow, WIN_MENUS);
}


/*****************************************************************************/
BYTE windowOscilloscopeGetValue(WORD a_woEncIndex)
{
	BYTE byValue;

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
void windowOscilloscope(BYTE a_byCenterPulse, BYTE a_byPage)
{
	BYTE i;
	BYTE j;
	BYTE byLeft;
	WORD woEncoderIndex;
	BYTE byValue;
	BYTE byPrevValue = WINDOW_3_OSCILLOSCOPE_Y;
	BYTE byPrevGateValue;
	WORD woGateWidth;
	WORD arwoValue[16];
	BYTE byGateHasToBeRepainted;
	
	
	if (!_btst(m_woDisplayedWindow, WIN_OSCILLOSCOPE)) //Not displayed
	{
		displayClearArea(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM);
		displaySetOutLine(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM, false);
		displayWriteString("Taj Scope:", DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT+2, WINDOW_3_TOP+6);
		displayInvertArea(WINDOW_3_LEFT+1, WINDOW_3_TOP+1, WINDOW_3_RIGHT-2, WINDOW_3_TOP+7);
		
		// No offset set-up
		parametersSet(PARAM_OSCIL_OFFSET, ENCODER_PULSES + m_woEncoderGateStart - (m_woEncoderGateWidth/2)& (ENCODER_PULSES-1));
	}

	//A key is pressed during scanning head or gate acquisition
	if ((m_woEncoderGateStart != 0xFFFF) && (m_woEncoderGateEnd != 0xFFFF))
	{
		woEncoderIndex = parametersGetValue(PARAM_OSCIL_OFFSET);
		byPrevGateValue = windowIsInGate((woEncoderIndex+parametersGetValue(PARAM_OSCIL_ZOOM)-1)& (ENCODER_PULSES-1))?WINDOW_3_GATE_LOW_Y:WINDOW_3_GATE_HIGH_Y;
		/*byGateHasToBeRepainted = (	!_btst(m_woDisplayedWindow, WIN_OSCILLOSCOPE) || 
					parametersIsChanged(PARAM_OSCIL_ZOOM) || 
					parametersIsChanged(PARAM_OSCIL_OFFSET));*/
					
		byGateHasToBeRepainted = true;
		
		//Common Command
		m_arbyDisplayCommand[0] = DISPLAY_CLEAR_AREA;
		m_arbyDisplayCommand[5] = DISPLAY_WAIT;
		m_arbyDisplayCommand[6] = DISPLAY_SET_AREA;
		m_arbyDisplayCommand[11] = DISPLAY_EOF;		
		
		//For each pixel
		for(i=0; (i<(WINDOW_3_WIDTH-4) && !displayIsKeyPress()) ; i++)
		{
			//Get Max value in a set, starting in woEncoderIndex and with width = PARAM_OSCIL_ZOOM
			j = parametersGetValue(PARAM_OSCIL_ZOOM);
			byValue = 0x0000;
			while(j-->0)
			{
				byValue = (WORD) MAX(byValue,windowOscilloscopeGetValue(woEncoderIndex));  //(woValue>arwoValue[j]?woValue:arwoValue[j]);
				//Increment Encoder Index
				woEncoderIndex = (woEncoderIndex+1) & (ENCODER_PULSES-1);
			}
	
			byValue = WINDOW_3_OSCILLOSCOPE_Y-(byValue<<2);
			byLeft = WINDOW_3_LEFT + i + 2;

			
			if (byGateHasToBeRepainted)
			{
				
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
				m_arbyDisplayCommand[10] = windowIsInGate(woEncoderIndex)?WINDOW_3_GATE_LOW_Y:WINDOW_3_GATE_HIGH_Y; 
				//m_arbyDisplayCommand[11] = DISPLAY_EOF;
				byPrevGateValue =m_arbyDisplayCommand[10];
				
				displayCmdToDisplay(m_arbyDisplayCommand);
			}

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

		if(!displayIsKeyPress())
		{
			parametersChangedFlagReset(PARAM_OSCIL_ZOOM);
			parametersChangedFlagReset(PARAM_OSCIL_OFFSET);
		}
		
	}

	_bset(m_woDisplayedWindow, WIN_OSCILLOSCOPE);
	_bres(m_woDisplayedWindow, WIN_REGISTER);
	_bres(m_woDisplayedWindow, WIN_ALARM);
	_bres(m_woDisplayedWindow, WIN_MESSAGE);
	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
	_bres(m_woDisplayedWindow, WIN_TESTS);
	_bres(m_woDisplayedWindow, WIN_MENUS);
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
		displayWriteString("registro:", DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT+2, WINDOW_3_TOP+6);
		displayInvertArea(WINDOW_3_LEFT+1, WINDOW_3_TOP+1, WINDOW_3_RIGHT-2, WINDOW_3_TOP+6);
		
		//Lines Selector
		displayDrawHorizontalLine(byRulerTop + 1, WINDOW_3_LEFT + 6, WINDOW_3_WIDTH - 13);
		/* -1   */ displayDrawVerticalLine(WINDOW_3_LEFT + 5								, byRulerTop - 1, 6);	
		/*  0   */ displayDrawVerticalLine(WINDOW_3_LEFT + 5 + (WINDOW_3_WIDTH - 11) / 2	, byRulerTop - 1, 6);
		/*  1   */ displayDrawVerticalLine(WINDOW_3_LEFT + 5 + (WINDOW_3_WIDTH - 11)		, byRulerTop - 1, 6);
		/* -0.5 */ displayDrawVerticalLine(WINDOW_3_LEFT + 5 + (WINDOW_3_WIDTH - 11) / 4	, byRulerTop + 2, 1);
		/* +0.5 */ displayDrawVerticalLine(WINDOW_3_LEFT + 5 + (WINDOW_3_WIDTH - 11) * 3 / 4, byRulerTop + 2, 1);
	}
	
	
	
	//Draw Selector
	if (parametersIsChanged(PARAM_ERR_LONG) || (!_btst(m_woDisplayedWindow, WIN_REGISTER)) )
	{
		//Selector has to be reprinted
		dblPercentValue = ((double) parametersGetValue(PARAM_ERR_LONG)- (double) 0x8000) / 100.0;
		dblPercentValue = (dblPercentValue>1?1:dblPercentValue);
		dblPercentValue = (dblPercentValue<-1?-1:dblPercentValue);
		
		displayWriteString("-", DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT + 4								 , 	byRulerTop - 3);
		displayWriteString("+", DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT + 4 + (WINDOW_3_WIDTH - 11)		 , 	byRulerTop - 3);
		//displayWriteString("0", DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT + 4 + ((WINDOW_3_WIDTH - 11) / 2), 	byRulerTop - 3);
		
		//Selector
		if (m_byCurrentSelectorX>0)
		{
			displayClearArea(m_byCurrentSelectorX-1, byRulerTop - 11, m_byCurrentSelectorX+1, byRulerTop-3);
		}
		
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
		displayDrawCorrection(WINDOW_3_LEFT, byRulerTop, WINDOW_3_WIDTH, LOBYTE(parametersGetValue(PARAM_CORRECTION)), /*size*/0x01);
		parametersChangedFlagReset(PARAM_CORRECTION);
	}

	//Draw alarm out of bound
	if (parametersIsChanged(PARAM_ALARM_OUT_OF_BOUND))
	{
		if (parametersGetValue(PARAM_ALARM_OUT_OF_BOUND))
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
	_bres(m_woDisplayedWindow, WIN_MENUS);
}

/*****************************************************************************/
void window6Menu(BYTE * a_byGroup, BYTE * a_bySelected)
{
	if ( !  (	((*a_byGroup == MENU_GROUP_FUNCTION) 	&& _btst(m_woDisplayedWindow, WIN_FUNCTIONS)) ||
				((*a_byGroup == MENU_GROUP_PARAMETER) 	&& _btst(m_woDisplayedWindow, WIN_PARAMETERS)) ||
				((*a_byGroup == MENU_GROUP_MENU) 		&& _btst(m_woDisplayedWindow, WIN_MENUS)) ||
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
				displayWriteString("Fasatura", 			DISPLAY_SELECT_FONT_MINI, 	13, 	52);
				displayWriteString("manuale", 			DISPLAY_NULL, 				13, 	61);
				displayWriteString("Fasatura", 			DISPLAY_NULL, 				78, 	9);
				displayWriteString("automatica", 		DISPLAY_NULL, 				78, 	18);
				displayWriteString("Fasatura ad", 		DISPLAY_NULL, 				78, 	31);
				displayWriteString("oscilloscop", 		DISPLAY_NULL, 				78, 	40);
				displayWriteString("Fasatura ad", 		DISPLAY_NULL, 				78, 	52);
				displayWriteString("acceleraz", 		DISPLAY_NULL, 				78, 	61);
				windowForceRepaint();
				_bset(m_woDisplayedWindow, WIN_FUNCTIONS);
				break;
			case MENU_GROUP_PARAMETER:
				displayWriteString("Sviluppo", 			DISPLAY_SELECT_FONT_MINI, 	13, 	9);
				displayWriteString("cilindro", 			DISPLAY_NULL, 				13, 	18);
				displayWriteString("Soglia", 			DISPLAY_NULL, 				13, 	31);
				displayWriteString("allarme", 			DISPLAY_NULL, 				13, 	40);
				displayWriteString("Ampiezza", 			DISPLAY_NULL, 				13, 	52);
				displayWriteString("gate", 				DISPLAY_NULL, 				13, 	61);
				windowForceRepaint();
				_bset(m_woDisplayedWindow, WIN_PARAMETERS);
				break;
			case MENU_GROUP_TEST:
				displayWriteString("Test", 				DISPLAY_SELECT_FONT_MINI, 	13, 	9);
				displayWriteString("testina", 			DISPLAY_NULL, 				13, 	18);
				displayWriteString("Test", 				DISPLAY_NULL, 				13, 	31);
				displayWriteString("encoder", 			DISPLAY_NULL, 				13, 	40);
				displayWriteString("Distanza", 			DISPLAY_NULL, 				13, 	52);
				displayWriteString("su offset", 		DISPLAY_NULL, 				13, 	61);
				displayWriteString("Versione", 			DISPLAY_NULL, 				78, 	9);
				displayWriteString("Software", 			DISPLAY_NULL, 				78, 	18);
				//displayWriteString("", 				DISPLAY_NULL, 				78, 	31);
				//displayWriteString("", 				DISPLAY_NULL, 				78, 	40);
				//displayWriteString("", 				DISPLAY_NULL, 				78, 	52);
				//displayWriteString("", 				DISPLAY_NULL, 				78, 	61);
				windowForceRepaint();
				_bset(m_woDisplayedWindow, WIN_TESTS);
				break;
			case MENU_GROUP_MENU:
				displayWriteString("Visual",			DISPLAY_SELECT_FONT_MINI, 	13, 	9);
				displayWriteString("Registro", 			DISPLAY_NULL, 				13, 	18);
				displayWriteString("Visual", 			DISPLAY_NULL, 				13, 	31);
				displayWriteString("Oscilloscop", 		DISPLAY_NULL, 				13, 	40);
				displayWriteString("Archivio", 			DISPLAY_NULL, 				13, 	52);
				displayWriteString("Lavori", 			DISPLAY_NULL, 				13, 	61);
				displayWriteString("Funzioni", 			DISPLAY_NULL, 				78, 	9);
				displayWriteString("", 					DISPLAY_NULL, 				78, 	18);
				displayWriteString("Parametri", 		DISPLAY_NULL, 				78, 	31);
				displayWriteString("", 					DISPLAY_NULL, 				78, 	40);
				displayWriteString("Tests", 			DISPLAY_NULL, 				78, 	52);
				displayWriteString("", 					DISPLAY_NULL, 				78, 	61);
				windowForceRepaint();
				_bset(m_woDisplayedWindow, WIN_MENUS);
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
void windowSetupParameter(void)
{

}