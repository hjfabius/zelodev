#include "window.h"


/*****************************************************************************/
// Costants declaration
/*****************************************************************************/
#define 	WIN_MODE			0
#define 	WIN_TEMPERATURE		1
//#define 	WIN_OSCILLOSCOPE	2
#define 	WIN_MAIN			3
#define 	WIN_ALARM			4
#define 	WIN_MESSAGE			5
//#define 	WIN_FUNCTIONS		6
#define		WIN_VISCO_REF		7
#define		WIN_VISCO_REAL		8
#define		WIN_MENUS			9
#define		WIN_SETUP			10
#define 	WIN_ARCHIVES		11
//#define 	WIN_APPLICATION		12
//#define		WIN_ENCODER			13
#define		WIN_6MESSAGES		14
#define 	WIN_CUP		15

/*****************************************************************************/
// Variables declaration
/*****************************************************************************/
extern 	@near 			BYTE 		m_arbyDisplayCommand[DISPLAY_CMD_BUFFER];

						WORD		m_woRegisterValue;
						BYTE		m_byCurrentSelectorX;
						WORD		m_woDisplayedWindow;
						BYTE		m_byVisibleMenu;
						double 		dblParamErrorZoom;

/*****************************************************************************/
// Functions declaration
/*****************************************************************************/
void windowMainPrepareFormateValue(BYTE * a_strErrValue);

/*****************************************************************************/
void windowInit(void)
{
	m_byCurrentSelectorX = 0x00;
	m_woDisplayedWindow = 0x0000;
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
	if (!_btst(m_woDisplayedWindow, WIN_MODE) || parametersIsChanged(PARAM_MODE))
	{
		switch(parametersGetValue(PARAM_MODE))
		{
			case PARAM_MODE_AUTO:
				displayDrawBox(0, 0, 30, 16, labelGet(LABEL_MODE), labelGet(LABEL_MODE_AUTO), 0xFFFF,0,0,_btst(m_woDisplayedWindow, WIN_MODE));
				break;
			case PARAM_MODE_OFF:
				displayDrawBox(0, 0, 30, 16, labelGet(LABEL_MODE), labelGet(LABEL_MODE_OFF), 0xFFFF,0,0, _btst(m_woDisplayedWindow, WIN_MODE));			
				break;
			case PARAM_MODE_PAUSE:
				displayDrawBox(0, 0, 30, 16, labelGet(LABEL_MODE), labelGet(LABEL_MODE_PAUSE), 0xFFFF,0,0,_btst(m_woDisplayedWindow, WIN_MODE));			
				break;
			case PARAM_MODE_MANUAL:
				displayDrawBox(0, 0, 30, 16, labelGet(LABEL_MODE), labelGet(LABEL_MODE_MANUAL), 0xFFFF,0,0,_btst(m_woDisplayedWindow, WIN_MODE));			
				break;
			default:
				parametersSet(PARAM_MODE, PARAM_MODE_MANUAL);
				displayDrawBox(0, 0, 30, 16, labelGet(LABEL_MODE), labelGet(LABEL_MODE_MANUAL), 0xFFFF,0,0,_btst(m_woDisplayedWindow, WIN_MODE));			
				break;
		}

		parametersChangedFlagReset(PARAM_MODE);
	}		
	
	_bset(m_woDisplayedWindow, WIN_MODE);
	_bres(m_woDisplayedWindow, WIN_MESSAGE);
	_bres(m_woDisplayedWindow, WIN_SETUP);
	_bres(m_woDisplayedWindow, WIN_MENUS);
	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
	_bres(m_woDisplayedWindow, WIN_6MESSAGES);
}

/*****************************************************************************/
void windowViscosityRef(void)
{
	WORD woValue = 0x0000;
	
	if (!_btst(m_woDisplayedWindow, WIN_VISCO_REF) || parametersIsChanged(PARAM_REF_VISCOSITY) || parametersIsChanged(PARAM_MODE))
	{
		if (parametersGetValue(PARAM_MODE) != PARAM_MODE_OFF)
		{
			 woValue = parametersGetValue(PARAM_REF_VISCOSITY);
		}
		displayDrawBox(32, 0, 30, 16, labelGet(LABEL_REFERENCE), "", woValue, 4,1, _btst(m_woDisplayedWindow, WIN_VISCO_REF));
		//parametersChangedFlagReset(PARAM_REF_VISCOSITY);
	}

	_bset(m_woDisplayedWindow, WIN_VISCO_REF);
	_bres(m_woDisplayedWindow, WIN_MESSAGE);
	_bres(m_woDisplayedWindow, WIN_SETUP);
	_bres(m_woDisplayedWindow, WIN_MENUS);
	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
	_bres(m_woDisplayedWindow, WIN_6MESSAGES);
}

/*****************************************************************************/
void windowViscosityReal(void)
{
	WORD woValue = 0x0000;

	if (!_btst(m_woDisplayedWindow, WIN_VISCO_REAL) || parametersIsChanged(PARAM_OUT_VISCOSITY) || parametersIsChanged(PARAM_MODE))
	{
		if (parametersGetValue(PARAM_MODE) != PARAM_MODE_OFF)
		{
			 woValue = parametersGetValue(PARAM_OUT_VISCOSITY);
		}
		displayDrawBox(64, 0, 30, 16, labelGet(LABEL_REAL), "", woValue, 4,1, _btst(m_woDisplayedWindow, WIN_VISCO_REAL));
		//parametersChangedFlagReset(PARAM_OUT_VISCOSITY);
	}

	_bset(m_woDisplayedWindow, WIN_VISCO_REAL);
	_bres(m_woDisplayedWindow, WIN_MESSAGE);
	_bres(m_woDisplayedWindow, WIN_SETUP);
	_bres(m_woDisplayedWindow, WIN_MENUS);
	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
	_bres(m_woDisplayedWindow, WIN_6MESSAGES);
}

/*****************************************************************************/
void windowTemperature(void)
{	
	WORD woValue = 0x0000;
	
	if (!_btst(m_woDisplayedWindow, WIN_TEMPERATURE) || parametersIsChanged(PARAM_OUT_TEMPERATURE) || parametersIsChanged(PARAM_MODE))
	{
		if (parametersGetValue(PARAM_MODE) != PARAM_MODE_OFF)
		{
			 woValue = parametersGetValue(PARAM_OUT_TEMPERATURE);
		}
		displayDrawBox(96, 0, 30, 16, labelGet(LABEL_TEMPERATURE), "", woValue, 4,1,_btst(m_woDisplayedWindow, WIN_TEMPERATURE));
		parametersChangedFlagReset(PARAM_OUT_TEMPERATURE);
	}

	_bset(m_woDisplayedWindow, WIN_TEMPERATURE);
	_bres(m_woDisplayedWindow, WIN_MESSAGE);
	_bres(m_woDisplayedWindow, WIN_SETUP);
	_bres(m_woDisplayedWindow, WIN_MENUS);
	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
	_bres(m_woDisplayedWindow, WIN_6MESSAGES);
}

/*****************************************************************************/
/*void windowMessage(BYTE * a_strMessage1, BYTE * a_strMessage2)
{
	if (!_btst(m_woDisplayedWindow, WIN_MESSAGE)) //Not displayed
	{
		displayClearArea(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM);
		displaySetOutLine(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM, false);

		//Label
		displayWriteString(labelGet(LABEL_MESSAGE), DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT+2, WINDOW_3_TOP+6);
		displayInvertArea(WINDOW_3_LEFT+1, WINDOW_3_TOP+1, WINDOW_3_RIGHT-2, WINDOW_3_TOP+6);
	}
	
	displayWriteString(a_strMessage1, DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+10);	
	displayWriteString(a_strMessage2, DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
	
	
	_bset(m_woDisplayedWindow, WIN_MESSAGE);
	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
	_bres(m_woDisplayedWindow, WIN_VISCO_REF);
	_bres(m_woDisplayedWindow, WIN_VISCO_REAL);
	_bres(m_woDisplayedWindow, WIN_SETUP);
	_bres(m_woDisplayedWindow, WIN_MENUS);
	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
	_bres(m_woDisplayedWindow, WIN_APPLICATION);
	_bres(m_woDisplayedWindow, WIN_ENCODER);
}*/

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
	_bres(m_woDisplayedWindow, WIN_TEMPERATURE);
	_bres(m_woDisplayedWindow, WIN_MAIN);
	_bres(m_woDisplayedWindow, WIN_ALARM);
	_bset(m_woDisplayedWindow, WIN_MESSAGE);
	_bres(m_woDisplayedWindow, WIN_VISCO_REF);
	_bres(m_woDisplayedWindow, WIN_VISCO_REAL);
	_bres(m_woDisplayedWindow, WIN_SETUP);
	_bres(m_woDisplayedWindow, WIN_MENUS);
	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
	_bres(m_woDisplayedWindow, WIN_6MESSAGES);
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

		memcpy(strValue, labelGet(LABEL_GENERIC_ALARM_01), 16);
		formatNumber(woAlarm, 5, 0, strValue + 8);
		displayWriteString(strValue, DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	

		switch(woAlarm)
		{
			case PARAM_ALARM_MEASURING_VISCOSITY:
				displayWriteString(labelGet(LABEL_ALARM_MEASURING_VISCOSITY), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
				break;
			case PARAM_ALARM_MEASURING_TEMPERATURE:
				displayWriteString(labelGet(LABEL_ALARM_MEASURING_TEMPERATURE), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
				break;
			case PARAM_ALARM_PUMP_ON:
				displayWriteString(labelGet(LABEL_ALARM_PUMP_ON), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
				break;
			default:
				memcpy(strValue, labelGet(LABEL_GENERIC_ALARM_01), 16);
				formatNumber(woAlarm, 5, 0, strValue + 8);
				displayWriteString(strValue, DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
				displayWriteString(labelGet(LABEL_GENERIC_ALARM_02), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
				break;
		}
	}

	parametersChangedFlagReset(PARAM_ALARM);
	parametersChangedFlagReset(PARAM_REF_VISCOSITY);
	parametersChangedFlagReset(PARAM_OUT_VISCOSITY);
	
	
	_bres(m_woDisplayedWindow, WIN_MAIN);
	_bset(m_woDisplayedWindow, WIN_ALARM);
	_bres(m_woDisplayedWindow, WIN_MESSAGE);
	_bres(m_woDisplayedWindow, WIN_SETUP);
	_bres(m_woDisplayedWindow, WIN_MENUS);
	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
	_bres(m_woDisplayedWindow, WIN_6MESSAGES);
}


/*****************************************************************************/
void windowMainPrepareFormateValue(BYTE * a_strErrValue)
{
	WORD woValue;
	
	if (parametersGetValue(PARAM_MODE) == PARAM_MODE_OFF)
	{
		a_strErrValue[0] = ' ';
		woValue = 0x0000;
	}
	else if (parametersGetValue(PARAM_OUT_VISCOSITY) > parametersGetValue(PARAM_REF_VISCOSITY))
	{
		a_strErrValue[0] = '+';
		woValue = parametersGetValue(PARAM_OUT_VISCOSITY)-parametersGetValue(PARAM_REF_VISCOSITY);
	}
	else if (parametersGetValue(PARAM_OUT_VISCOSITY) < parametersGetValue(PARAM_REF_VISCOSITY))
	{
		a_strErrValue[0] = '-';
		woValue = parametersGetValue(PARAM_REF_VISCOSITY)-parametersGetValue(PARAM_OUT_VISCOSITY);
	}
	else
	{
		a_strErrValue[0] = ' ';
		woValue = 0x0000;
	}
	
	a_strErrValue[6] = 0x00;
	a_strErrValue[7] = 0x00;

	
	formatNumber(woValue, 6, 1, a_strErrValue+1);
	
	/*
	woValue = parametersGetValue(PARAM_OUT_VISCOSITY) - 0x8000;
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
	}*/
}

/*****************************************************************************/
void windowMain(void)
{
	double 	dblPercentValue;
	BYTE	byRulerTop;
	BYTE 	byCurrentSelectorX;
	BYTE	strString[8];

	byRulerTop = WINDOW_3_TOP+22;

	if (!_btst(m_woDisplayedWindow, WIN_MAIN)) //Not displayed
	{
		displayClearArea(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM);
		displaySetOutLine(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM, false);

		//Label
		displayWriteString(labelGet(LABEL_VISCOSITY), DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT+2, WINDOW_3_TOP+6);
		displayInvertArea(WINDOW_3_LEFT+1, WINDOW_3_TOP+1, WINDOW_3_RIGHT-2, WINDOW_3_TOP+6);
		
		//Lines Selector
		displayDrawHorizontalLine(byRulerTop + 1, WINDOW_3_LEFT + 6, WINDOW_3_WIDTH - 13);
		/* -1   */ displayDrawVerticalLine(WINDOW_3_LEFT + 5								, byRulerTop - 1, 6);	
		/*  0   */ displayDrawVerticalLine(WINDOW_3_LEFT + 5 + (WINDOW_3_WIDTH - 11) / 2	, byRulerTop - 1, 6);
		/*  1   */ displayDrawVerticalLine(WINDOW_3_LEFT + 5 + (WINDOW_3_WIDTH - 11)		, byRulerTop - 1, 6);
		/* -0.5 */ displayDrawVerticalLine(WINDOW_3_LEFT + 5 + (WINDOW_3_WIDTH - 11) / 4	, byRulerTop + 2, 1);
		/* +0.5 */ displayDrawVerticalLine(WINDOW_3_LEFT + 5 + (WINDOW_3_WIDTH - 11) * 3 / 4, byRulerTop + 2, 1);
		
		dblParamErrorZoom = (double) LOBYTE(parametersGetValue(PARAM_ERROR_ZOOM))/10;
	}
	
	
	
	//Draw Selector
	if (parametersIsChanged(PARAM_OUT_VISCOSITY) || parametersIsChanged(PARAM_REF_VISCOSITY) || (!_btst(m_woDisplayedWindow, WIN_MAIN)) )
	{
		//Selector has to be reprinted
		
		dblPercentValue = ((double) parametersGetValue(PARAM_OUT_VISCOSITY) - (double) parametersGetValue(PARAM_REF_VISCOSITY)) / 100.0;
		//dblPercentValue = ((double) parametersGetValue(PARAM_OUT_VISCOSITY)- (double) 0x8000) / 100.0;
		dblPercentValue = (dblPercentValue>dblParamErrorZoom?dblParamErrorZoom:dblPercentValue);
		dblPercentValue = (dblPercentValue<-dblParamErrorZoom?-dblParamErrorZoom:dblPercentValue);
		dblPercentValue = dblPercentValue  / dblParamErrorZoom;
		
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
		windowMainPrepareFormateValue(strString);
		displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+42, byRulerTop + 18);	
		
		parametersChangedFlagReset(PARAM_OUT_VISCOSITY);
		parametersChangedFlagReset(PARAM_REF_VISCOSITY);
	}
	
	if (parametersIsChanged(PARAM_VALVES) || (!_btst(m_woDisplayedWindow, WIN_MAIN)))
	{
		//displayDrawCorrection(WINDOW_3_LEFT, byRulerTop+3, WINDOW_3_WIDTH, LOBYTE(parametersGetValue(PARAM_CORRECTION)));
		displayDrawValveStatus(WINDOW_3_LEFT, byRulerTop+3);
		parametersChangedFlagReset(PARAM_VALVES);
	}
	
	
	
	//Draw Correction Leds
	/*if (parametersIsChanged(PARAM_CORRECTION))
	{
		displayDrawCorrection(WINDOW_3_LEFT, byRulerTop+3, WINDOW_3_WIDTH, LOBYTE(parametersGetValue(PARAM_CORRECTION)));
		parametersChangedFlagReset(PARAM_CORRECTION);
	}*/

	//Draw alarm out of bound
	/*if (parametersIsChanged(PARAM_ERR_BOUND_LONG))
	{
		if (parametersGetValue(PARAM_ERR_BOUND_LONG))
		{
			displayDrawAlarm(87, 45);
		}
		else
		{
			displayClearArea(87+2,45+7, 87+10, 45+14);
		}		
	}*/
	
	
	_bset(m_woDisplayedWindow, WIN_MAIN);
	_bres(m_woDisplayedWindow, WIN_ALARM);
	_bres(m_woDisplayedWindow, WIN_MESSAGE);
	_bres(m_woDisplayedWindow, WIN_SETUP);
	_bres(m_woDisplayedWindow, WIN_MENUS);
	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
	_bres(m_woDisplayedWindow, WIN_6MESSAGES);
}

/*****************************************************************************/
void window6Menu(BYTE * a_byGroup, BYTE * a_bySelected)
{
	if ( !  (	((*a_byGroup == MENU_GROUP_MENU) 		&& _btst(m_woDisplayedWindow, WIN_MENUS)) ||
				((*a_byGroup == MENU_GROUP_ARCHIVE) 	&& _btst(m_woDisplayedWindow, WIN_ARCHIVES)) ||
				((*a_byGroup == MENU_GROUP_CUP) 	&& _btst(m_woDisplayedWindow, WIN_CUP)) 
			))  // Is not only a refresh
	{
		displayClearArea(0,0,126,64);
		
		switch(*a_byGroup)
		{
			case MENU_GROUP_MENU:
				displayWriteString("1", 			DISPLAY_SELECT_FONT_10x14, 	2, 		17);
				displayWriteString("2", 			DISPLAY_NULL, 				2, 		39);
				displayWriteString("3", 			DISPLAY_NULL, 				2, 		61);
				displayWriteString("4", 			DISPLAY_NULL, 				67,		17);
				//displayWriteString("5", 			DISPLAY_NULL, 				67, 	39);
				//displayWriteString("6", 			DISPLAY_NULL, 				67, 	61);


				displayWriteString(labelGet(LABEL_CALIBRATION),						DISPLAY_SELECT_FONT_MINI, 				13, 	9);
				displayWriteString(labelGet(LABEL_SETUP), 								DISPLAY_NULL, 										13, 	31);
				//displayWriteString("", 		DISPLAY_NULL, 				13, 	40);
				displayWriteString(labelGet(LABEL_SW_VERSION_01), 				DISPLAY_NULL, 										13, 	52);
				displayWriteString(labelGet(LABEL_SW_VERSION_02), 				DISPLAY_NULL, 										13, 	61);
				displayWriteString(labelGet(LABEL_RESET_CALIBRATION_01), 	DISPLAY_NULL, 										78, 	9);
				displayWriteString(labelGet(LABEL_RESET_CALIBRATION_02), 	DISPLAY_NULL, 										78, 	18);
				
				
				
				windowForceRepaint();
				_bset(m_woDisplayedWindow, WIN_MENUS);
				break;
			case MENU_GROUP_ARCHIVE:
				displayWriteString("1", 			DISPLAY_SELECT_FONT_10x14, 	2, 		17);
				displayWriteString("2", 			DISPLAY_NULL, 				2, 		39);
				//displayWriteString("3", 			DISPLAY_NULL, 				2, 		61);
				//displayWriteString("4", 			DISPLAY_NULL, 				67,		17);
				//displayWriteString("5", 			DISPLAY_NULL, 				67, 	39);
				//displayWriteString("6", 			DISPLAY_NULL, 				67, 	61);

				displayWriteString(labelGet(LABEL_SAVE_JOB_01),				DISPLAY_SELECT_FONT_MINI, 	13, 	9);
				displayWriteString(labelGet(LABEL_SAVE_JOB_02), 			DISPLAY_NULL, 				13, 	18);
				displayWriteString(labelGet(LABEL_LOAD_JOB_01), 			DISPLAY_NULL, 				13, 	31);
				displayWriteString(labelGet(LABEL_LOAD_JOB_02), 			DISPLAY_NULL, 				13, 	40);
				windowForceRepaint();
				_bset(m_woDisplayedWindow, WIN_ARCHIVES);
				break;
			case MENU_GROUP_CUP:
				displayWriteString("1", 			DISPLAY_SELECT_FONT_10x14, 	2, 		17);
				displayWriteString("2", 			DISPLAY_NULL, 				2, 		39);
				//displayWriteString("3", 			DISPLAY_NULL, 				2, 		61);
				//displayWriteString("4", 			DISPLAY_NULL, 				67,		17);
				//displayWriteString("5", 			DISPLAY_NULL, 				67, 	39);
				//displayWriteString("6", 			DISPLAY_NULL, 				67, 	61);
			
				displayWriteString(labelGet(LABEL_CUP),								DISPLAY_SELECT_FONT_MINI, 	13, 	9);
				displayWriteString("Ford 4", 								DISPLAY_NULL, 				13, 	18);
				displayWriteString(labelGet(LABEL_CUP), 						  DISPLAY_NULL, 				13, 	31);
				displayWriteString("Zhan 2", 								DISPLAY_NULL, 				13, 	40);
				windowForceRepaint();
				_bset(m_woDisplayedWindow, WIN_CUP);
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
		if (true)//if (parametersGetValue(PARAM_VISUAL_SETUP_FULL))
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
		if(	parametersVisible(byParameterIndex + PARAMETER_SETUP_INITIAL_INDEX))
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
	
	_bres(m_woDisplayedWindow, WIN_TEMPERATURE);
	_bres(m_woDisplayedWindow, WIN_MODE);
	_bres(m_woDisplayedWindow, WIN_MAIN);
	_bres(m_woDisplayedWindow, WIN_ALARM);
	_bres(m_woDisplayedWindow, WIN_MESSAGE);
	_bres(m_woDisplayedWindow, WIN_VISCO_REF);
	_bres(m_woDisplayedWindow, WIN_VISCO_REAL);
	_bset(m_woDisplayedWindow, WIN_SETUP);
	_bres(m_woDisplayedWindow, WIN_MENUS);	
	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
	_bres(m_woDisplayedWindow, WIN_6MESSAGES);

	return bySelectedIndex;
}


/*****************************************************************************/
void window6Messages(void)
{
	BYTE strValue[10];
	WORD woValue;
	BYTE i=6;	
	
	if (!_btst(m_woDisplayedWindow, WIN_6MESSAGES)) //Not displayed
	{
		displayClearArea(0, 0, 126, 64);
		displaySetOutLine(0, 0, 126, 64, false);

		//Label
		displayWriteString(labelGet(LABEL_MESSAGE), DISPLAY_SELECT_FONT_MINI, 2, 6);
		displayInvertArea(1, 1, 124, 6);
	}
	

	if (parametersIsChanged(PARAM_VALVES) || (!_btst(m_woDisplayedWindow, WIN_6MESSAGES)))
	{	
		strValue[7] = 0x00;
		strValue[8] = 0x00;
		strValue[9] = 0x00;	
		while(i-->0)
		{
			formatNumber(measureGetHistoricalViscosityValue(i) , 7, 0, strValue);
			displayWriteString(strValue, DISPLAY_SELECT_FONT_5x7, 10, 15+(9*i));	

			formatNumber(measureGetHistoricalViscosityValue(i+6) , 7, 0, strValue);
			displayWriteString(strValue, DISPLAY_SELECT_FONT_5x7, 75, 15+(9*i));	
		}
		parametersChangedFlagReset(PARAM_VALVES);
	}
	
	_bres(m_woDisplayedWindow, WIN_TEMPERATURE);
	_bres(m_woDisplayedWindow, WIN_MODE);
	_bres(m_woDisplayedWindow, WIN_MAIN);
	_bres(m_woDisplayedWindow, WIN_ALARM);
	_bres(m_woDisplayedWindow, WIN_MESSAGE);
	_bres(m_woDisplayedWindow, WIN_VISCO_REF);
	_bres(m_woDisplayedWindow, WIN_VISCO_REAL);
	_bres(m_woDisplayedWindow, WIN_SETUP);
	_bres(m_woDisplayedWindow, WIN_MENUS);	
	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
	_bset(m_woDisplayedWindow, WIN_6MESSAGES);
}