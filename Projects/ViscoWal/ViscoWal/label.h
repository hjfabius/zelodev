#ifndef LABEL_H
	#define LABEL_H

	#include "common.h"


/*****************************************************************************/
	#define 	LABEL_MODE							0
	#define		LABEL_MODE_AUTO						1
	#define		LABEL_MODE_MANUAL					2
	#define		LABEL_MODE_PAUSE					3
	#define		LABEL_MODE_OFF						4
	#define		LABEL_TEMPERATURE					5
	#define		LABEL_MESSAGE						6
	#define 	LABEL_ALARM							7
	#define 	LABEL_ANSWER_OK						8
	#define 	LABEL_GENERIC_ALARM_01				9
	#define 	LABEL_GENERIC_ALARM_02				10
	#define 	LABEL_VISCOSITY						11
	#define 	LABEL_SW_VERSION_01					12
	#define 	LABEL_SW_VERSION_02					13
	#define 	LABEL_JOB_ARCHIVE_01				14
	#define 	LABEL_JOB_ARCHIVE_02				15
	#define 	LABEL_SIMPLE_SETUP					16
	#define 	LABEL_FULL_SETUP					17
	#define		LABEL_SAVE_JOB_01					18
	#define		LABEL_SAVE_JOB_02					19
	#define		LABEL_LOAD_JOB_01					20
	#define		LABEL_LOAD_JOB_02					21
	#define 	LABEL_MAIN							22
	#define		LABEL_CALIBRATION					23
	#define		LABEL_SETUP							24
	#define 	LABEL_ALARM_MEASURING_VISCOSITY		25
	#define		LABEL_ALARM_MEASURING_TEMPERATURE	26
	#define		LABEL_ALARM_MEASURING_PH			27
	#define		LABEL_REFERENCE						28
	#define		LABEL_REAL							29
	#define		LABEL_WASHING_01					30
	#define		LABEL_WASHING_02					31
	#define		LABEL_ADDING_SOLVENT_01				32
	#define		LABEL_ADDING_SOLVENT_02				33
	#define		LABEL_ALARM_PUMP_ON					34
	#define		LABEL_CUP							35
	#define		LABEL_SHOW_CALIBRATION				36
	#define		LABEL_RESET_CALIBRATION_01				37
	#define		LABEL_RESET_CALIBRATION_02				38


/*****************************************************************************/
	BYTE * labelGet(BYTE a_byIndex);
	BYTE * labelSetupGet(BYTE a_byIndex);

#endif