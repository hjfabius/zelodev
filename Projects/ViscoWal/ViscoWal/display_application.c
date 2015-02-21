#include "common.h"

/*****************************************************************************/
// Variables declarationAc
/*****************************************************************************/
BYTE m_byNextPage;
BYTE m_bySelection;


static const unsigned char mc_displayPages[][] = {	
/* NONE=0          */ {NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* UNKNOWN_CODE=1  */ {NA, NA, NA, PAGE_MAIN, PAGE_MAIN, PAGE_MENU_01, PAGE_A1, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* MESSAGE=2       */ {NA, NA, NA, PAGE_MAIN, PAGE_MAIN, PAGE_MENU_01, PAGE_A1, PAGE_EXECUTE_OFF, PAGE_MAIN, PAGE_EXECUTE_MODE, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_ADD_SOLVENT, PAGE_MAIN, PAGE_WASHING, PAGE_MAIN}, 
/* ALARM=3         */ {NA, NA, NA, PAGE_MAIN, PAGE_MAIN, PAGE_MENU_01, PAGE_A1, PAGE_EXECUTE_OFF, PAGE_MAIN, PAGE_EXECUTE_MODE, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, NA, PAGE_WASHING, NA, PAGE_ADD_SOLVENT, PAGE_ADD_SOLVENT, NA, PAGE_WASHING, PAGE_MAIN}, 
/* MAIN=4          */ {NA, NA, NA, PAGE_MAIN, PAGE_MAIN, PAGE_MENU_01, PAGE_A1, PAGE_EXECUTE_OFF, PAGE_MAIN, PAGE_EXECUTE_MODE, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, NA, PAGE_WASHING, NA, PAGE_ADD_SOLVENT, PAGE_ADD_SOLVENT, NA, PAGE_WASHING, PAGE_MAIN}, 
/* SETUP=5         */ {NA, NA, NA, PAGE_SETUP, PAGE_MENU_02, PAGE_SETUP, PAGE_SETUP, NA, NA, NA, NA, PAGE_SETUP, PAGE_SETUP, PAGE_SETUP, PAGE_SETUP, PAGE_SETUP_FULL, NA, NA, NA, NA, NA, NA, NA}, 
/* MENU_01=6       */ {MENU6, MENU_GROUP_MENU, 1, PAGE_CALIBRATION, PAGE_MAIN, PAGE_MENU_02, PAGE_A1, NA, NA, NA, NA, NA, PAGE_MENU_02, NA, PAGE_MENU_02, PAGE_HISTORY_VALUE, NA, NA, NA, NA, NA, NA, NA}, 
/* MENU_02=7       */ {MENU6, MENU_GROUP_MENU, 2, PAGE_SETUP, PAGE_MAIN, PAGE_MENU_03, PAGE_A1, NA, NA, NA, NA, PAGE_MENU_01, PAGE_MENU_03, PAGE_MENU_01, PAGE_MENU_03, PAGE_SETUP_FULL, NA, NA, NA, NA, NA, NA, NA}, 
/* MENU_03=8       */ {MENU6, MENU_GROUP_MENU, 3, PAGE_EXECUTE_VERSION, PAGE_MAIN, PAGE_MENU_04, PAGE_A1, NA, NA, NA, NA, PAGE_MENU_02, PAGE_MENU_04, PAGE_MENU_02, PAGE_MENU_04, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* MENU_04=9       */ {MENU6, MENU_GROUP_MENU, 4, PAGE_EXECUTE_RESET_CALIBRATION, PAGE_MAIN, PAGE_MENU_01, PAGE_A1, NA, NA, NA, NA, PAGE_MENU_03, NA, PAGE_MENU_03, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* MENU_05=10      */ {MENU6, MENU_GROUP_MENU, 5, NA, NA, NA, PAGE_A1, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* MENU_06=11      */ {MENU6, MENU_GROUP_MENU, 6, NA, NA, NA, PAGE_A1, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* A1=12           */ {MENU6, MENU_GROUP_ARCHIVE, 1, PAGE_ARCHIVE_SAVE, PAGE_MAIN, PAGE_MENU_01, PAGE_A2, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* A2=13           */ {MENU6, MENU_GROUP_ARCHIVE, 2, PAGE_ARCHIVE_LOAD, PAGE_MAIN, PAGE_MENU_01, PAGE_A1, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* ARCHIVE_SAVE=14 */ {VALUE, NA, NA, PAGE_EXECUTE_SAVE, PAGE_A1, NA, NA, NA, NA, NA, NA, PAGE_ARCHIVE_SAVE, PAGE_ARCHIVE_SAVE, PAGE_ARCHIVE_SAVE, PAGE_ARCHIVE_SAVE, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* ARCHIVE_LOAD=15 */ {VALUE, NA, NA, PAGE_EXECUTE_LOAD, PAGE_A2, NA, NA, NA, NA, NA, NA, PAGE_ARCHIVE_LOAD, PAGE_ARCHIVE_LOAD, PAGE_ARCHIVE_LOAD, PAGE_ARCHIVE_LOAD, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* ADD_SOLVENT=16  */ {NA, NA, NA, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_ADD_SOLVENT, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN}, 
/* WASHING=17      */ {NA, NA, NA, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_MAIN, PAGE_WASHING, PAGE_MAIN}, 
/* CALIBRATION=18  */ {VALUE, NA, NA, PAGE_EXECUTE_CALIBRATION, PAGE_MENU_01, NA, NA, NA, NA, NA, NA, PAGE_CALIBRATION, PAGE_CALIBRATION, PAGE_CALIBRATION, PAGE_CALIBRATION, PAGE_CALIBRATION, NA, NA, NA, NA, NA, NA, NA}, 
/* HISTORY_VALUE=19*/ {NA, NA, NA, PAGE_MAIN, PAGE_MAIN, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* CUP_01=20       */ {MENU6, MENU_GROUP_CUP, 1, PAGE_EXECUTE_CUP_01, PAGE_MAIN, PAGE_CUP_02, PAGE_A1, NA, NA, NA, NA, NA, PAGE_CUP_02, NA, PAGE_CUP_02, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* CUP_02=21       */ {MENU6, MENU_GROUP_CUP, 2, PAGE_EXECUTE_CUP_02, PAGE_MAIN, PAGE_CUP_01, PAGE_A1, NA, NA, NA, NA, PAGE_CUP_01, NA, PAGE_CUP_01, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* SETUP_FULL=22   */ {NA, NA, NA, PAGE_SETUP, PAGE_MENU_02, PAGE_SETUP, PAGE_SETUP, NA, NA, NA, NA, PAGE_SETUP, PAGE_SETUP, PAGE_SETUP, PAGE_SETUP, PAGE_SETUP, NA, NA, NA, NA, NA, NA, NA}
	};



/*****************************************************************************/
// Functions declaration
/*****************************************************************************/
void displayAppNavigate(void);
void displayAppRefreshVisualization(void);
void displayAppCalibration(void);
void displayAppManageCorrection(void);

/*****************************************************************************/
void displayAppInit(void)
{
	BYTE j = 0x01;
	screenInit();
	
	screenBigStdMessage(SCREEN_STD_MSG_INIT_PARAM);
	
	measureInit();
	parametersInit(); 
	
}

/*****************************************************************************/
void displayAppRefreshVisualization(void)
{
	BYTE byPage;
	
	if(!displayIsKeyPressed())
	{
		byPage = parametersGetValue(PARAM_PAGE);
		screenUpdateCurrentScreen(); 
	}
}

/*****************************************************************************/
void displayAppNavigate(void)
{
	BYTE byKey;
	WORD woValue;
	WORD woValueOffset;
	
	byKey = displayGetKeyPressed();
	displayKeyPressedReset();	
	if (byKey != KEY_NULL)
	{		
		if ( 
			(parametersGetValue(PARAM_MODE)==PARAM_MODE_OFF) &&
			((parametersGetValue(PARAM_VALVES)==VALVES_WASH) ||
			(parametersGetValue(PARAM_VALVES)==VALVES_ADDSOLVENT)) &&
			(byKey != KEY_R_SOLVENT) && 
			(byKey != KEY_R_INK) && 
			(byKey != KEY_R_BOTH) 
		   )
		{
			measureSetValveStatus(VALVES_CLOSED);
			screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
			parametersSet(PARAM_ALARM, PARAM_ALARM_OK);
			sleepFix();
		}   
		else if ( 
			(parametersGetValue(PARAM_MODE)!=PARAM_MODE_OFF) &&
			(byKey != KEY_R_SOLVENT) && 
			(byKey != KEY_R_INK) && 
			(byKey != KEY_R_BOTH) 
		   )
		{
			measureSetValveStatus(VALVES_OPENED);
		}
	
	
		m_byNextPage =  mc_displayPages[parametersGetValue(PARAM_PAGE)][byKey+3];
	
		if ((mc_displayPages[m_byNextPage][0] == VALUE) || 
			(m_byNextPage == PAGE_EXECUTE_SAVE) ||
			(m_byNextPage == PAGE_EXECUTE_LOAD) ||
			(m_byNextPage == PAGE_EXECUTE_CUP_01) ||
			(m_byNextPage == PAGE_EXECUTE_CUP_02) ||
			(m_byNextPage == PAGE_EXECUTE_CALIBRATION) ||
			(m_byNextPage == PAGE_EXECUTE_RESET_CALIBRATION)
			) 
		{
			screenValue(/*Page*/&m_byNextPage, &byKey);
		}
		
		m_bySelection = mc_displayPages[m_byNextPage][2];
		if (mc_displayPages[m_byNextPage][0] == MENU6) //Type = Menu
		{

			screen6Menus(/*Page*/&m_byNextPage, /*Group*/&(mc_displayPages[m_byNextPage][1]), &m_bySelection);
			return;
		}
		
		switch (m_byNextPage)
		{
			case PAGE_EXECUTE_OFF:
				if (parametersGetValue(PARAM_MODE) != PARAM_MODE_OFF)
				{
					parametersSet(PARAM_MODE, PARAM_MODE_OFF);
					parametersSet(PARAM_ALARM, PARAM_ALARM_OK);
					measureSetValveStatus(VALVES_CLOSED);	
					//To force refresh
					parametersForceChangedFlag(PARAM_REF_VISCOSITY);
					parametersForceChangedFlag(PARAM_OUT_VISCOSITY);
					parametersForceChangedFlag(PARAM_OUT_TEMPERATURE);
					
					screenUpdateCurrentScreen();
				}
				else
				{
					screenBigStdMessage(SCREEN_STD_MSG_RESET);
					sleepFix();
					displayOff();
					parametersSet(PARAM_MODE, PARAM_MODE_MANUAL);
					displayInit();
					displayAppInit();
					sleepFix();
					screenMain();
					measureSetValveStatus(VALVES_OPENED);
				}
				
				break;
			case PAGE_MAIN:
				switch(byKey)
				{
					case KEY_ARROW_UP:
						parametersSet(PARAM_REF_VISCOSITY, parametersGetValue(PARAM_REF_VISCOSITY)+1);
						break;
					case KEY_ARROW_DOWN:
						parametersSet(PARAM_REF_VISCOSITY, parametersGetValue(PARAM_REF_VISCOSITY)-1);
						break;
					case KEY_ARROW_UP_F:
						parametersSet(PARAM_REF_VISCOSITY, parametersGetValue(PARAM_REF_VISCOSITY)+10);
						break;
					case KEY_ARROW_DOWN_F:
						parametersSet(PARAM_REF_VISCOSITY, parametersGetValue(PARAM_REF_VISCOSITY)-10);
						break;
				}
				screenMain();
				break;
			case PAGE_EXECUTE_MODE:
				switch(parametersGetValue(PARAM_MODE))
				{
					case PARAM_MODE_MANUAL:
						parametersSet(PARAM_MODE, PARAM_MODE_AUTO);
						break;
					case PARAM_MODE_AUTO:
						parametersSet(PARAM_MODE, PARAM_MODE_MANUAL);
						break;
					case PARAM_MODE_OFF:
						parametersSet(PARAM_MODE, PARAM_MODE_MANUAL);
						parametersForceChangedFlag(PARAM_REF_VISCOSITY);
						parametersForceChangedFlag(PARAM_OUT_VISCOSITY);
						parametersForceChangedFlag(PARAM_OUT_TEMPERATURE);	
						//Open Valves
						measureSetValveStatus(VALVES_OPENED);						
						break;
					case PARAM_MODE_PAUSE:
						parametersSet(PARAM_MODE, PARAM_MODE_AUTO);
						break;
				}
				screenUpdateCurrentScreen();
				break;
			case PAGE_EXECUTE_PAUSE:
				parametersSet(PARAM_MODE, PARAM_MODE_PAUSE);
				screenUpdateCurrentScreen();
				break;
			case PAGE_SETUP:
				//If not standby, go to manual
				if (parametersGetValue(PARAM_MODE) != PARAM_MODE_OFF)
				{
					parametersSet(PARAM_MODE, PARAM_MODE_MANUAL);
				}
				screenSetUpParameter(byKey, false);
				break;
			case PAGE_SETUP_FULL:
				//If not standby, go to manual
				if (parametersGetValue(PARAM_MODE) != PARAM_MODE_OFF)
				{
					parametersSet(PARAM_MODE, PARAM_MODE_MANUAL);
				}
				screenSetUpParameter(byKey, true);
				break;
			case PAGE_EXECUTE_VERSION:
				screenVersion();
				screenMain();				
				break;
			case PAGE_EXECUTE_CALIBRATION_2:
				measureViscosityCalibration();
				parametersSet(PARAM_OUT_VISCOSITY, parametersGetValue(PARAM_CALIBRATION_VALUE));
				screenMain();			
				break;
			case PAGE_WASHING:
				if (parametersGetValue(PARAM_PAGE) != PAGE_WASHING)
				{
					screenBigStdMessage(SCREEN_STD_MSG_CHECK_PUMP);
					//Open valves, check viscosity = 0 --> Pump is off
					measureSetValveStatus(VALVES_OPENED);
					sleepSec(1);
					measureSetValveStatus(VALVES_MEASURING);
					measureUpdateViscosity();
					
					//Error on measuring = Pump is off
					if(parametersGetValue(PARAM_ALARM) != PARAM_ALARM_MEASURING_VISCOSITY)
					{
						parametersSet(PARAM_ALARM, PARAM_ALARM_PUMP_ON);
						screenAlarm();
						measureSetValveStatus(VALVES_CLOSED);
						parametersSet(PARAM_MODE, PARAM_MODE_OFF);
					}
					else
					{
						screenBigStdMessage(SCREEN_STD_MSG_WASHING);					
						measureSetValveStatus(VALVES_WASH);
						parametersSet(PARAM_MODE, PARAM_MODE_OFF);
						parametersSet(PARAM_ALARM, PARAM_ALARM_OK);
						parametersSet(PARAM_PAGE, PAGE_WASHING);
					}
				}
				break;
			case PAGE_ADD_SOLVENT:
				if (parametersGetValue(PARAM_PAGE) != PAGE_ADD_SOLVENT)
				{
					measureSetValveStatus(VALVES_ADDSOLVENT);
					screenBigStdMessage(SCREEN_STD_MSG_ADDING_SOLVENT);
					parametersSet(PARAM_PAGE, PAGE_ADD_SOLVENT);
				}
				break;
			case PAGE_HISTORY_VALUE:
				screenHistoricalValues();
			default:
				break;
		}
	}
	else
	{
		screenUpdateCurrentScreen();		
	}
}

/*****************************************************************************/
void displayAppManageCorrection(void)
{
	LWORD  lwoTime;
	
	if (
		(parametersGetValue(PARAM_CALC_VISCOSITY)>parametersGetValue(PARAM_REF_VISCOSITY)) &&
		(parametersGetValue(PARAM_MODE) == PARAM_MODE_AUTO)
	   )
	{
		lwoTime = (LWORD)(
							(
								(double) parametersGetValue(PARAM_CALC_VISCOSITY)-
								(double) parametersGetValue(PARAM_REF_VISCOSITY)
							) * 
							((double) parametersGetValue(PARAM_VISCOSITY_GAIN) *10.0)
						 );

		if (lwoTime > ((LWORD) 10 * (LWORD) parametersGetValue(PARAM_VISCOSITY_DEAD_ZONE) ))
		{
			if (parametersGetValue(PARAM_MAX_CORRECTION) != 0x0000)
			{
				lwoTime = MIN(lwoTime, (LWORD) 20 * (LWORD) parametersGetValue(PARAM_MAX_CORRECTION));
			}
			
			measureSetValveStatus(VALVES_ADDSOLVENT);
			screenUpdateCurrentScreen();
			while(
					(lwoTime-->0) &&
					(!displayIsKeyPressed())
			     )
			{
				Nop();
			}
			measureSetValveStatus(VALVES_OPENED);
			screenUpdateCurrentScreen();
		}
	}
}


/*****************************************************************************/
void displayAppLoop(void)
{
	BYTE byDifferentMeasure;	
	LWORD lwoTimeout;
	screenMain();
	if (parametersGetValue(PARAM_MODE)!=PARAM_MODE_OFF)
	{
		measureSetValveStatus(VALVES_OPENED);
	}
	byDifferentMeasure = 1;
	while(1)
	{
		//crifab 2009-10-01: Adjusted intermeasure time
		//lwoTimeout = (0x00000800 * (LWORD)parametersGetValue(PARAM_INTERMEASURE)) / byDifferentMeasure;
		lwoTimeout = (0x0000073A * (LWORD)parametersGetValue(PARAM_INTERMEASURE)) / byDifferentMeasure;
		while(lwoTimeout-->0)
		{
			displayAppNavigate();
		}
		if(
				(parametersGetValue(PARAM_PAGE) == PAGE_MAIN) || 
				(parametersGetValue(PARAM_PAGE) == PAGE_HISTORY_VALUE)
			)
		{
			if  (parametersGetValue(PARAM_VALVES) == VALVES_OPENED)
				//((parametersGetValue(PARAM_MODE) != PARAM_MODE_OFF) && 
				//(parametersGetValue(PARAM_VALVES) == VALVES_OPENED))
			{
				measureSetValveStatus(VALVES_MEASURING);
				displayAppNavigate();
				measureSetValveStatus(VALVES_OPENED);
				measureUpdateTemperature();
				if (parametersGetValue(PARAM_ALARM) == PARAM_ALARM_OK)
				{
					measureUpdateViscosity();
				}
				byDifferentMeasure = measureCalculation();
				displayAppManageCorrection();
			}		
		}
	}
}