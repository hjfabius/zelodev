#ifndef COMMON_H
	#define	COMMON_H

/*****************************************************************************/
// Global st7 setup declaration
/*****************************************************************************/
	#define APPLICATION_VERSION								220

	#define DISPLAY_DIRECT_KEYBOARD
	//#define CPU_4Mhz
	#define CPU_8Mhz
	//#define CPU_16Mhz
	#define MATRIX_DISPLAY_PAGES_WIDTH 						32

	//#define EEPROM_RESET

	//#define VISCO_SIMULATOR


	#ifndef DISPLAY_DIRECT_KEYBOARD
		#define DISPLAY_922_KEYBOARD
	#endif
	
	

	#define TIMER_SEC						0x000071C7
	#define	TIMER_MSEC						0x0000001D


	#define MEASURE_TEMPERATURE_AVG_FIELDS 		 0x20   			//Average on 32 measures
	#define MEASURE_VISCOSITY_ARRAY_LENGTH 		 0x20   			//Average on 32 measures
	
	#define MEASURE_VISCOSITY_CALC_IDX_CONTROL 		0
	#define MEASURE_VISCOSITY_CALC_IDX_VISUAL		1
	#define MEASURE_VISCOSITY_CALC_INDEXES			2
	
	#define MEASURE_VISCOSITY_MEASURATION_TIMEOUT 	0x0002FFFF /*0x0008FFFF*/
	#define MEASURE_VISCOSITY_INTERNAL_LOOP_TIME	0x00010000
	#define MEASURE_VISCOSITY_INTERNAL_LOOP_COUNT	1

	


/*****************************************************************************/
// Includes
/*****************************************************************************/
	#include "iost72521.h"
	#include "defs.h"
	#include "timers.h"
	#include "fifo.h"
	#include "spi.h"
	#include "sci.h"
	#include "eeprom.h"
	#include "parameters.h"
	#include "measure.h"
	#include "label.h"
	#include "navigation.h"
	#include "display_macros.h"
	#include "display.h"
	#include "window.h"
	#include "screen.h"
	#include "display_application.h"


/*****************************************************************************/
// Port Setup declaration
/*****************************************************************************/
	#define _Pa_SCK					PADR
	#define _Pin_SCK				0

	#define _Pa_MOSI				PADR
	#define _Pin_MOSI				1
	
	#define _Pa_MISO				PADR
	#define _Pin_MISO				2
	
	#define _Pa_KeyIRQ				PBDR
	#define _Pin_KeyIRQ				6

	#define _Pa_Select_UA			PHDR
	#define _Pa_Select_UB			PHDR
	#define _Pa_Select_UC			PHDR
	#define _Pa_Select_U1			PHDR
	#define _Pa_Select_U2			PHDR
	#define _Pa_Select_U3			PHDR
	#define _Pin_Select_UA			0
	#define _Pin_Select_UB			1
	#define _Pin_Select_UC			2
	#define _Pin_Select_U1			3
	#define _Pin_Select_U2			4
	#define _Pin_Select_U3			5
	
	#define _Pa_DisplayBusy			PADR	
	#define _Pin_DisplayBusy		4

	
	#define _Pa_DDQUE				PFDR
	#define _Pin_DDQUE				3
	
	#define _Pa_DDSEL				PADR
	#define _Pin_DDSEL				5
	
	#define _Pa_DDIN				PCDR
	#define _Pin_DDIN				3
	
	#define _Pa_DDOUT				PGDR
	#define _Pin_DDOUT				3
	
	#define _Pa_DDCLK				PCDR
	#define _Pin_DDCLK				2
	
	#define _Pa_DDASK				PADR
	#define _Pin_DDASK				3

	#define _Pa_RS232_RDI			PEDR
	#define _Pin_RS232_RDI			1

	#define _Pa_RS232_TDO			PEDR
	#define _Pin_RS232_TDO			0

	#define _Pa_S1Digital			PADR
	#define _Pin_S1Digital			3

	#define _Pa_S1Analogic			PFDR
	#define _Pin_S1Analogic			4
	#define _Ain_S1Analogic			0x0A /*Analogic Input 10*/

	#define _Pa_Strobo				PBDR
	#define _Pin_Strobo				4


	#define _Pa_EncoderAB			PFDR  /* External timer pulses */
	#define _Pin_EncoderAB			7

	#define _Pa_Encoder0			PFDR
	#define _Pin_Encoder0			2

	#define _Pa_Gate				PBDR
	#define _Pin_Gate				7

	#define _Pa_Led_D1				PEDR
	#define _Pin_Led_D1				7

	#define _Pa_Led_D2				PEDR
	#define _Pin_Led_D2				6

	#define _Pa_Led_D3				PEDR
	#define _Pin_Led_D3				5

	#define _Pa_Led_D4				PEDR
	#define _Pin_Led_D4				4

	#define _Pa_Temp				PCDR
	#define _Pin_Temp				0
	#define _Ain_Temp				0x0C /*Analogic Input 12*/
	
	#define _Pa_Ph					PCDR
	#define _Pin_Ph					5
	#define _Ain_Ph					0x0E /*Analogic Input 14*/
	
	#define _Pa_NamurUp				PFDR
	#define _Pin_NamurUp			6	 /*ICAP1_A*/
	
	#define _Pa_NamurDown			PFDR
	#define _Pin_NamurDown			5	 /*ICAP2_A*/
	
	#define _Pa_ValveInk			PBDR
	#define _Pin_ValveInk			0

	#define _Pa_ValveSolvent		PBDR
	#define _Pin_ValveSolvent		1
	
	#define _Pa_ValveExit			PBDR
	#define _Pin_ValveExit			2
	
	#define _Pa_Allarm				PBDR
	#define	_Pin_Allarm				3

	#define _Pa_ValvePh				PGDR
	#define _Pin_ValvePh			5
	
	#define _Pa_ButtonInk			PCDR
	#define _Pin_ButtonInk			2

	#define _Pa_ButtonSolvent		PCDR
	#define _Pin_ButtonSolvent		3



	//DDR=0 = Input     DDR=1 = Out
	// OR=0  floating       open drain
	// OR=1  pull-up        push-pull
	
	//Port configuration	
	//PA0 = OUT - SCLK
	//PA1 = OUT - MOSI
	//PA2 = IN  - MISO
	//PA3 = IN  - DDASK  - (pull-up) Request from Taj 150 to speak
	//PA4 = IN  - IN_DIS - (pull-up) Display busy
	//PA5 = OUT - DDSEL  - Request to Taj 150 to speak (move together with DDQUE)
	//PA6 = IN  - IAUX_2 - (pull-up) <-- to change the bit when used
	//PA7 = IN  - IAUX_3 - (pull-up) <-- to change the bit when used
	#define _PADDR	0b00100011
	#define _PAOR	0b00110011
	#define _PADR	0x00


	//PB0 = OUT - MOSF_1  - Valve Ink 	- Green  Led Output on Power Board
	//PB1 = OUT - MOSF_3  - Valve Solvent - Red	 Led Output on Power Board
	//PB2 = OUT - MOSF_5  - Valve Exit 	- Yellow Led Output on Power Board
	//PB3 = OUT - MOSF_7  - Valve Allarm  - 		 Led Output on Power Board
	//PB4 = OUT - MONO    - Strobo  - White leds on Monostable
	//PB5 = OUT - OAUX_1
	//PB6 = IN  - IRQ_DIS -(pull-up) /IRQ
	//PB7 = IN  - GATE    - Gate
	#define _PBDDR	0b00111111
	#define _PBOR	0b01111111
	#define _PBDR	0b00000000

	//PC0 = IN  - Temperature Analogic Input 12
	//PC1 = OUT - Free (CPU Position)
	//PC2 = IN  - DDCLK - Clock from Taj 150
	//PC3 = IN  - DDIN  - Data  from Taj 150
	//PC4 = IN  - ICCDATA
	//PC5 = IN  - pH Analogic Input 14
	//PC6 = IN  - ICCCLK
	//PC7 = OUT - Free (CPU Selection)
	#define _PCDDR	0b10000010
	#define _PCOR	0b10000010
	#define _PCDR	0x00
	
	//PD0 = OUT - ULN_1
	//PD1 = OUT - ULN_2
	//PD2 = OUT - ULN_3
	//PD3 = OUT - ULN_4
	//PD4 = OUT - ULN_5
	//PD5 = OUT - ULN_6
	//PD6 = OUT - ULN_7
	//PD7 = OUT - ULN_8
	#define _PDDDR	0b11111111
	#define _PDOR	0b11111111
	#define _PDDR	0x00

	//PE0 = OUT - RS232 - TDO (pin 7 Dsub9)
	//PE1 = IN  - RS232 - RDI (pin 2 Dsub9)
	//PE2 = OUT - Free  - (CAN TX)
	//PE3 = OUT - Free  - (CAN RX)
	//PE4 = OUT - D4 	- LED on CPU Board
	//PE5 = OUT - D3 	- LED on CPU Board
	//PE6 = OUT - D2 	- LED on CPU Board
	//PE7 = OUT - D1 	- LED on CPU Board
	#define _PEDDR	0b11111101
	#define _PEOR	0b11111101
	#define _PEDR	0b11110000

	//PF0 = OUT - OPTO_1
	//PF1 = OUT - OPTO_2
	//PF2 = IN  - ENC   - Encoder 0
	//PF3 = OUT - DDQUE - Request to Taj 150 to speak (move together with DDSEL)
	//PF4 = IN  - S1    - Analogic (Scanning Head)
	//PF5 = IN  - N_INF - Namur Down
	//PF6 = IN  - N_SUP - Namur Up
	//PF7 = IN  - ENCAB - Encoder AB
	#define _PFDDR	0b00001011
	#define _PFOR	0b00001011
	#define _PFDR	0x00

	//PG0 = OUT - RS232  - TDO (pin 3 Dsub9)
	//PG1 = IN  - RS232  - RDI (pin 8 Dsub9)
	//PG2 = OUT - RS485  - Driver Enable (TX Enable)
	//PG3 = OUT - DDOUT  - Data to Taj 150
	//PG4 = OUT - MOSF_2 - Valve Temperature  - Led Output on Power Board
	//PG5 = OUT - MOSF_4 - Valve pH  		  - Led Output on Power Board
	//PG6 = OUT - MOSF_6 - Valve Aux  		  - Led Output on Power Board
	//PG7 = OUT - RS485 - /RE - Receiver Enable (RX Enable)
	#define _PGDDR	0b11111101
	#define _PGOR	0b11111101
	#define _PGDR	0x00


	//PH0 = OUT - Address Selector A
	//PH1 = OUT - Address Selector B
	//PH2 = OUT - Address Selector C
	//PH3 = OUT - Address Selector G1-U1 (EEprom)
	//PH4 = OUT - Address Selector G1-U2 (CPUs)
	//PH5 = OUT - Address Selector G1-U2 (CPUs)
	//PH6 = OUT - RS485 - Driver Input   TX
	//PH7 = IN  - RS485 - Receiver Output RX 
	#define _PHDDR	0b01111111
	#define _PHOR	0b01111111
	#define _PHDR	0x00


	//External interrupt control register
	#define _ISPR0	0b11111100
	#define _ISPR1	0b11111100
	#define _ISPR2 	0b11111100 /* interrupt no.8 bit0&1 priority level 2. if the are 11 the timer A interrupt is disable.*/
	#define _ISPR3 	0b11111100  
	#define _EICR  	0x40		//Display IRQ on ei3 - Rising edge only

	#define ADON	0x20	// AD Converter On
	#define ADSPEED	0x40	// AD Converter speed is fcpu / 2 (otherwise f/4)
	#define EOC		0x80	// Conversion Complete
	
	#define MEASURE_ICF2		0x10
	#define MEASURE_ICF1		0x80
	#define MEASURE_TOF			0x20
	
	#define MEASURE_TACR1 		0xA0
	#define MEASURE_TACR2 		0x08
	#define MEASURE_TIMER_OFF	0x04
	#define MEASURE_TIMER_ON	0x00
	


/*****************************************************************************/
// Variables declaration
/*****************************************************************************/
	static const unsigned char mc_byApplicationVersion		= APPLICATION_VERSION;

/*****************************************************************************/
// Functions declaration
/*****************************************************************************/
	void sleepSec(WORD a_uintSec);
	void sleep(LWORD a_uintMilliSec);
	void sleepForIRQ(LWORD a_uintMilliSec);
	void sleepFix(void);
	BYTE memcpy(STRING a_strTo, STRING a_strFROM, BYTE a_byLength);
	void memcpyFull(STRING a_strTo, STRING a_strFROM, BYTE a_byLength);
	void timersOnOff(BYTE a_blnEnable);
	void formatNumber(WORD a_woValue, BYTE a_byNumDigit, BYTE a_byNumDecimal, BYTE * a_byString);
	void formatNumberBinary(WORD a_woValue,BYTE * a_byString);
	WORD getBoundedValue(WORD * a_woValue, SWORD a_swoChange, WORD * a_woMax, WORD *a_woMin);

	
#endif