// Include files
#include "main.h"

#pragma DATA_SEG SHORT DEFAULT_RAM


//#define  EEPROM_LANGUAGE_0
//#define  EEPROM_LANGUAGE_1
#define  EEPROM_LANGUAGE_2
//#define  EEPROM_LANGUAGE_3
//#define  EEPROM_LANGUAGE_4
//#define  EEPROM_LANGUAGE_5
//#define  EEPROM_LANGUAGE_6
//#define  EEPROM_LANGUAGE_7

#ifdef EEPROM_LANGUAGE_0
	#define  EEPROM_LANGUAGE_NUMBER 0
	#define  EEPROM_ADR 			0x01
#endif

#ifdef EEPROM_LANGUAGE_1
	#define  EEPROM_LANGUAGE_NUMBER 1
	#define  EEPROM_ADR 			0x02
#endif

#ifdef EEPROM_LANGUAGE_2
	#define  EEPROM_LANGUAGE_NUMBER 2
	#define  EEPROM_ADR 			0x03
#endif

#ifdef EEPROM_LANGUAGE_3
	#define  EEPROM_LANGUAGE_NUMBER 3
	#define  EEPROM_ADR 			0x04
#endif

#ifdef EEPROM_LANGUAGE_4
	#define  EEPROM_LANGUAGE_NUMBER 4
	#define  EEPROM_ADR 			0x05
#endif

#ifdef EEPROM_LANGUAGE_5
	#define  EEPROM_LANGUAGE_NUMBER 5
	#define  EEPROM_ADR 			0x06
#endif

#ifdef EEPROM_LANGUAGE_6
	#define  EEPROM_LANGUAGE_NUMBER 6
	#define  EEPROM_ADR 			0x07
#endif

#ifdef EEPROM_LANGUAGE_7
	#define  EEPROM_LANGUAGE_NUMBER 7
	#define  EEPROM_ADR 			0x08 - Error - 
#endif

#include "eeprom_msg_value.h"


/*****************************************************************************/
void init(void)
{
	BYTE m_strReset[3];



	PADR 	= _PADR;       
	PADDR 	= _PADDR;
	PAOR 	= _PAOR;
	PADR 	= _PADR;
	
	PBDR 	= _PBDR;  	
	PBDDR 	= _PBDDR;
	PBOR 	= _PBOR; 
	PBDR 	= _PBDR;

	PCDR 	= _PCDR;  	
	PCDDR 	= _PCDDR;
	PCOR 	= _PCOR; 
	PCDR 	= _PCDR;  	
	
	PDDR 	= _PDDR;       
	PDDDR 	= _PDDDR;
	PDOR 	= _PDOR;
	PDDR 	= _PDDR;
	
	PEDR 	= _PEDR;       
	PEDDR 	= _PEDDR;
	PEOR 	= _PEOR;
	PEDR 	= _PEDR;

	PFDR 	= _PFDR;       
	PFDDR 	= _PFDDR;
	PFOR 	= _PFOR;
	PFDR 	= _PFDR;

	PGDR 	= _PGDR;       
	PGDDR 	= _PGDDR;
	PGOR 	= _PGOR;
	PGDR 	= _PGDR;

	PHDR 	= _PHDR;       
	PHDDR 	= _PHDDR;
	PHOR 	= _PHOR;
	PHDR 	= _PHDR;

	DisableInterrupts();
	//External interrupt control register
    ISPR0 = 0b11111100;
	ISPR1 = 0b11111100;
	//ISPR2 = 0xFF;
	ISPR2 = 0b11111100; // interrupt no.8 bit0&1 priority level 2. if the are 11 the timer A interrupt is disable.
	ISPR3 = 0b11111100;  
	EICR  = 0x40;
	
	eepromInit();
	
	//EnableInterrupts();
	
}	

/*****************************************************************************/
void main(void)
{
	BYTE strMessage[EEPROM_MSG_LENGTH_LONG];
	WORD woInitialAddressShort 	= 0x0000;
	WORD woInitialAddressNormal	= 0x0000;
	WORD woOffset 				= 0x0000;
	WORD woAddress 				= 0x0000;
	WORD woMsgIdx 				= 0x0000;
	
	woInitialAddressShort	= EEPROM_INITIAL_OFFSET + (EEPROM_LANGUAGE_NUMBER*EEPROM_LANGUAGE_LENGTH);
	woInitialAddressNormal	= (EEPROM_MSG_LENGTH_SHORT*EEPROM_MIN_INDEX_NORMAL) + EEPROM_INITIAL_OFFSET + (EEPROM_LANGUAGE_NUMBER*EEPROM_LANGUAGE_LENGTH);
	
	init();
	
	_bres(_Pa_Led_D1, _Pin_Led_D1);
	_bres(_Pa_Led_D2, _Pin_Led_D2);
	_bres(_Pa_Led_D3, _Pin_Led_D3);
	_bres(_Pa_Led_D4, _Pin_Led_D4);

	//Short
	//woMsgIdx = ||00||; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, ||01||, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	
	//Normal
	//woMsgIdx = ||00||; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, ||01||, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	_bset(_Pa_Led_D1, _Pin_Led_D1);
		
	woMsgIdx = MSG_IDX_SEC; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_SEC, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_MSEC; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_MSEC, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_CELSIUS; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_CELSIUS, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_NO; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_NO, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_PH; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_PH, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_YES; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_YES, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_PAUSE; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_PAUSE, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_RESET; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_RESET, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_TIMERS; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_TIMERS, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_LANGUAGES; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_LANGUAGES, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_PH_MAX; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_PH_MAX, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_PH_MIN; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_PH_MIN, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_RESET_ASK; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_RESET_ASK, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_BOUNDS; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_BOUNDS, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_DEUTSCH; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_DEUTSCH, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_ENGLISH; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ENGLISH, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_ESPANOL; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ESPANOL, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_FRANCAIS; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_FRANCAIS, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_GAIN; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_GAIN, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_ITALIANO; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ITALIANO, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_WASHING; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_WASHING, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_LANGUAGE_7; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_LANGUAGE_7, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_LANGUAGE_8; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_LANGUAGE_8, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_SOLVENT; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_SOLVENT, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_CALIBRATION; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_CALIBRATION, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_ERROR_00; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_00, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_ERROR_01; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_01, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_ERROR_02; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_02, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_ERROR_03; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_03, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_ERROR_04; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_04, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_ERROR_05; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_05, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_ERROR_06; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_06, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_ERROR_07; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_07, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_ERROR_08; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_08, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_ERROR_09; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_09, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_ERROR_10; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_10, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_ERROR_11; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_11, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_ERROR_12; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_12, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_ERROR_13; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_13, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_ERROR_14; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_14, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_ERROR_15; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_15, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_PARAMETERS; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_PARAMETERS, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_PORTUGUES; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_PORTUGUES, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_VISCOSITY; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_VISCOSITY, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_ACIDBASE; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ACIDBASE, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_TEMPERATURE; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_TEMPERATURE, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_ENABLE_PH_ASK; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ENABLE_PH_ASK, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_SAVE_JOB; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_SAVE_JOB, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_LOAD_JOB; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_LOAD_JOB, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_CONFIGURATION; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_CONFIGURATION, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_PH_TOO_DIFFERENT; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_PH_TOO_DIFFERENT, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_MAX_CORRECTION; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_MAX_CORRECTION, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_MIN_CORRECTION; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_MIN_CORRECTION, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_MAX_VISCOSITY; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_MAX_VISCOSITY, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_MIN_VISCOSITY; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_MIN_VISCOSITY, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_ALLARM; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ALLARM, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_PH_ONOFF; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_PH_ONOFF, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_JOB_SAVED; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_JOB_SAVED, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_JOB_LOADED; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_JOB_LOADED, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_SOLVENT_ASK; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_SOLVENT_ASK, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_SOLVENT_ASK2; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_SOLVENT_ASK2, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_ACIDBASE_ASK; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ACIDBASE_ASK, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_ACIDBASE_ASK2; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ACIDBASE_ASK2, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_MAX_TEMPERATURE; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_MAX_TEMPERATURE, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_MIN_TEMPERATURE; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_MIN_TEMPERATURE, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_ADDING_SOLVENT3; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ADDING_SOLVENT3, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_ADDING_ACIDBASE3; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ADDING_ACIDBASE3, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_POMP_ON; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_POMP_ON, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);

	_bset(_Pa_Led_D2, _Pin_Led_D2);
	woMsgIdx = MSG_IDX_ADDING_SOLVENT2; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, MSG_VALUE_ADDING_SOLVENT2, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_ADDING_ACIDBASE2; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, MSG_VALUE_ADDING_ACIDBASE2, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_GENERIC_ERROR; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, MSG_VALUE_GENERIC_ERROR, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_OUT_OF_BOUNDS; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, MSG_VALUE_OUT_OF_BOUNDS, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_VALVES_DELAY; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, MSG_VALUE_VALVES_DELAY, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_INTERMEASURING; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, MSG_VALUE_INTERMEASURING, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_ADDING_SOLVENT; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, MSG_VALUE_ADDING_SOLVENT, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_PARAMETER_SAVED; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, MSG_VALUE_PARAMETER_SAVED, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_TOO_DIFFERENT; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, MSG_VALUE_TOO_DIFFERENT, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_TIMEOUT_MEASURE; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, MSG_VALUE_TIMEOUT_MEASURE, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_WASHING_ASK; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, MSG_VALUE_WASHING_ASK, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_MEASURING; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, MSG_VALUE_MEASURING, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_CONTACT_YOUR_PROVIDER; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, MSG_VALUE_CONTACT_YOUR_PROVIDER, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_PRESS_ANY_KEY_TO_STOP; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, MSG_VALUE_PRESS_ANY_KEY_TO_STOP, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);
	woMsgIdx = MSG_IDX_PRESS_ANY_KEY_TO_CONTINUE; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, MSG_VALUE_PRESS_ANY_KEY_TO_CONTINUE, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);

		
	_bset(_Pa_Led_D1, _Pin_Led_D1);
	_bset(_Pa_Led_D2, _Pin_Led_D2);
	_bset(_Pa_Led_D3, _Pin_Led_D3);
	_bset(_Pa_Led_D4, _Pin_Led_D4);

	while(1)
	{
		Nop();
	}
}
