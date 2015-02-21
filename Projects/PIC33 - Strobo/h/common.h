#ifndef __COMMON_H__
	#define __COMMON_H__ 


	#if defined(__dsPIC33F__)
		#include "p33fxxxx.h"
	#elif defined(__PIC24H__)
		#include "p24hxxxx.h"
	#endif

	
	//If activated, Flash signal and duty cycles are reversed
	//#define REVERSE

	//If activated, flash oscillator is disabled during strobo flash.
	#define DISABLE_FLASH_OSCILLATOR


	#include "defs.h"
	#include "pins.h"	

	#define APPLICATION_SUPPLIER							"Zelo Elettronica"
	#define APPLICATION_PRODUCT_VERSION						"Taj Strobo v.105"

	#define PWM_PERIOD										99  /*cambiato il 6/7/2012 era 49*/
	#define QUARTZ_MHZ										20UL
	#define FLASH_LENGTH_US									15000UL  /* Flash duration in microsecond*/
	#define ENCODER_FAST_PULSE								800
	#define ENCODER_FAST_PULSE_FACTOR						4
	#define PARAMETER_EEPROM_POLLING_TIME					5  /* Values saved to eeprom every PARAMETER_EEPROM_POLLING_TIME seconds */


	#define FCY QUARTZ_MHZ*1000000UL/2 						//FCY = QUARTZ_MHZ/2
	#include <libpic30.h>

/*****************************************************************************/
// Variables declaration
/*****************************************************************************/
	extern volatile WORD m_woCurrentPOS1CNT;
	extern volatile WORD m_woPreviousPOS1CNT;
	extern volatile SWORD m_intDeltaEncoder;
	



/*****************************************************************************/
// Functions declaration
/*****************************************************************************/
	#define _bset(A, B)		 	 (A |= (0x0001<<(B)))
	#define _bres(A, B)		 	 (A &= ~(0x0001<<(B)))
	#define _btst(A, B)		 	 ((A) & (0x0001<<(B)))
	#define _switch(A, B)		 if(_btst(A, B)){_bres(A, B);}else{_bset(A, B);}
	#define _peak(A, B)			 _bres(A, B);Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();_bset(A, B);
	#define	 true 				 1
	#define	 false 				 0



/*****************************************************************************/
// Modules declaration
/*****************************************************************************/

	#include <pwm.h>
	#include <timer.h>
	#include <DEE Emulation 16-bit.h> 
	#include "parameters.h"
	#include "encoder.h"
	#include "flash.h"
	#include "LCD_44780.h"
	#include "delay.h"
	
#endif

