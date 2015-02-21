#include "flash.h"

//--------------------------------------------------------------------------------------
// Init Flash
//--------------------------------------------------------------------------------------
void InitFlash()
{
	RPOR6bits.RP12R = 0b00010010;	// RP12 tied to Output Compare 1

	//Init flash start trigger
	T1CONbits.TON = 0;				/* disable Timer 1*/ 
 	IFS0bits.T1IF = 0;				/* reset Timer 1 interrupt flag */
	IPC0bits.T1IP = 4;				/* set Timer1 interrupt priority level to 4 */
 	IEC0bits.T1IE = 1;				/* enable Timer 1 interrupt */
	//PR1 = 1;						/* set Timer 1 period register */
	T1CONbits.TCKPS = 3;			/* select Timer1 Input Clock Prescale = 256 */
	T1CONbits.TCS = 0;			 	/* select timer internal clock */
	T1CONbits.TON = 1;			 	/* enable Timer 1 and start the count */ 		

	//Init flash end trigger
	T4CONbits.TON = 0;				/* disable Timer 4*/ 
 	IFS1bits.T4IF = 0;				/* reset Timer 4 interrupt flag */
	IPC6bits.T4IP = 4;				/* set Timer 4 interrupt priority level to 4 */
 	IEC1bits.T4IE = 1;				/* enable Timer 4 interrupt */
	T4CONbits.TCKPS = 2;			/* select Timer 4 Input Clock Prescale = 64 */
	T4CONbits.TCS = 0;			 	/* select timer internal clock */
	PR4 = ( (QUARTZ_MHZ/2UL) * FLASH_LENGTH_US) / 64UL; /* Period = FCY * Desired Length(sec) / Prescaler  */
	
	// Initialize and enable Timer2 (flash oscillator)
	T2CONbits.TON = 0; 				// Disable Timer
	T2CONbits.TCS = 0; 				// Select internal instruction cycle clock
	T2CONbits.TGATE = 0; 			// Disable Gated Timer mode
	T2CONbits.TCKPS = 0b00; 		// Select 1:1 Prescaler
	TMR2 = 0x00; 					// Clear timer register
	PR2 = PWM_PERIOD; 				// Load the period value
	IPC1bits.T2IP = 0x01; 			// Set Timer 2 Interrupt Priority Level
	IFS0bits.T2IF = 0; 				// Clear Timer 2 Interrupt Flag
	IEC0bits.T2IE = 0; 				// Disable Timer 2 interrupt
	T2CONbits.TON = 1; 				// Start Timer

	SetFlashOscillatorDutyCycle(parametersGetValue(PARAM_LIGHT));
	
}


//--------------------------------------------------------------------------------------
// Disable internal trigger for Flash (external trigger required)
// To reactivate call InitFlash
//--------------------------------------------------------------------------------------
void DisableFlashInternalTrigger()
{
	T1CONbits.TON = 0;  /* disable Timer 1*/			
}

//--------------------------------------------------------------------------------------
// Set Flash Oscillator DutyCycle
//--------------------------------------------------------------------------------------
void SetFlashOscillatorDutyCycle(BYTE a_byDutyCycle)
{
	WORD woPWMPeriod;
	

	#if defined(REVERSE)
			switch(a_byDutyCycle)
			{
				case 1:
					woPWMPeriod = 27;	//PWM_PERIOD*3/4; 39
					break;
				case 2:
					woPWMPeriod = 22;	//PWM_PERIOD*2/4; 29
					break;
				case 3:
					woPWMPeriod = 16;	//PWM_PERIOD*1/4; 19
					break;
				case 4:
					woPWMPeriod = 11;	//1; 
					break;
				default:
					woPWMPeriod = PWM_PERIOD/2;
					break;
			}
	#else
			switch(a_byDutyCycle)
			{
				case 1:
					woPWMPeriod = 11;	//1; 
					break;
				case 2:
					woPWMPeriod = 16;	//PWM_PERIOD*1/4; 19
					break;
				case 3:
					woPWMPeriod = 22;	//PWM_PERIOD*2/4; 29
					break;
				case 4:
					woPWMPeriod = 27;	//PWM_PERIOD*3/4; 39
					break;

				default:
					woPWMPeriod = PWM_PERIOD/2;
					break;
			}
	#endif

	// Initialize Output Compare Module
	OC1CONbits.OCM = 0b000;		 	// Disable Output Compare Module
	OC1R = woPWMPeriod; 			// Write the duty cycle for the first PWM pulse
	OC1RS = woPWMPeriod; 			// Write the duty cycle for the second PWM pulse
	OC1CONbits.OCTSEL = 0; 			// Select Timer 2 as output compare time base
	OC1R = woPWMPeriod; 			// Load the Compare Register Value
	OC1CONbits.OCM = 0b110; 		// Select the Output Compare mode
}



//--------------------------------------------------------------------------------------
// T1 interrupt (Start the flash)
//--------------------------------------------------------------------------------------
void __attribute__((interrupt, auto_psv)) _T1Interrupt( void )
{

	#if defined(DISABLE_FLASH_OSCILLATOR)
		//disable flash oscillator
		OC1CONbits.OCM = 0b000;		 	// Disable Output Compare Module
	#endif

	//ExecuteFlash();
	#if defined(REVERSE)
		PIN_FLASH = 0;
	#else
		PIN_FLASH = 1;
	#endif
	TMR4 = 0;
	T4CONbits.TON = 1;			 		/* enable Timer 4 and start the count */ 			
 	IFS0bits.T1IF = 0;					/* reset timer interrupt flag	*/
}	

//--------------------------------------------------------------------------------------
// T4 interrupt (End the flash)
//--------------------------------------------------------------------------------------
void __attribute__((interrupt, auto_psv)) _T4Interrupt( void )
{
	T4CONbits.TON = 0;			 		/* disable Timer 4*/ 			
	
	#if defined(REVERSE)
		PIN_FLASH = 1;
	#else
		PIN_FLASH = 0;
	#endif

	#if defined(DISABLE_FLASH_OSCILLATOR)
		//enable flash oscillator
		OC1CONbits.OCM = 0b110; 		// Select the Output Compare mode
	#endif

	IFS1bits.T4IF = 0;					/* reset timer interrupt flag	*/

}



//--------------------------------------------------------------------------------------
// CN24 Triggered by external sync
//--------------------------------------------------------------------------------------
void __attribute__((__interrupt__)) _CNInterrupt(void)
{
	#if defined(DISABLE_FLASH_OSCILLATOR)
		//disable flash oscillator
		OC1CONbits.OCM = 0b000;		 	// Disable Output Compare Module
	#endif

	//ExecuteFlash();
	#if defined(REVERSE)
		PIN_FLASH = 0;
	#else
		PIN_FLASH = 1;
	#endif
	TMR4 = 0;
	T4CONbits.TON = 1;			 		/* enable Timer 4 and start the count */ 			
	
	/* Clear CN interrupt */
	IFS1bits.CNIF = 0;
}
