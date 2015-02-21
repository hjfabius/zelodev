#include "main.h"

/* old for microstick 
_FOSCSEL(FNOSC_FRC);								// set oscillator mode for FRC ~ 8 Mhz
_FOSC(FCKSM_CSDCMD & OSCIOFNC_ON & POSCMD_NONE);	// use OSCIO pin for RA3
_FWDT(FWDTEN_OFF);									// turn off watchdog
*/


//************************************************************** 
// Set device configuration values 2
//************************************************************** 
	_FOSCSEL( 	FNOSC_PRI &   							// Primary oscillator (XT, HS, EC)        
                IESO_ON );     							// Two Speed Start-up enabled
        
	_FOSC(  	FCKSM_CSECME  &        					//Clock switching and clock monitor Both enabled
                OSCIOFNC_OFF &        
                //POSCMD_EC &							//Internal Clock 4Mhz
				POSCMD_HS &								//External Clock 20Mhz								
                IOL1WAY_OFF );

	_FWDT(		FWDTEN_OFF);              				// Watchdog Timer Enabled/disabled by user software


/*****************************************************************************/
int main ( void )
{

	WORD woValue;


	initMicro();									//Init Oscillator Configuration 	(Datasheet - Section 9.0)
	initIOPorts();									//Init I/O PORTS 					(Datasheet - Section 11.0)
	initSPI();										//Init Serial Peripheral Interface 	(Datasheet - Section 18.0)
	initTimers();									//Init Timers and Counters 			(Datasheet - Section 13.0)
	initInputCaptures();							//Init InputCapture 				(Datasheet - Section 14.0)
	initINT();										//Init External interrupts 			(Datasheet - Section 7.0)

	/*
	while(1)
	{
		PIN_GATE = !PIN_GATE;
		PIN_LED_RED = !PIN_LED_RED;
		SPI_MoveByte(DISPLAY_RESET);
		__delay_ms(50);

		PIN_GATE = !PIN_GATE;
		PIN_LED_RED = !PIN_LED_RED;
		SPI_MoveByteMan(DISPLAY_RESET);
		__delay_ms(50);
	
	}*/
	
	displayReset();
	displayAppInit();
	/*
	PIN_AMPLY_0 = 0;
	PIN_AMPLY_1 = 0;
	
	while(1)
	{
	
		woValue = ((m_arwoSignalStart[PULSE_T2][0]*10)/m_woCurrentQEIPulseLength) %10;

	
		screenDisplayValues(
			m_arwoSignalStart[PULSE_T2][0], 
			m_arwoSignalStart[PULSE_QEI][0]*10+woValue, 
			m_woCurrentQEIPulseLength, 
			woValue, 
			parametersGetValue(PARAM_ERR_LONG)
			);
			
		//STI_GateGeneration();
		STI_Calculation();
			
	}*/
	
	displayAppLoop();
	
}	


