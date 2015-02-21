#include "main.h"

_FOSCSEL(FNOSC_FRC);								// set oscillator mode for FRC ~ 8 Mhz
_FOSC(FCKSM_CSDCMD & OSCIOFNC_ON & POSCMD_NONE);	// use OSCIO pin for RA3
_FWDT(FWDTEN_OFF);									// turn off watchdog

/*****************************************************************************/
int main ( void )
{

	initMicro();									//Init Oscillator Configuration 	(Datasheet - Section 9.0)
	initIOPorts();									//Init I/O PORTS 					(Datasheet - Section 11.0)
	initSPI();										//Init Serial Peripheral Interface 	(Datasheet - Section 18.0)
	initTimers();									//Init Timers and Counters 			(Datasheet - Section 13.0)
	initInputCaptures();							//Init InputCapture 				(Datasheet - Section 14.0)
	initINT();										//Init External interrupts 			(Datasheet - Section 7.0)

	displayReset();
	displayAppInit();
	displayAppLoop();
	
}	


