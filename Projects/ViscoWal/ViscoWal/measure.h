#ifndef MEASURE_H
	#define MEASURE_H
	
	#include "common.h"

	typedef enum {								//			//Ink	Solvent		Exit	Ph
		VALVES_CLOSED		= (BYTE)0x80,		//0000		// C	C			C		C	
		VALVES_OPENED		= (BYTE)0x0A,		//1010		// O	C			O		C
		VALVES_ADDSOLVENT	= (BYTE)0x06,		//0110		// C	O			O		C
		VALVES_ADDPH		= (BYTE)0x03,		//0011		// C	C			O		O
		VALVES_WASH			= (BYTE)0x0C,		//1100		// O	O			C		C
		VALVES_MEASURING	= (BYTE)0xFF		//Dummy - Used before closing - No Effect
	} tyMeasureValveStatus;


	void measureInit(void);

	void measureUpdateTemperature(void);
	void measureUpdateViscosity(void);
	void measureSetValveStatus(tyMeasureValveStatus a_enmMeasureValveStatus);
	BYTE measureCalculation(void);
	void measureViscosityCalibration(void);
	void measureViscosityCalibration2Points(void);
	WORD measureGetHistoricalViscosityValue(BYTE byIndex);
	
	//BYTE measureApplyCorrection(BYTE (* a_arbyDisplayPage)[MATRIX_DISPLAY_PAGES_WIDTH]);
	

	
#endif