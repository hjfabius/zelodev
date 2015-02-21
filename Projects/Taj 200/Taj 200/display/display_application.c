#include "common.h"


/*****************************************************************************/
// Variables declaration
/*****************************************************************************/
BYTE m_byCode;
BYTE m_byAdditionalCode;
WORD m_woValue;

BYTE m_byNextPage;
BYTE m_byManualShiftActiveLong;
BYTE m_byManualShiftActiveTrans;
BYTE m_byManualShiftActivePull;

BYTE m_byPageWaitingAnswer;
BYTE m_byPageAnswerReceived;

static const unsigned char mc_displayPages[][] = {	
/* NONE=0          */ {NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* UNKNOWN_CODE=1  */ {NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, PAGE_REGISTER, PAGE_REGISTER, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_MENU_01, PAGE_T1, PAGE_OFF, PAGE_MODE_LONG, PAGE_MODE_LAT, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* MESSAGE=2       */ {NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, PAGE_REGISTER, PAGE_REGISTER, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_MENU_01, PAGE_T1, PAGE_OFF, PAGE_MODE_LONG, PAGE_MODE_LAT, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* ALARM=3         */ {NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, PAGE_REGISTER, PAGE_REGISTER, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_MENU_01, PAGE_T1, PAGE_OFF, PAGE_MODE_LONG, PAGE_MODE_LAT, NA, NA, NA, NA, PAGE_COR_MINUS, PAGE_COR_PLUS, PAGE_COR_LEFT, PAGE_COR_RIGHT, NA, NA, NA, NA, NA}, 
/* REGISTER=4      */ {NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_MENU_01, PAGE_T1, PAGE_OFF, PAGE_MODE_LONG, PAGE_MODE_LAT, NA, NA, NA, NA, PAGE_COR_MINUS, PAGE_COR_PLUS, PAGE_COR_LEFT, PAGE_COR_RIGHT, NA, NA, NA, NA, NA}, 
/* OSCILLOSCOPE=5  */ {NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, PAGE_REGISTER, PAGE_REGISTER, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_MENU_01, PAGE_T1, PAGE_OFF, PAGE_MODE_LONG, PAGE_MODE_LAT, PAGE_GAIN_UP, PAGE_GAIN_DOWN, NA, NA, PAGE_COR_MINUS, PAGE_COR_PLUS, PAGE_COR_LEFT, PAGE_COR_RIGHT, PAGE_GATE_LEFT, PAGE_GATE_RIGHT, PAGE_ZOOM_IN, PAGE_ZOOM_OUT, NA}, 
/* PHASE_OSCILL=6  */ {NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, PAGE_EXECUTE_F3, PAGE_REGISTER, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_MENU_01, PAGE_T1, PAGE_OFF, NA, NA, PAGE_GAIN_UP, PAGE_GAIN_DOWN, NA, NA, NA, NA, NA, NA, PAGE_GATE_RIGHT, PAGE_GATE_LEFT, PAGE_ZOOM_IN, PAGE_ZOOM_OUT, NA}, 
/* PHASE_FAST=7    */ {NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, PAGE_REGISTER, PAGE_REGISTER, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_MENU_01, PAGE_T1, PAGE_OFF, NA, NA, PAGE_GAIN_UP, PAGE_GAIN_DOWN, NA, NA, NA, NA, NA, NA, PAGE_GATE_LEFT, PAGE_GATE_RIGHT, PAGE_ZOOM_IN, PAGE_ZOOM_OUT, NA}, 
/* F1=8            */ {MENU6, MENU_GROUP_FUNCTION, 1, NA, PAGE_EXECUTE_F1, NA, PAGE_PHASE_OSCILL, PAGE_EXECUTE_F4, PAGE_EXECUTE_F5, PAGE_PHASE_FAST, NA, NA, NA, PAGE_EXECUTE_F1, PAGE_REGISTER, PAGE_F3, PAGE_P1, PAGE_SETUP, PAGE_MENU_01, PAGE_T1, PAGE_OFF, NA, NA, NA, PAGE_F3, NA, PAGE_F4, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* F3=9            */ {MENU6, MENU_GROUP_FUNCTION, 3, NA, PAGE_EXECUTE_F1, NA, PAGE_PHASE_OSCILL, PAGE_EXECUTE_F4, PAGE_EXECUTE_F5, PAGE_PHASE_FAST, NA, NA, NA, PAGE_PHASE_OSCILL, PAGE_REGISTER, PAGE_F4, PAGE_P1, PAGE_SETUP, PAGE_MENU_01, PAGE_T1, PAGE_OFF, NA, NA, PAGE_F1, PAGE_F4, NA, PAGE_F6, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* F4=10           */ {MENU6, MENU_GROUP_FUNCTION, 4, NA, PAGE_EXECUTE_F1, NA, PAGE_PHASE_OSCILL, PAGE_EXECUTE_F4, PAGE_EXECUTE_F5, PAGE_PHASE_FAST, NA, NA, NA, PAGE_EXECUTE_F4, PAGE_REGISTER, PAGE_F5, PAGE_P1, PAGE_SETUP, PAGE_MENU_01, PAGE_T1, PAGE_OFF, NA, NA, PAGE_F3, PAGE_F5, PAGE_F1, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* F5=11           */ {MENU6, MENU_GROUP_FUNCTION, 5, NA, PAGE_EXECUTE_F1, NA, PAGE_PHASE_OSCILL, PAGE_EXECUTE_F4, PAGE_EXECUTE_F5, PAGE_PHASE_FAST, NA, NA, NA, PAGE_EXECUTE_F5, PAGE_REGISTER, PAGE_F6, PAGE_P1, PAGE_SETUP, PAGE_MENU_01, PAGE_T1, PAGE_OFF, NA, NA, PAGE_F4, PAGE_F6, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* F6=12           */ {MENU6, MENU_GROUP_FUNCTION, 6, NA, PAGE_EXECUTE_F1, NA, PAGE_PHASE_OSCILL, PAGE_EXECUTE_F4, PAGE_EXECUTE_F5, PAGE_PHASE_FAST, NA, NA, NA, PAGE_PHASE_FAST, PAGE_REGISTER, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_MENU_01, PAGE_T1, PAGE_OFF, NA, NA, PAGE_F5, NA, PAGE_F3, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* P1=13           */ {MENU6, MENU_GROUP_PARAMETER, 1, NA, PAGE_P1_VALUE, PAGE_P2_VALUE, PAGE_P3_VALUE, PAGE_P4_VALUE, PAGE_P5_VALUE, PAGE_P6_VALUE, NA, NA, NA, PAGE_P1_VALUE, PAGE_REGISTER, PAGE_F1, PAGE_P2, PAGE_SETUP, PAGE_MENU_01, PAGE_T1, PAGE_OFF, NA, NA, NA, PAGE_P2, NA, PAGE_P4, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* P2=14           */ {MENU6, MENU_GROUP_PARAMETER, 2, NA, PAGE_P1_VALUE, PAGE_P2_VALUE, PAGE_P3_VALUE, PAGE_P4_VALUE, PAGE_P5_VALUE, PAGE_P6_VALUE, NA, NA, NA, PAGE_P2_VALUE, PAGE_REGISTER, PAGE_F1, PAGE_P3, PAGE_SETUP, PAGE_MENU_01, PAGE_T1, PAGE_OFF, NA, NA, PAGE_P1, PAGE_P3, NA, PAGE_P5, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* P3=15           */ {MENU6, MENU_GROUP_PARAMETER, 3, NA, PAGE_P1_VALUE, PAGE_P2_VALUE, PAGE_P3_VALUE, PAGE_P4_VALUE, PAGE_P5_VALUE, PAGE_P6_VALUE, NA, NA, NA, PAGE_P3_VALUE, PAGE_REGISTER, PAGE_F1, PAGE_P4, PAGE_SETUP, PAGE_MENU_01, PAGE_T1, PAGE_OFF, NA, NA, PAGE_P2, PAGE_P4, NA, PAGE_P6, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* P4=16           */ {MENU6, MENU_GROUP_PARAMETER, 4, NA, PAGE_P1_VALUE, PAGE_P2_VALUE, PAGE_P3_VALUE, PAGE_P4_VALUE, PAGE_P5_VALUE, PAGE_P6_VALUE, NA, NA, NA, PAGE_P4_VALUE, PAGE_REGISTER, PAGE_F1, PAGE_P5, PAGE_SETUP, PAGE_MENU_01, PAGE_T1, PAGE_OFF, NA, NA, PAGE_P3, PAGE_P5, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* P5=17           */ {MENU6, MENU_GROUP_PARAMETER, 5, NA, PAGE_P1_VALUE, PAGE_P2_VALUE, PAGE_P3_VALUE, PAGE_P4_VALUE, PAGE_P5_VALUE, PAGE_P6_VALUE, NA, NA, NA, PAGE_P5_VALUE, PAGE_REGISTER, PAGE_F1, PAGE_P6, PAGE_SETUP, PAGE_MENU_01, PAGE_T1, PAGE_OFF, NA, NA, PAGE_P4, PAGE_P6, PAGE_P1, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* P6=18           */ {MENU6, MENU_GROUP_PARAMETER, 6, NA, PAGE_P1_VALUE, PAGE_P2_VALUE, PAGE_P3_VALUE, PAGE_P4_VALUE, PAGE_P5_VALUE, PAGE_P6_VALUE, NA, NA, NA, PAGE_P6_VALUE, PAGE_REGISTER, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_MENU_01, PAGE_T1, PAGE_OFF, NA, NA, PAGE_P5, NA, PAGE_P2, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* T1=19           */ {MENU6, MENU_GROUP_TEST, 1, NA, PAGE_EXECUTE_T1, PAGE_EXECUTE_T2, PAGE_EXECUTE_T3, NA, NA, NA, NA, NA, NA, PAGE_EXECUTE_T1, PAGE_REGISTER, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_MENU_01, PAGE_T2, PAGE_OFF, NA, NA, NA, PAGE_T2, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* T2=20           */ {MENU6, MENU_GROUP_TEST, 2, NA, PAGE_EXECUTE_T1, PAGE_EXECUTE_T2, PAGE_EXECUTE_T3, NA, NA, NA, NA, NA, NA, PAGE_EXECUTE_T2, PAGE_REGISTER, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_MENU_01, PAGE_T3, PAGE_OFF, NA, NA, PAGE_T1, PAGE_T3, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* T3=21           */ {MENU6, MENU_GROUP_TEST, 3, NA, PAGE_EXECUTE_T1, PAGE_EXECUTE_T2, PAGE_EXECUTE_T3, NA, NA, NA, NA, NA, NA, PAGE_EXECUTE_T3, PAGE_REGISTER, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_MENU_01, PAGE_T1, PAGE_OFF, NA, NA, PAGE_T2, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* T4=22           */ {MENU6, MENU_GROUP_TEST, 4, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, PAGE_EXECUTE_T4, PAGE_REGISTER, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_MENU_01, NA, PAGE_OFF, NA, NA, PAGE_T4, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* T5=23           */ {MENU6, MENU_GROUP_TEST, 5, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, PAGE_EXECUTE_T5, PAGE_REGISTER, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_MENU_01, NA, PAGE_OFF, NA, NA, PAGE_T5, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* T6=24           */ {MENU6, MENU_GROUP_TEST, 6, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, PAGE_EXECUTE_T6, PAGE_REGISTER, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_MENU_01, NA, PAGE_OFF, NA, NA, PAGE_T6, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* SETUP=25        */ {NA, NA, NA, PAGE_SETUP, PAGE_SETUP, PAGE_SETUP, PAGE_SETUP, PAGE_SETUP, PAGE_SETUP, PAGE_SETUP, PAGE_SETUP, PAGE_SETUP, PAGE_SETUP, PAGE_SETUP, PAGE_SETUP, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_MENU_01, PAGE_T1, PAGE_OFF, NA, NA, PAGE_SETUP, PAGE_SETUP, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* MENU_01=26      */ {MENU6, MENU_GROUP_MENU, 1, NA, PAGE_REGISTER, PAGE_OSCILLOSCOPE, PAGE_A1, PAGE_TWIN_APP_00, PAGE_ENCODER_00, PAGE_SH_PN_00, NA, NA, NA, PAGE_REGISTER, PAGE_REGISTER, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_MENU_02, PAGE_T1, PAGE_OFF, NA, NA, NA, PAGE_MENU_02, NA, PAGE_MENU_04, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* MENU_02=27      */ {MENU6, MENU_GROUP_MENU, 2, NA, PAGE_REGISTER, PAGE_OSCILLOSCOPE, PAGE_A1, PAGE_TWIN_APP_00, PAGE_ENCODER_00, PAGE_SH_PN_00, NA, NA, NA, PAGE_OSCILLOSCOPE, PAGE_REGISTER, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_MENU_03, PAGE_T1, PAGE_OFF, NA, NA, PAGE_MENU_01, PAGE_MENU_03, NA, PAGE_MENU_05, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* MENU_03=28      */ {MENU6, MENU_GROUP_MENU, 3, NA, PAGE_REGISTER, PAGE_OSCILLOSCOPE, PAGE_A1, PAGE_TWIN_APP_00, PAGE_ENCODER_00, PAGE_SH_PN_00, NA, NA, NA, PAGE_A1, PAGE_REGISTER, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_MENU_04, PAGE_T1, PAGE_OFF, NA, NA, PAGE_MENU_02, PAGE_MENU_04, NA, PAGE_MENU_06, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* MENU_04=29      */ {MENU6, MENU_GROUP_MENU, 4, NA, PAGE_REGISTER, PAGE_OSCILLOSCOPE, PAGE_A1, PAGE_TWIN_APP_00, PAGE_ENCODER_00, PAGE_SH_PN_00, NA, NA, NA, PAGE_TWIN_APP_00, PAGE_REGISTER, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_MENU_05, PAGE_T1, PAGE_OFF, NA, NA, PAGE_MENU_03, PAGE_MENU_05, PAGE_MENU_01, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* MENU_05=30      */ {MENU6, MENU_GROUP_MENU, 5, NA, PAGE_REGISTER, PAGE_OSCILLOSCOPE, PAGE_A1, PAGE_TWIN_APP_00, PAGE_ENCODER_00, PAGE_SH_PN_00, NA, NA, NA, PAGE_ENCODER_00, PAGE_REGISTER, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_MENU_06, PAGE_T1, PAGE_OFF, NA, NA, PAGE_MENU_04, PAGE_MENU_06, PAGE_MENU_02, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* MENU_06=31      */ {MENU6, MENU_GROUP_MENU, 6, NA, PAGE_REGISTER, PAGE_OSCILLOSCOPE, PAGE_A1, PAGE_TWIN_APP_00, PAGE_ENCODER_00, PAGE_SH_PN_00, NA, NA, NA, PAGE_SH_PN_00, PAGE_REGISTER, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_MENU_01, PAGE_T1, PAGE_OFF, NA, NA, PAGE_MENU_05, NA, PAGE_MENU_03, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* P1_VALUE=32     */ {VALUE, NA, 1, PAGE_P1_VALUE, PAGE_P1_VALUE, PAGE_P1_VALUE, PAGE_P1_VALUE, PAGE_P1_VALUE, PAGE_P1_VALUE, PAGE_P1_VALUE, PAGE_P1_VALUE, PAGE_P1_VALUE, PAGE_P1_VALUE, PAGE_SAVE, PAGE_P1, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* P2_VALUE=33     */ {VALUE, NA, 2, PAGE_P2_VALUE, PAGE_P2_VALUE, PAGE_P2_VALUE, PAGE_P2_VALUE, PAGE_P2_VALUE, PAGE_P2_VALUE, PAGE_P2_VALUE, PAGE_P2_VALUE, PAGE_P2_VALUE, PAGE_P2_VALUE, PAGE_SAVE, PAGE_P2, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* P3_VALUE=34     */ {VALUE, NA, 3, PAGE_P3_VALUE, PAGE_P3_VALUE, PAGE_P3_VALUE, PAGE_P3_VALUE, PAGE_P3_VALUE, PAGE_P3_VALUE, PAGE_P3_VALUE, PAGE_P3_VALUE, PAGE_P3_VALUE, PAGE_P3_VALUE, PAGE_SAVE, PAGE_P3, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* P4_VALUE=35     */ {NA, NA, 4, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, PAGE_P4, PAGE_P4, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_MENU_01, PAGE_T1, PAGE_OFF, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* P5_VALUE=36     */ {VALUE, NA, 5, PAGE_P5_VALUE, PAGE_P5_VALUE, PAGE_P5_VALUE, PAGE_P5_VALUE, PAGE_P5_VALUE, PAGE_P5_VALUE, PAGE_P5_VALUE, PAGE_P5_VALUE, PAGE_P5_VALUE, PAGE_P5_VALUE, PAGE_SAVE, PAGE_P5, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* P6_VALUE=37     */ {VALUE, NA, 6, PAGE_P6_VALUE, PAGE_P6_VALUE, PAGE_P6_VALUE, PAGE_P6_VALUE, PAGE_P6_VALUE, PAGE_P6_VALUE, PAGE_P6_VALUE, PAGE_P6_VALUE, PAGE_P6_VALUE, PAGE_P6_VALUE, PAGE_SAVE, PAGE_P6, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* COR_MINUS=38    */ {VALUE, NA, NA, PAGE_COR_MINUS, PAGE_COR_MINUS, PAGE_COR_MINUS, PAGE_COR_MINUS, PAGE_COR_MINUS, PAGE_COR_MINUS, PAGE_COR_MINUS, PAGE_COR_MINUS, PAGE_COR_MINUS, PAGE_COR_MINUS, PAGE_SAVE, PAGE_REGISTER, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, PAGE_COR_PLUS, PAGE_COR_LEFT, PAGE_COR_RIGHT, NA, NA, NA, NA, NA}, 
/* COR_PLUS=39     */ {VALUE, NA, NA, PAGE_COR_PLUS, PAGE_COR_PLUS, PAGE_COR_PLUS, PAGE_COR_PLUS, PAGE_COR_PLUS, PAGE_COR_PLUS, PAGE_COR_PLUS, PAGE_COR_PLUS, PAGE_COR_PLUS, PAGE_COR_PLUS, PAGE_SAVE, PAGE_REGISTER, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, PAGE_COR_MINUS, NA, PAGE_COR_LEFT, PAGE_COR_RIGHT, NA, NA, NA, NA, NA}, 
/* COR_LEFT=40     */ {VALUE, NA, NA, PAGE_COR_LEFT, PAGE_COR_LEFT, PAGE_COR_LEFT, PAGE_COR_LEFT, PAGE_COR_LEFT, PAGE_COR_LEFT, PAGE_COR_LEFT, PAGE_COR_LEFT, PAGE_COR_LEFT, PAGE_COR_LEFT, PAGE_SAVE, PAGE_REGISTER, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, PAGE_COR_MINUS, PAGE_COR_PLUS, NA, PAGE_COR_RIGHT, NA, NA, NA, NA, NA}, 
/* COR_RIGHT=41    */ {VALUE, NA, NA, PAGE_COR_RIGHT, PAGE_COR_RIGHT, PAGE_COR_RIGHT, PAGE_COR_RIGHT, PAGE_COR_RIGHT, PAGE_COR_RIGHT, PAGE_COR_RIGHT, PAGE_COR_RIGHT, PAGE_COR_RIGHT, PAGE_COR_RIGHT, PAGE_SAVE, PAGE_REGISTER, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, PAGE_COR_MINUS, PAGE_COR_PLUS, PAGE_COR_LEFT, NA, NA, NA, NA, NA, NA}, 
/* A1=42           */ {MENU6, MENU_GROUP_ARCHIVE, 1, NA, PAGE_ARCHIVE_SAVE, PAGE_ARCHIVE_LOAD, NA, NA, NA, NA, NA, NA, NA, PAGE_ARCHIVE_SAVE, PAGE_MENU_03, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_A2, PAGE_T1, PAGE_OFF, NA, NA, NA, PAGE_ARCHIVE_LOAD, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* A2=43           */ {MENU6, MENU_GROUP_ARCHIVE, 2, NA, PAGE_ARCHIVE_SAVE, PAGE_ARCHIVE_LOAD, NA, NA, NA, NA, NA, NA, NA, PAGE_ARCHIVE_LOAD, PAGE_MENU_03, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_A1, PAGE_T1, PAGE_OFF, NA, NA, PAGE_ARCHIVE_SAVE, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* ARCHIVE_SAVE=44 */ {VALUE, NA, NA, PAGE_ARCHIVE_SAVE, PAGE_ARCHIVE_SAVE, PAGE_ARCHIVE_SAVE, PAGE_ARCHIVE_SAVE, PAGE_ARCHIVE_SAVE, PAGE_ARCHIVE_SAVE, PAGE_ARCHIVE_SAVE, PAGE_ARCHIVE_SAVE, PAGE_ARCHIVE_SAVE, PAGE_ARCHIVE_SAVE, PAGE_SAVE, PAGE_A1, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* ARCHIVE_LOAD=45 */ {VALUE, NA, NA, PAGE_ARCHIVE_LOAD, PAGE_ARCHIVE_LOAD, PAGE_ARCHIVE_LOAD, PAGE_ARCHIVE_LOAD, PAGE_ARCHIVE_LOAD, PAGE_ARCHIVE_LOAD, PAGE_ARCHIVE_LOAD, PAGE_ARCHIVE_LOAD, PAGE_ARCHIVE_LOAD, PAGE_ARCHIVE_LOAD, PAGE_SAVE, PAGE_A2, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* TWIN_APP_01=46  */ {MENU6, MENU_GROUP_APP, 1, NA, PAGE_EXECUTE_APP_01, PAGE_EXECUTE_APP_02, NA, NA, NA, NA, NA, NA, NA, PAGE_EXECUTE_APP_01, PAGE_MENU_04, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_TWIN_APP_02, PAGE_T1, PAGE_OFF, NA, NA, NA, PAGE_TWIN_APP_02, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* TWIN_APP_02=47  */ {MENU6, MENU_GROUP_APP, 2, NA, PAGE_EXECUTE_APP_01, PAGE_EXECUTE_APP_02, NA, NA, NA, NA, NA, NA, NA, PAGE_EXECUTE_APP_02, PAGE_MENU_04, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_TWIN_APP_01, PAGE_T1, PAGE_OFF, NA, NA, PAGE_TWIN_APP_01, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* ENCODER_01=48   */ {MENU6, MENU_GROUP_ENC, 1, NA, PAGE_EXECUTE_ENC_01, PAGE_EXECUTE_ENC_02, NA, NA, NA, NA, NA, NA, NA, PAGE_EXECUTE_ENC_01, PAGE_MENU_05, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_ENCODER_02, PAGE_T1, PAGE_OFF, NA, NA, NA, PAGE_ENCODER_02, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* ENCODER_02=49   */ {MENU6, MENU_GROUP_ENC, 2, NA, PAGE_EXECUTE_ENC_01, PAGE_EXECUTE_ENC_02, NA, NA, NA, NA, NA, NA, NA, PAGE_EXECUTE_ENC_02, PAGE_MENU_05, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_ENCODER_01, PAGE_T1, PAGE_OFF, NA, NA, PAGE_ENCODER_01, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* SH_PN_01=50     */ {MENU6, MENU_GROUP_SH_PN, 1, NA, PAGE_EXECUTE_SH_PN_01, PAGE_EXECUTE_SH_PN_02, NA, NA, NA, NA, NA, NA, NA, PAGE_EXECUTE_SH_PN_01, PAGE_MENU_06, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_SH_PN_02, PAGE_T1, PAGE_OFF, NA, NA, NA, PAGE_SH_PN_02, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
/* SH_PN_02=51     */ {MENU6, MENU_GROUP_SH_PN, 2, NA, PAGE_EXECUTE_SH_PN_01, PAGE_EXECUTE_SH_PN_02, NA, NA, NA, NA, NA, NA, NA, PAGE_EXECUTE_SH_PN_02, PAGE_MENU_06, PAGE_F1, PAGE_P1, PAGE_SETUP, PAGE_SH_PN_01, PAGE_T1, PAGE_OFF, NA, NA, PAGE_SH_PN_01, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
	};


/*****************************************************************************/
// Functions declaration
/*****************************************************************************/
//void displayAppManageAnswer(void);
//WORD displayAppWaitForAnswer(void);
void displayAppRequestCom(void);
void displayAppNavigate(void);
void displayAppManageParameter(void);
void displayAppUpdateMode(BYTE byLongitudinal);
void displayAppRefreshVisualization(void);
void displayAppManageCorrection(void);

/*****************************************************************************/
void displayAppInit(void)
{
	BYTE j = 0x01;
	screenInit();
	
	screenBigStdMessage(SCREEN_STD_MSG_INIT_PARAM);
	
	m_byPageWaitingAnswer = PAGE_NONE;
	m_byPageAnswerReceived = false;
	m_byManualShiftActiveLong = false;
	m_byManualShiftActiveTrans = false;
	m_byManualShiftActivePull = false;
		
	parametersInit(); 
	SNI_Init();
	
	STI_SendMessage(STI_FUNZ_INIT_PARAM, 0x00, 0x0000);
	
	STI_SendMessage(STI_FUNZ_STOP_REFERENCE_MAN, 0x00, 0x0000);

}

/*****************************************************************************/
void displayAppUpdateMode(BYTE byLongitudinal)
{
	if ((parametersGetValue(PARAM_PAGE) != PAGE_REGISTER) && 
		(parametersGetValue(PARAM_PAGE) != PAGE_ALARM)  &&
		(parametersGetValue(PARAM_PAGE) != PAGE_OSCILLOSCOPE)  
	   )
	{
		return;
	}
	
	if (byLongitudinal)
	{
		if (parametersGetValue(PARAM_MODE_LONG)==PARAM_MODE_AUTO)
		{
			parametersSet(PARAM_MODE_LONG, PARAM_MODE_MANUAL);
			parametersSet(PARAM_MODE_PULL, PARAM_MODE_MANUAL);
			parametersSet(PARAM_CORRECTION, 0x0000);	
			//parametersSet(PARAM_ALARM, 0x0000);
			parametersSet(PARAM_ERR_BOUND_LONG, false);			
			m_byManualShiftActiveLong = false;
			m_byManualShiftActivePull = false;
			STI_SendMessage(STI_FUNZ_WRITE_PARAM, STI_PARAM_MODE_LONG, PARAM_MODE_MANUAL);
			STI_SendMessage(STI_FUNZ_WRITE_PARAM, STI_PARAM_MODE_PULL, PARAM_MODE_MANUAL);
		}
		else 
		{
			parametersSet(PARAM_MODE_LONG, PARAM_MODE_AUTO);
			STI_SendMessage(STI_FUNZ_WRITE_PARAM, STI_PARAM_MODE_LONG, PARAM_MODE_AUTO);
		}
	}
	else
	{
		if (parametersGetValue(PARAM_TRANS_ENABLE)==0x0000)
		{
			if (parametersGetValue(PARAM_MODE_TRANS)==PARAM_MODE_AUTO)
			{
				parametersSet(PARAM_MODE_TRANS, PARAM_MODE_MANUAL);
				parametersSet(PARAM_CORRECTION, 0x0000);
				m_byManualShiftActiveTrans = false;
				STI_SendMessage(STI_FUNZ_WRITE_PARAM, STI_PARAM_MODE_TRANS, PARAM_MODE_MANUAL);
			}
			else 
			{
				parametersSet(PARAM_MODE_TRANS, PARAM_MODE_AUTO);
				STI_SendMessage(STI_FUNZ_WRITE_PARAM, STI_PARAM_MODE_TRANS, PARAM_MODE_AUTO);
			}			
		}
		else if (parametersGetValue(PARAM_PULL_ENABLE)==0x0000)
		{
			if (parametersGetValue(PARAM_MODE_PULL)==PARAM_MODE_AUTO)
			{
				parametersSet(PARAM_MODE_PULL, PARAM_MODE_MANUAL);
				parametersSet(PARAM_CORRECTION, 0x0000);
				m_byManualShiftActivePull = false;
				STI_SendMessage(STI_FUNZ_WRITE_PARAM, STI_PARAM_MODE_PULL, PARAM_MODE_MANUAL);
			}
			else 
			{
				if (parametersGetValue(PARAM_MODE_LONG)==PARAM_MODE_AUTO)
				{
					parametersSet(PARAM_MODE_PULL, PARAM_MODE_AUTO);
					STI_SendMessage(STI_FUNZ_WRITE_PARAM, STI_PARAM_MODE_PULL, PARAM_MODE_AUTO);
				}
			}			
		}
	}
}


/*****************************************************************************/
void displayAppRefreshVisualization(void)
{
	BYTE byPage;
	
	if(!displayIsKeyPressed())
	{
		byPage = parametersGetValue(PARAM_PAGE);
		
		if (((byPage == PAGE_PHASE_FAST) || 
			(byPage == PAGE_OSCILLOSCOPE) || 
			(byPage == PAGE_PHASE_OSCILL)) 
			// && (!parametersIsChanged(PARAM_CORRECTION)) ;autorefresh
		   )
		{
			scanningHeadSignalAcquire();
			if (parametersGetValue(PARAM_PULL_DAC_ENABLE) == 0x0000)
			{
				parametersSet(PARAM_BASE_VALUE_DAC, STI_GetMessage(STI_PARAM_BASE_VALUE_DAC));
			}
		}
		
		screenUpdateCurrentScreen(); 
	}
}


/*****************************************************************************/
void  displayAppShowMessages(void)
{
	BYTE strString[16];

	if (_btst(_Pa_DDASK, _Pin_DDASK))
	{
		STI_ReceiveMessage(&m_byCode, &m_byAdditionalCode, &m_woValue);
		
		if(m_byCode==0xC4)
		{
			strString[15] = 0x00;
			memcpy(strString, "Status  = ", 9); 
			formatNumber(m_woValue, 5, 0, strString+9);
			displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 0, 40);
		}
		else 
		{
			switch(m_byAdditionalCode)
			{
				case 0x1C:
					strString[15] = 0x00;
					memcpy(strString, "Led    = ", 9); 
					formatNumber(m_woValue, 5, 0, strString+9);
					displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 0, 10);
					break;
				case 0x20:
					strString[15] = 0x00;
					memcpy(strString, "Speed  = ", 9); 
					formatNumber(m_woValue, 5, 0, strString+9);
					displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 0, 20);
					break;
				case 0x1A:
					strString[15] = 0x00;
					memcpy(strString, "Error =+", 9); 
					formatNumber(m_woValue, 5, 0, strString+9);
					displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 0, 30);
					break;
				case 0x1B:
					strString[15] = 0x00;
					memcpy(strString, "Error  =-", 9); 
					formatNumber(m_woValue, 5, 0, strString+9);
					displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 0, 30);
					break;
			}
		}
	}
}

/*****************************************************************************/
void  displayAppRequestCom(void)
{
	while (_btst(_Pa_DDASK, _Pin_DDASK))
	{
		STI_ReceiveMessage(&m_byCode, &m_byAdditionalCode, &m_woValue);
		displayAppManageParameter();
	}			
}

/*****************************************************************************/
void displayAppManageAnswer(void)
{	
	WORD woAnswer;
	
	//if (displayIsKeyPressed()) return;
	
	if((m_byPageWaitingAnswer != PAGE_NONE) && m_byPageAnswerReceived)
	{
		woAnswer = parametersGetValue(PARAM_ALARM);
		parametersSet(PARAM_MODE_LONG, STI_GetMessage(STI_PARAM_MODE_LONG));
		parametersSet(PARAM_MODE_TRANS, STI_GetMessage(STI_PARAM_MODE_TRANS));
		parametersSet(PARAM_MODE_PULL, STI_GetMessage(STI_PARAM_MODE_PULL));
		switch(m_byPageWaitingAnswer)
		{
			case PAGE_EXECUTE_F4:
				if (!_btst(woAnswer, STI_ANSWER_ALARM_ERR_PHASE_AUTO) && 
				    (!_btst(woAnswer, STI_ANSWER_ALARM_ERR_NO_PRINT)) &&
					(!_btst(woAnswer, STI_ANSWER_ALARM_ERR_DOUBLE_MARK)) 
					)
				{
					screenBigStdMessage(SCREEN_STD_MSG_PHASE_OK);
					sleepFix();
					screenRegister();
				}
				else
				{
					screenAlarm();
				}
				break;
			case PAGE_PHASE_FAST:
				screenBigStdMessage(SCREEN_STD_MSG_PHASE_OK);
				sleepFix();
				screenRegister();
				break;
			case PAGE_EXECUTE_T1:
				if (!_btst(woAnswer, STI_ANSWER_ALARM_ERR_TEST_SH))
				{
					screenBigStdMessage(SCREEN_STD_MSG_TEST_OK);
					sleepFix();
					screenRegister();
				}
				else
				{
					screenAlarm();
				}
				break;
			case PAGE_EXECUTE_T2:
				if (!_btst(woAnswer, STI_ANSWER_ALARM_ERR_TEST_ENC))
				{
					screenBigStdMessage(SCREEN_STD_MSG_TEST_OK);
					sleepFix();
					screenRegister();
				}
				else
				{
					screenAlarm();					
				}
				break;
			case PAGE_EXECUTE_T3:
				screenBigStdMessage(SCREEN_STD_MSG_TEST_OK);
				sleepFix();
				screenRegister();
				SNI_ResetData();
				break;
		}			
		m_byPageWaitingAnswer = PAGE_NONE;
		m_byPageAnswerReceived = false;
	}
}


/*****************************************************************************/
void displayAppManageParameter(void)
{
	switch(m_byCode)
	{
		case STI_ANSWER:
			if (m_byPageWaitingAnswer != PAGE_NONE)
			{
				m_byPageAnswerReceived = true;
			}
			parametersSet(PARAM_ALARM, (m_woValue & STI_ANSWER_ALARMS));	
			break;
		case STI_FUNZ_READ_PARAM:
			switch(m_byAdditionalCode)
			{
				case STI_PARAM_SPEED:
					parametersSet(PARAM_SPEED, m_woValue);
					break;
				case STI_PARAM_CORRECTIONS:
					parametersSet(PARAM_CORRECTION, m_woValue);
					break; 
				case STI_PARAM_ERROR_A:
					parametersSet(PARAM_ERR_LONG, 0x8000 + m_woValue);
					parametersSet(PARAM_ERR_BOUND_LONG, ((m_woValue>=parametersGetValue(PARAM_ALARM_BOUND)&& (parametersGetValue(PARAM_MODE_LONG)==PARAM_MODE_AUTO) && (parametersGetValue(PARAM_ALARM_BOUND) >0)) ));
					break;
				case STI_PARAM_ERROR_R:
					parametersSet(PARAM_ERR_LONG, 0x8000 - m_woValue);
					parametersSet(PARAM_ERR_BOUND_LONG, ((m_woValue>=parametersGetValue(PARAM_ALARM_BOUND)&& (parametersGetValue(PARAM_MODE_LONG)==PARAM_MODE_AUTO) && (parametersGetValue(PARAM_ALARM_BOUND) >0)) ));
					break;
				case STI_PARAM_BASE_VALUE_DAC:
					parametersSet(PARAM_BASE_VALUE_DAC, m_woValue);
					_switch(_Pa_Led_D3, _Pin_Led_D3);		
					break;
				/*
				case STI_PARAM_ERROR_T:
					parametersSet(PARAM_ERR_TRANS, 0x8000 + m_woValue);
					//parametersSet(PARAM_ALARM_OUT_OF_BOUND, ((m_woValue>=parametersGetValue(PARAM_ALARM_BOUND)&& (parametersGetValue(PARAM_MODE_TRANS)==PARAM_MODE_AUTO)) ));
					break;
				case STI_PARAM_ERROR_O:
					parametersSet(PARAM_ERR_TRANS, 0x8000 - m_woValue);
					//parametersSet(PARAM_ALARM_OUT_OF_BOUND, ((m_woValue>=parametersGetValue(PARAM_ALARM_BOUND)&& (parametersGetValue(PARAM_MODE_TRANS)==PARAM_MODE_AUTO)) ));
					break;*/
				default:
					break;
			}		
			break;
		case STI_FUNZ_INIT_Z80:
			parametersLoadAll(false);
			break;
		default:
		
		
			//screenBigStdMessage(SCREEN_STD_MSG_UNKNOWN_CODE);
			//sleepFix();
			//screenReceivedCode(m_byCode, m_byAdditionalCode, m_woValue);
			//sleepFix();
			//screenUpdateCurrentScreen();
			break;
	}
}


/*****************************************************************************/
void displayAppManageCorrection(void)
{
	if (m_byManualShiftActiveLong)
	{
		m_byManualShiftActiveLong = false;
		STI_SendMessage(STI_FUNZ_STOP_REFERENCE_MAN, 0x00, 0x0000);
		m_byNextPage = PAGE_NONE;
	} 
	else if ((m_byNextPage == PAGE_COR_MINUS) && (parametersGetValue(PARAM_MODE_LONG)==PARAM_MODE_MANUAL))
	{
		STI_SendMessage(STI_FUNZ_SHIFT_REFERENCE_MAN, STI_DIRECTION_R, 0x0000);
		m_byManualShiftActiveLong = true;
		m_byNextPage = PAGE_NONE;
	}
	else if ((m_byNextPage == PAGE_COR_PLUS) && (parametersGetValue(PARAM_MODE_LONG)==PARAM_MODE_MANUAL))
	{
		STI_SendMessage(STI_FUNZ_SHIFT_REFERENCE_MAN, STI_DIRECTION_A, 0x0000);
		m_byManualShiftActiveLong = true;
		m_byNextPage = PAGE_NONE;
	}
	else if (parametersGetValue(PARAM_TRANS_ENABLE)==0x0000)
	{
		if ((m_byNextPage == PAGE_COR_LEFT) && (parametersGetValue(PARAM_MODE_TRANS)==PARAM_MODE_MANUAL))
		{
			STI_SendMessage(STI_FUNZ_SHIFT_REFERENCE_MAN, STI_DIRECTION_O, 0x0000);
			m_byManualShiftActiveLong = true;
			m_byNextPage = PAGE_NONE;
		}
		else if ((m_byNextPage == PAGE_COR_RIGHT) && (parametersGetValue(PARAM_MODE_TRANS)==PARAM_MODE_MANUAL))
		{
			STI_SendMessage(STI_FUNZ_SHIFT_REFERENCE_MAN, STI_DIRECTION_T, 0x0000);
			m_byManualShiftActiveLong = true;
			m_byNextPage = PAGE_NONE;
		}
	}
	else if (parametersGetValue(PARAM_PULL_ENABLE)==0x0000)
	{
		if ((m_byNextPage == PAGE_COR_LEFT) && (parametersGetValue(PARAM_MODE_PULL)==PARAM_MODE_MANUAL))
		{
			STI_SendMessage(STI_FUNZ_SHIFT_REFERENCE_MAN, STI_DIRECTION_O, 0x0000);
			m_byManualShiftActiveLong = true;
			m_byNextPage = PAGE_NONE;
		}
		else if ((m_byNextPage == PAGE_COR_RIGHT) && (parametersGetValue(PARAM_MODE_PULL)==PARAM_MODE_MANUAL))
		{
			STI_SendMessage(STI_FUNZ_SHIFT_REFERENCE_MAN, STI_DIRECTION_T, 0x0000);
			m_byManualShiftActiveLong = true;
			m_byNextPage = PAGE_NONE;
		}
		else if ((m_byNextPage == PAGE_COR_LEFT) && (parametersGetValue(PARAM_MODE_PULL)==PARAM_MODE_AUTO))
		{
			m_byNextPage = PAGE_NONE;
		}
		else if ((m_byNextPage == PAGE_COR_RIGHT) && (parametersGetValue(PARAM_MODE_PULL)==PARAM_MODE_AUTO))
		{
			m_byNextPage = PAGE_NONE;
		}				
	}
	else
	{
		if ((m_byNextPage == PAGE_COR_LEFT) || (m_byNextPage == PAGE_COR_RIGHT))
		{
			m_byNextPage = PAGE_NONE;
		}
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
		m_byNextPage =  mc_displayPages[parametersGetValue(PARAM_PAGE)][byKey+3];
	}
	else
	{
		m_byNextPage = SNI_ReceivedCmd();
		if (m_byNextPage == PAGE_NONE)
		{
			return;
		}
	}
	
	

	if(m_byNextPage != parametersGetValue(PARAM_PAGE))
	{
		sleep(500);
	}

	displayAppManageCorrection();

	if ((parametersGetValue(PARAM_COLD_SEAL_ENABLE) 	!= 0x00) && (PAGE_F6 == m_byNextPage))	
		{m_byNextPage = PAGE_F1;}
	else if (((parametersGetValue(PARAM_TWIN_APPLICATION_01) == 0x00) || (parametersGetValue(PARAM_TWIN_APPLICATION_02) == 0x00)) && (PAGE_MENU_04 == m_byNextPage)) 
		{m_byNextPage = PAGE_MENU_01;}
	else if (((parametersGetValue(PARAM_TWIN_APPLICATION_01) == 0x00) || (parametersGetValue(PARAM_TWIN_APPLICATION_02) == 0x00)) && (PAGE_TWIN_APP_01 == m_byNextPage)) 
		{m_byNextPage = PAGE_MENU_01;}
	else if (((parametersGetValue(PARAM_TWIN_APPLICATION_01) == 0x00) || (parametersGetValue(PARAM_TWIN_APPLICATION_02) == 0x00)) && (PAGE_TWIN_APP_02 == m_byNextPage)) 
		{m_byNextPage = PAGE_MENU_01;}
	else if ((parametersGetValue(PARAM_TWIN_ENCODER_ENABLE) != 0x00) && (PAGE_MENU_05  == m_byNextPage))  
		{m_byNextPage = PAGE_MENU_01;}
	else if ((parametersGetValue(PARAM_TWIN_ENCODER_ENABLE) != 0x00) && (PAGE_ENCODER_01 == m_byNextPage)) 
		{m_byNextPage = PAGE_MENU_01;}
	else if ((parametersGetValue(PARAM_TWIN_ENCODER_ENABLE) != 0x00) && (PAGE_ENCODER_02 == m_byNextPage)) 
		{m_byNextPage = PAGE_MENU_01;}
	else if ((parametersGetValue(PARAM_TWIN_ENCODER_ENABLE) == 0x00) && (PAGE_ENCODER_00 == m_byNextPage)) 
		{
			if(parametersGetValue(PARAM_CURRENT_ENCODER) == 0x0000)
		  {
				m_byNextPage = PAGE_ENCODER_01;
			}
			else
		  {
				m_byNextPage = PAGE_ENCODER_02;
			}
		}
	else if ((parametersGetValue(PARAM_TWIN_ENCODER_ENABLE) == 0x00) && (PAGE_TWIN_APP_00 == m_byNextPage)) 
		{
			if(parametersGetValue(PARAM_TWIN_CURRENT_APPLICATION) == parametersGetValue(PARAM_TWIN_APPLICATION_02))
		  {
				m_byNextPage = PAGE_TWIN_APP_02;
			}
			else
		  {
				m_byNextPage = PAGE_TWIN_APP_01;
			}
		}
	else if ((parametersGetValue(PARAM_SH_PN_ENABLE) 		!= 0x00) && (PAGE_MENU_06  == m_byNextPage))  
		{m_byNextPage = PAGE_MENU_01;}
	else if ((parametersGetValue(PARAM_SH_PN_ENABLE) 		!= 0x00) && (PAGE_SH_PN_01 == m_byNextPage))  
		{m_byNextPage = PAGE_MENU_01;}
	else if ((parametersGetValue(PARAM_SH_PN_ENABLE) 		!= 0x00) && (PAGE_SH_PN_02 == m_byNextPage))  
		{m_byNextPage = PAGE_MENU_01;}
	else if ((parametersGetValue(PARAM_SH_PN_ENABLE) 		== 0x00) && (PAGE_SH_PN_00 == m_byNextPage))  
		{
			if(parametersGetValue(PARAM_SH_PN) == 0x0000)
		  {
				m_byNextPage = PAGE_SH_PN_01;
			}
			else
		  {
				m_byNextPage = PAGE_SH_PN_02;
			}
		}
	else if ((parametersGetValue(PARAM_LONG_DAC_ENABLE) != 0x00)     && 
		 (parametersGetValue(PARAM_TRANS_DAC_ENABLE) != 0x00)    && 
		 (parametersGetValue(PARAM_PULL_DAC_ENABLE) != 0x00)     && 
		 (PAGE_P5 == m_byNextPage))  
		{m_byNextPage = PAGE_P1;}


	if ((mc_displayPages[m_byNextPage][0] == VALUE) || (m_byNextPage == PAGE_SAVE)) 
	{
		screenValue(/*Page*/&m_byNextPage, &byKey);
	}

	if (mc_displayPages[m_byNextPage][0] == MENU6) //Type = Menu
	{
		screen6Menus(/*Page*/&m_byNextPage, /*Group*/&(mc_displayPages[m_byNextPage][1]), /*Selection*/&(mc_displayPages[m_byNextPage][2]));
		return;
	}
	
	switch (m_byNextPage)
	{
		case PAGE_GAIN_UP:
			parametersSet(PARAM_SH_GAIN, STI_GetMessage(STI_PARAM_SH_GAIN));
			woValue = parametersGetValue(PARAM_SH_GAIN);
			switch(woValue)
			{
				case 0x0000:
					break;
				case 0x0020:
					parametersSet(PARAM_SH_GAIN, 0x0000);
					screenUpdateCurrentScreen();
					break;
				case 0x0040:
					parametersSet(PARAM_SH_GAIN, 0x0020);
					screenUpdateCurrentScreen();
					break;
				case 0x0060:
					parametersSet(PARAM_SH_GAIN, 0x0040);
					screenUpdateCurrentScreen();
					break;
			}
			break;
		case PAGE_GAIN_DOWN:
			parametersSet(PARAM_SH_GAIN, STI_GetMessage(STI_PARAM_SH_GAIN));
			woValue = parametersGetValue(PARAM_SH_GAIN);
			switch(woValue)
			{
				case 0x0000:
					parametersSet(PARAM_SH_GAIN, 0x0020);
					screenUpdateCurrentScreen();
					break;
				case 0x0020:
					parametersSet(PARAM_SH_GAIN, 0x0040);
					screenUpdateCurrentScreen();
					break;
				case 0x0040:
					parametersSet(PARAM_SH_GAIN, 0x0060);
					screenUpdateCurrentScreen();
					break;
				case 0x0060:
					break;
			}		
			break;
		case PAGE_ZOOM_IN:
			if (parametersGetValue(PARAM_OSCIL_ZOOM)>1)
			{
				woValue = parametersGetValue(PARAM_OSCIL_ZOOM)/2;
				parametersSet(PARAM_OSCIL_ZOOM,  woValue);
				woValueOffset = 32;
				while(woValue > 0x0000)
				{
					woValueOffset *= 2; 
					woValue = woValue>>1;
				}
				
				woValue = (parametersGetValue(PARAM_OSCIL_OFFSET) + woValueOffset)&(ENCODER_PULSES-1)&(ENCODER_PULSES-1);
				parametersSet(PARAM_OSCIL_OFFSET, woValue);

				screenUpdateCurrentScreen();
			}
			break;
		case PAGE_ZOOM_OUT:
			if (parametersGetValue(PARAM_OSCIL_ZOOM)<16)  
			{
				woValue = parametersGetValue(PARAM_OSCIL_ZOOM)*2;
				parametersSet(PARAM_OSCIL_ZOOM,  woValue);
				woValueOffset = 16;
				while(woValue > 0x0000)
				{
					woValueOffset *= 2; 
					woValue = woValue>>1;
				}
				
				woValue = (ENCODER_PULSES+parametersGetValue(PARAM_OSCIL_OFFSET) - woValueOffset)&(ENCODER_PULSES-1);
				parametersSet(PARAM_OSCIL_OFFSET, woValue);

				screenUpdateCurrentScreen();
			}
			break;
		case PAGE_GATE_LEFT:
			woValue = (parametersGetValue(PARAM_OSCIL_OFFSET)+4*parametersGetValue(PARAM_OSCIL_ZOOM))&(ENCODER_PULSES-1);
			parametersSet(PARAM_OSCIL_OFFSET, woValue);
			
			woValue = (parametersGetValue(PARAM_OSCIL_MANUAL_OFFSET)+4*parametersGetValue(PARAM_OSCIL_ZOOM))&(ENCODER_PULSES-1);
			parametersSet(PARAM_OSCIL_MANUAL_OFFSET, woValue);

			screenUpdateCurrentScreen();
			break;
		case PAGE_GATE_RIGHT:
			woValue = (ENCODER_PULSES+parametersGetValue(PARAM_OSCIL_OFFSET)-4*parametersGetValue(PARAM_OSCIL_ZOOM))&(ENCODER_PULSES-1);
			parametersSet(PARAM_OSCIL_OFFSET, woValue);

			woValue = (ENCODER_PULSES+parametersGetValue(PARAM_OSCIL_MANUAL_OFFSET)-4*parametersGetValue(PARAM_OSCIL_ZOOM))&(ENCODER_PULSES-1);
			parametersSet(PARAM_OSCIL_MANUAL_OFFSET, woValue);

			screenUpdateCurrentScreen();
			break;
		case PAGE_OFF:
			if (!parametersGetValue(PARAM_OFF))
			{
				woValue = 1000;
				while((displayGetKeyPressed() != KEY_RELEASED) && (woValue>0))
				{
					woValue = MIN(woValue-1, woValue);
					sleep(50);
				}
				if(woValue==0) //If full setup, go to manual
				{				
					parametersSet(PARAM_MODE_LONG, PARAM_MODE_MANUAL);
					parametersSet(PARAM_MODE_TRANS, PARAM_MODE_MANUAL);
					parametersSet(PARAM_MODE_PULL, PARAM_MODE_MANUAL);
	
					STI_SendMessage(STI_FUNZ_WRITE_PARAM, STI_PARAM_MODE_LONG, PARAM_MODE_MANUAL);
					STI_SendMessage(STI_FUNZ_WRITE_PARAM, STI_PARAM_MODE_TRANS, PARAM_MODE_MANUAL);
					STI_SendMessage(STI_FUNZ_WRITE_PARAM, STI_PARAM_MODE_PULL, PARAM_MODE_MANUAL);
					STI_SendMessage(STI_FUNZ_RESET, 0x00,0x0000);
					displayOff();
				}
			}
			else
			{
				displayOff();
				displayInit();
				displayAppInit();
				sleepSec(1);
				screenRegister();
			}
			
			break;
		case PAGE_REGISTER:
			m_byPageWaitingAnswer = PAGE_NONE;
			screenRegister();
			break;
		case PAGE_OSCILLOSCOPE:
			screenBigStdMessage(SCREEN_STD_MSG_VISUAL_OSCILLOSCOPE);
			parametersSet(PARAM_SPEED, STI_GetMessage(STI_PARAM_SPEED));
			if (parametersGetValue(PARAM_SPEED)==0x0000)
			{
				sleepFix();
				screenBigStdMessage(SCREEN_STD_MSG_SPEED_ZERO);
				sleepFix();
				m_byPageWaitingAnswer = PAGE_NONE;
				screenRegister();
			}
			else
			{			
				//sleepFix();	//To avoid any bounce in Release			
				scanningHeadSignalAcquireGate();
				scanningHeadSignalAcquire();
				m_byManualShiftActiveLong = false;
				screenOscilloscope(PAGE_OSCILLOSCOPE);
			}
			break;
		case PAGE_PHASE_OSCILL:
			screenBigStdMessage(SCREEN_STD_MSG_PHASE_OSCIL);
			parametersSet(PARAM_SPEED, STI_GetMessage(STI_PARAM_SPEED));
			if (parametersGetValue(PARAM_SPEED)==0x0000)
			{
				sleepFix();
				screenBigStdMessage(SCREEN_STD_MSG_SPEED_ZERO);
				sleepFix();
				m_byPageWaitingAnswer = PAGE_NONE;
				screenRegister();
			}
			else
			{				
				//sleepFix();	//To avoid any bounce in Release
				parametersSet(PARAM_SH_GAIN, 0x0000);	//Set maximum gain
				STI_SendMessage(STI_FUNZ_WRITE_PARAM, STI_PARAM_SH_GAIN, 0x0000);
				scanningHeadSignalAcquireGate();
				scanningHeadSignalAcquire();
				m_byManualShiftActiveLong = false;
				parametersSet(PARAM_OSCIL_MANUAL_OFFSET, 0x0000);
				screenOscilloscope(PAGE_PHASE_OSCILL);
			}
			break;			
		case PAGE_PHASE_FAST:
			if (parametersGetValue(PARAM_COLD_SEAL_ENABLE) == 0x00)
			{
				screenBigStdMessage(SCREEN_STD_MSG_PHASE_FAST);
				parametersSet(PARAM_SPEED, STI_GetMessage(STI_PARAM_SPEED));
				if (parametersGetValue(PARAM_SPEED)==0x0000)
				{
					sleepFix();
					screenBigStdMessage(SCREEN_STD_MSG_SPEED_ZERO);
					sleepFix();
					m_byPageWaitingAnswer = PAGE_NONE;
					screenRegister();
				}
				else
				{
					m_byPageWaitingAnswer = PAGE_PHASE_FAST;
					m_byPageAnswerReceived = false;
					STI_SendMessage(STI_FUNZ_PHASE_FAST, 0x00, 0x0000);
					//sleepFix();	//To avoid any bounce in Release
					scanningHeadSignalAcquireGate();
					scanningHeadSignalAcquire();
					parametersSet(PARAM_MODE_LONG, STI_GetMessage(STI_PARAM_MODE_LONG));
					parametersSet(PARAM_MODE_TRANS, STI_GetMessage(STI_PARAM_MODE_TRANS));
					parametersSet(PARAM_MODE_PULL, STI_GetMessage(STI_PARAM_MODE_PULL));
					//parametersSet(PARAM_CORRECTION, STI_GetMessage(STI_PARAM_CORRECTIONS));
					//parametersSet(PARAM_ALARM, STI_GetMessage(STI_PARAM_ALARM_STATUS));					
					m_byManualShiftActiveLong = false;
					parametersSet(PARAM_OSCIL_MANUAL_OFFSET, 0x0000);
					screenOscilloscope(PAGE_PHASE_FAST);
				}
			}
			break;
		case PAGE_MODE_LONG:
			displayAppUpdateMode(true);
			parametersSet(PARAM_ALARM, (STI_GetMessage(STI_PARAM_ALARM_STATUS) & STI_ANSWER_ALARMS));
			screenUpdateCurrentScreen();
			break;
		case PAGE_MODE_LAT:
			displayAppUpdateMode(false);
			parametersSet(PARAM_ALARM, (STI_GetMessage(STI_PARAM_ALARM_STATUS) & STI_ANSWER_ALARMS));
			screenUpdateCurrentScreen();
			break;
		case PAGE_SETUP:
			if(parametersGetValue(PARAM_PAGE) != PAGE_SETUP)
			{
				woValue = 3000;
				while((displayGetKeyPressed() != KEY_RELEASED) && (woValue>0))
				{
					woValue = MIN(woValue-1, woValue);
					sleep(50);
				}
				if(woValue==0) //If full setup, go to manual
				{
					parametersSet(PARAM_MODE_LONG, PARAM_MODE_MANUAL);
					parametersSet(PARAM_MODE_TRANS, PARAM_MODE_MANUAL);
					parametersSet(PARAM_MODE_PULL, PARAM_MODE_MANUAL);

					STI_SendMessage(STI_FUNZ_WRITE_PARAM, STI_PARAM_MODE_LONG, PARAM_MODE_MANUAL);
					STI_SendMessage(STI_FUNZ_WRITE_PARAM, STI_PARAM_MODE_TRANS, PARAM_MODE_MANUAL);
					STI_SendMessage(STI_FUNZ_WRITE_PARAM, STI_PARAM_MODE_PULL, PARAM_MODE_MANUAL);
				}
			}
			screenSetUpParameter(byKey, (woValue==0));
			if((byKey == KEY_OK) && (parametersGetValue(PARAM_PAGE_SEL) == PARAM_SNI_TIMER-PARAMETER_SETUP_INITIAL_INDEX))
			{
				SNI_Init();
			}
			break;
		case PAGE_EXECUTE_F1:
			screenBigStdMessage(SCREEN_STD_MSG_RESET_ERROR);
			STI_SendMessage(STI_FUNZ_GATE_CENTER, 0x00, 0x0000);
			sleepFix();
			parametersSet(PARAM_ERR_LONG, 0x8000);		//reset the error
			parametersSet(PARAM_MODE_TRANS, 0x8000);	//reset the error
			parametersSet(PARAM_MODE_LONG, STI_GetMessage(STI_PARAM_MODE_LONG));
			parametersSet(PARAM_MODE_TRANS, STI_GetMessage(STI_PARAM_MODE_TRANS));
			parametersSet(PARAM_MODE_PULL, STI_GetMessage(STI_PARAM_MODE_PULL));
			parametersSet(PARAM_CORRECTION, STI_GetMessage(STI_PARAM_CORRECTIONS));
			parametersSet(PARAM_ALARM, (STI_GetMessage(STI_PARAM_ALARM_STATUS) & STI_ANSWER_ALARMS));
			m_byManualShiftActiveLong = false;
			m_byPageWaitingAnswer = PAGE_NONE;
			screenRegister();
			break;
		case PAGE_EXECUTE_F3:
			screenBigStdMessage(SCREEN_STD_MSG_PHASE_OK);
			woValueOffset = STI_GetMessage(STI_PARAM_PHASE_START);
			woValueOffset += ((ENCODER_PULSES + parametersGetValue(PARAM_OSCIL_MANUAL_OFFSET) - 8) *4);
			woValueOffset = woValueOffset & ((ENCODER_PULSES*4) -1);
			STI_SendMessage(STI_FUNZ_WRITE_PARAM, STI_PARAM_PHASE_START, woValueOffset);
			sleepFix();
			parametersSet(PARAM_MODE_LONG, STI_GetMessage(STI_PARAM_MODE_LONG));
			parametersSet(PARAM_MODE_TRANS, STI_GetMessage(STI_PARAM_MODE_TRANS));
			parametersSet(PARAM_MODE_PULL, STI_GetMessage(STI_PARAM_MODE_PULL));
			parametersSet(PARAM_CORRECTION, STI_GetMessage(STI_PARAM_CORRECTIONS));
			parametersSet(PARAM_MODE_LONG, PARAM_MODE_MANUAL);
			parametersSet(PARAM_MODE_TRANS, PARAM_MODE_MANUAL);
			parametersSet(PARAM_MODE_PULL, PARAM_MODE_MANUAL);			
			parametersSet(PARAM_ALARM, (STI_GetMessage(STI_PARAM_ALARM_STATUS) & STI_ANSWER_ALARMS));
			m_byPageWaitingAnswer = PAGE_NONE;
			screenRegister();
			break;				
		case PAGE_EXECUTE_F4:
			screenBigStdMessage(SCREEN_STD_MSG_PHASE_AUTO);
			parametersSet(PARAM_SPEED, STI_GetMessage(STI_PARAM_SPEED));
			if (parametersGetValue(PARAM_SPEED)==0x0000)
			{
				sleepFix();
				screenBigStdMessage(SCREEN_STD_MSG_SPEED_ZERO);
				sleepFix();
				m_byPageWaitingAnswer = PAGE_NONE;
				screenRegister();
			}
			else
			{
				parametersSet(PARAM_ERR_LONG, 0x8000);		//reset the error
				parametersSet(PARAM_MODE_TRANS, 0x8000);	//reset the error
				parametersSet(PARAM_MODE_LONG, STI_GetMessage(STI_PARAM_MODE_LONG));
				parametersSet(PARAM_MODE_TRANS, STI_GetMessage(STI_PARAM_MODE_TRANS));
				parametersSet(PARAM_MODE_PULL, STI_GetMessage(STI_PARAM_MODE_PULL));
				parametersSet(PARAM_CORRECTION, STI_GetMessage(STI_PARAM_CORRECTIONS));				
				parametersSet(PARAM_MODE_LONG, PARAM_MODE_MANUAL);
				parametersSet(PARAM_MODE_TRANS, PARAM_MODE_MANUAL);
				parametersSet(PARAM_MODE_PULL, PARAM_MODE_MANUAL);
				parametersSet(PARAM_CORRECTION, 0x0000);
				
				m_byPageWaitingAnswer = PAGE_EXECUTE_F4;
				m_byPageAnswerReceived = false;
				m_byManualShiftActiveLong = false;
				STI_SendMessage(STI_FUNZ_PHASE_AUTO, 0x00, 0x0000);
			}
			break;
		case PAGE_EXECUTE_F5:
			screenBigStdMessage(SCREEN_STD_MSG_PHASE_MAN);
			parametersSet(PARAM_SPEED, STI_GetMessage(STI_PARAM_SPEED));
			if (parametersGetValue(PARAM_SPEED)>0x0000)
			{
				sleepFix();
				screenBigStdMessage(SCREEN_STD_MSG_PHASE_MAN_ERR);
				sleepFix();
				m_byPageWaitingAnswer = PAGE_NONE;
				screenRegister();
			}
			else
			{
				STI_SendMessage(STI_FUNZ_PHASE_MANUAL, 0x00, 0x0000);
				sleepFix();
				screenBigStdMessage(SCREEN_STD_MSG_PHASE_OK);
				STI_SendMessage(STI_FUNZ_GATE_CENTER, 0x00, 0x0000);
				sleepFix();
				parametersSet(PARAM_MODE_LONG, STI_GetMessage(STI_PARAM_MODE_LONG));
				parametersSet(PARAM_MODE_TRANS, STI_GetMessage(STI_PARAM_MODE_TRANS));
				parametersSet(PARAM_MODE_PULL, STI_GetMessage(STI_PARAM_MODE_PULL));
				parametersSet(PARAM_CORRECTION, STI_GetMessage(STI_PARAM_CORRECTIONS));
				parametersSet(PARAM_MODE_LONG, PARAM_MODE_MANUAL);
				parametersSet(PARAM_MODE_TRANS, PARAM_MODE_MANUAL);
				parametersSet(PARAM_MODE_PULL, PARAM_MODE_MANUAL);
				parametersSet(PARAM_CORRECTION, 0x0000);				
				parametersSet(PARAM_ALARM, (STI_GetMessage(STI_PARAM_ALARM_STATUS) & STI_ANSWER_ALARMS));
				m_byManualShiftActiveLong = false;
				m_byPageWaitingAnswer = PAGE_NONE;
				screenRegister();
			}
			break;				
		case PAGE_EXECUTE_T1:
			screenBigStdMessage(SCREEN_STD_MSG_TEST_SH);
			parametersSet(PARAM_SPEED, STI_GetMessage(STI_PARAM_SPEED));
			if (parametersGetValue(PARAM_SPEED)==0x0000)
			{
				sleepFix();
				screenBigStdMessage(SCREEN_STD_MSG_SPEED_ZERO);
				sleepFix();
				m_byPageWaitingAnswer = PAGE_NONE;
				screenRegister();
			}
			else
			{
				m_byManualShiftActiveLong = false;
				m_byPageWaitingAnswer = PAGE_EXECUTE_T1;
				m_byPageAnswerReceived = false;
				STI_SendMessage(STI_FUNZ_TEST_SCANNING_HEAD, 0x00, 0x0000);
			}
			break;
		case PAGE_EXECUTE_T2:
			screenBigStdMessage(SCREEN_STD_MSG_TEST_ENC);
			parametersSet(PARAM_SPEED, STI_GetMessage(STI_PARAM_SPEED));
			if (parametersGetValue(PARAM_SPEED)==0x0000)
			{
				sleepFix();
				screenBigStdMessage(SCREEN_STD_MSG_SPEED_ZERO);
				sleepFix();
				m_byPageWaitingAnswer = PAGE_NONE;
				screenRegister();
			}
			else if (parametersGetValue(PARAM_SPEED)>60)
			{
				sleepFix();
				screenBigStdMessage(SCREEN_STD_MSG_SPEED_TOO_FAST);
				sleepFix();
				m_byPageWaitingAnswer = PAGE_NONE;
				screenRegister();
			}
			else
			{
				screenBigStdMessage(SCREEN_STD_MSG_TEST_ENC);
				scanningHeadSignalEncoderAutoSet(); //Recognize Encoder Zero Channel NPN o PNP
				m_byManualShiftActiveLong = false;
				m_byPageWaitingAnswer = PAGE_EXECUTE_T2;
				m_byPageAnswerReceived = false;
				STI_SendMessage(STI_FUNZ_TEST_ENCODER, 0x00, 0x0000);					
			}
			break;
		case PAGE_EXECUTE_T3:
			if(m_byPageWaitingAnswer != PAGE_EXECUTE_T3)
			{			
				screenBigStdMessage(SCREEN_STD_MSG_TEST_OUTPUT);
				parametersSet(PARAM_SPEED, STI_GetMessage(STI_PARAM_SPEED));
				if (parametersGetValue(PARAM_SPEED)>0x0000)
				{
					sleepFix();
					screenBigStdMessage(SCREEN_STD_MSG_ERR_TEST_OUTPUT);
					sleepFix();
					m_byPageWaitingAnswer = PAGE_NONE;
					screenRegister();
					SNI_ResetData();
				}
				else
				{
					m_byPageWaitingAnswer = PAGE_EXECUTE_T3;
					m_byPageAnswerReceived = false;
					STI_SendMessage(STI_FUNZ_TEST_OUTPUT, 0x00, 0x0000);
					SNI_ResetData();
					m_byNextPage = PAGE_NONE;
				}
			}
			else
			{
					m_byNextPage = PAGE_NONE;
			}
			break;
		case PAGE_EXECUTE_T4:
			screenBigStdMessage(SCREEN_STD_MSG_TEST_4);
			break;
		case PAGE_EXECUTE_T5:
			screenBigStdMessage(SCREEN_STD_MSG_TEST_5);
			break;
		case PAGE_EXECUTE_T6:
			screenBigStdMessage(SCREEN_STD_MSG_TEST_6);
			break;
		case PAGE_EXECUTE_APP_01:
			screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
			parametersSet(PARAM_MODE_LONG, PARAM_MODE_MANUAL);
			parametersSet(PARAM_MODE_TRANS, PARAM_MODE_MANUAL);
			parametersSet(PARAM_MODE_PULL, PARAM_MODE_MANUAL);
			parametersSaveAll();
			parametersSet(PARAM_TWIN_CURRENT_APPLICATION, parametersGetValue(PARAM_TWIN_APPLICATION_01));
			parametersLoadAll(true);
			sleepFix();
			screenRegister();
			break;
		case PAGE_EXECUTE_APP_02:
			screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
			parametersSet(PARAM_MODE_LONG, PARAM_MODE_MANUAL);
			parametersSet(PARAM_MODE_TRANS, PARAM_MODE_MANUAL);
			parametersSet(PARAM_MODE_PULL, PARAM_MODE_MANUAL);
			parametersSaveAll();
			parametersSet(PARAM_TWIN_CURRENT_APPLICATION, parametersGetValue(PARAM_TWIN_APPLICATION_02));
			parametersLoadAll(true);
			sleepFix();
			screenRegister();
			break;
		case PAGE_EXECUTE_ENC_01:
			screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
			parametersSet(PARAM_MODE_LONG, PARAM_MODE_MANUAL);
			parametersSet(PARAM_MODE_TRANS, PARAM_MODE_MANUAL);
			parametersSet(PARAM_MODE_PULL, PARAM_MODE_MANUAL);
			parametersSet(PARAM_CURRENT_ENCODER, 0x0000);
			sleepFix();
			screenRegister();
			break;
		case PAGE_EXECUTE_ENC_02:
			screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
			parametersSet(PARAM_MODE_LONG, PARAM_MODE_MANUAL);
			parametersSet(PARAM_MODE_TRANS, PARAM_MODE_MANUAL);
			parametersSet(PARAM_MODE_PULL, PARAM_MODE_MANUAL);
			parametersSet(PARAM_CURRENT_ENCODER, 0x0001);
			sleepFix();
			screenRegister();
			break;
		case PAGE_EXECUTE_SH_PN_01:
			screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
			parametersSet(PARAM_MODE_LONG, PARAM_MODE_MANUAL);
			parametersSet(PARAM_MODE_TRANS, PARAM_MODE_MANUAL);
			parametersSet(PARAM_MODE_PULL, PARAM_MODE_MANUAL);
			parametersSet(PARAM_SH_PN, 0x0000);
			sleepFix();
			screenRegister();
			break;
		case PAGE_EXECUTE_SH_PN_02:
			screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
			parametersSet(PARAM_MODE_LONG, PARAM_MODE_MANUAL);
			parametersSet(PARAM_MODE_TRANS, PARAM_MODE_MANUAL);
			parametersSet(PARAM_MODE_PULL, PARAM_MODE_MANUAL);
			parametersSet(PARAM_SH_PN, 0x0001);
			sleepFix();
			screenRegister();
			break;				
		case PAGE_P4_VALUE:
			screenVersion();
			m_byPageWaitingAnswer = PAGE_NONE;
			screenRegister();				
			break;
		default:
			break;
	}
}



/*****************************************************************************/
void displayAppLoop(void)
{
	screenRegister();
	while(1)
	{
		displayAppRequestCom();
		displayAppManageAnswer();
		displayAppRefreshVisualization();
		displayAppNavigate();
	}
}