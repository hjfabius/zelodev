#include "init.h"

/*****************************************************************************/
//Init Oscillator Configuration (Datasheet - Section 9.0)
void initMicro()
{/*
	// Configure Oscillator to operate the device at 80Mhz, 40MIPS
	// Fosc= Fin*M/(N1*N2), Fcy=Fosc/2
	// Fosc= 8M*40/(2*2)=80Mhz for 8M input clock
	PLLFBD=38;						// M=40
	//PLLFBD=0; // M = 2
	CLKDIVbits.PLLPOST=0;			// N1=2
	CLKDIVbits.PLLPRE=0;			// N2=2
	OSCTUN=0;						// Tune FRC oscillator, if FRC is used
	//OSCCONbits.IOLOCK = 0;		//Peripherial pin select is not locked, write to peripheral pin select registers allowed

	// Disable Watch Dog Timer
	RCONbits.SWDTEN=0;
*/
}


/*****************************************************************************/
//Init I/O PORTS (Datasheet - Section 11.0)
void initIOPorts()
{
	/* 	Initialize ports */
	AD1PCFGL = 0xFFFF;				// set all pin as digital
	TRISA = 0x0000; 				// set IO as outputs
	LATB  = 0x0000; 				// set latch levels
	TRISB = 0b0111000001101100; 	// set IO RB2, RB3, RB5, RB6, RB12, RB13, RB14 as input, others as output
	
	//SPI communication (SPI with VFD)
	RPINR0bits.INT1R = RP_DDQUE;	// DDQUE <--		DDQUE	When VFD key is pressed(handled with interrupt)
	RPINR20bits.SDI1R = PIN_DDOUT;	// DDOUT <--		DDOUT	Data from VFD to PIC
	RPOR2bits.RP4R = 0b01000;		// SCK1  -->		DDCK	Clock generated by PIC once communication is started
	RPOR3bits.RP7R = 0b00111;		// SDO1  -->		DDIN	Data from PIC to VFD
	RPOR4bits.RP8R = 0b01001;		// SS1   -->		DDASK	When PIC wants to start communication set this bit	

	PIN_LED_GREEN = 1;				//Switch off GREEN led
	PIN_LED_RED = 1;				//Switch off RED led

	PIN_AMPLY_0 = 0;				//Set internal amplifier to minimum
	PIN_AMPLY_1 = 0;
	
}


/*****************************************************************************/
//Init Timers and Counters 			 (Datasheet - Section 13.0)
void initTimers()
{

	//Init Timer1 as Fosc/2 internal Timer (80MHz / 2 / (prescale=8) = 5MHz)
	T1CON = 0;            		// Timer reset
	T1CONbits.TON = 0; 			// Disable Timer
	T1CONbits.TCS = 0; 			// Select internal clock source
	T1CONbits.TCKPS = 0b01; 	// Select 1:8 Prescaler
	TMR1 = 0x0000; 				// Clear timer register
	PR1 = 0xFFFF;   			// Timer2 period register. 
	IPC0bits.T1IP = 1; 			// Set Timer2 Interrupt Priority Level = 1 (lower)
	IFS0bits.T1IF = 0; 			// Clear Timer2 Interrupt Flag
	IEC0bits.T1IE = 1; 			// Enable Timer2 interrupt
	T1CONbits.TON = 1; 			// Start Timer

	//Init Timer2 as Fosc/2 internal Timer (80MHz / 2 = 40MHz)
	T2CON = 0;            		// Timer reset
	T2CONbits.TON = 0; 			// Disable Timer
	T2CONbits.TCS = 0; 			// Select internal clock source
	T2CONbits.TCKPS = 0b00; 	// Select 1:1 Prescaler
	TMR2 = 0x0000; 				// Clear timer register
	PR2 = 0xFFFF;   			// Timer2 period register. 
	IPC1bits.T2IP = 1; 			// Set Timer2 Interrupt Priority Level = 1 (lower)
	IFS0bits.T2IF = 0; 			// Clear Timer2 Interrupt Flag
	IEC0bits.T2IE = 0; 			// Disable Timer2 interrupt
	T2CONbits.TON = 1; 			// Start Timer

	
	//Init Timer3 as Encoder Channel A Counter
	RPINR3bits.T3CKR = RP_QEA;	// TMR3 Channel A
	T3CON = 0;            		// Timer reset
	T3CONbits.TON = 0; 			// Disable Timer
	T3CONbits.TCS = 1; 			// Select external clock source (Encoder Channel A)
	T3CONbits.TCKPS = 0b00; 	// Select 1:1 Prescaler
	TMR3 = 0x0000; 				// Clear timer register
	PR3 = ENCODER_PERIOD-1;   	// Timer 3 period register = 1024. 
	IPC2bits.T3IP = 1; 			// Set Timer 3 Interrupt Priority Level = 1 (lower)
	IFS0bits.T3IF = 0; 			// Clear Timer 3 Interrupt Flag
	IEC0bits.T3IE = 0; 			// Disable Timer 3 interrupt
	
	//Timer 3 start after the Encoder 0 signal is recognized
	//T3CONbits.TON = 1; 		// Start Timer
	
}


/*****************************************************************************/
//Init InputCapture (Datasheet - Section 14.0)
void initInputCaptures()
{
		
	//Init IC1 - Capture S1 rising edge (T2 40 MHz)
	RPINR7bits.IC1R  = RP_S1;	// Select trigger;
	IC1CONbits.ICM   = 0b00; 	// Disable module
	IC1CONbits.ICTMR = 1; 		// Select source: (0:Timer3 1:Timer2)
	IC1CONbits.ICI   = 0b00; 	// 00:Interrupt on every capture event   
	                            // 01:Interrupt on every second capture event
	IPC0bits.IC1IP   = 2; 		// Setup interrupt priority level (1:lower - 7:higher)
	IFS0bits.IC1IF   = 0; 		// Clear Interrupt Status Flag
	IEC0bits.IC1IE   = 1; 		// Enable interrupt
	
	//Init IC2 - Capture S1 rising edge (T3 Encoder A position)
	RPINR7bits.IC2R  = RP_S1;	// Select trigger;
	IC2CONbits.ICM   = 0b00; 	// Disable module
	IC2CONbits.ICTMR = 0; 		// Select source: (0:Timer3 1:Timer2)
	IC2CONbits.ICI   = 0b00; 	// 00:Interrupt on every capture event   
								// 01:Interrupt on every second capture event
	IPC1bits.IC2IP   = 1; 		// Setup interrupt priority level (1:lower - 7:higher)
	IFS0bits.IC2IF   = 0; 		// Clear Interrupt Status Flag
	IEC0bits.IC2IE   = 1; 		// Enable interrupt
								
	//Init IC8 - Capture Encoder A rising edge (T2 40 MHz) 
	RPINR10bits.IC8R  = RP_QEA;	// Select trigger;
	IC8CONbits.ICM   = 0b00; 	// Disable module
	IC8CONbits.ICTMR = 1; 		// Select source: (0:Timer3 1:Timer2)
	IC8CONbits.ICI   = 0b00; 	// 00:Interrupt on every capture event   
								// 01:Interrupt on every second capture event
	IPC5bits.IC8IP   = 1; 		// Setup interrupt priority level (1:lower - 7:higher)
	IFS1bits.IC8IF   = 0; 		// Clear Interrupt Status Flag
	IEC1bits.IC8IE   = 1; 		// Enable interrupt
	IC8CONbits.ICM   = 0b011; 	// Enable IC
								//TODO - Provare a cambiare e mettere ad ogni edge.
								
								
}


/*****************************************************************************/
//Init Serial Peripheral Interface (Datasheet - Section 18.0)
void initSPI()
{
	#ifdef SPI_MANUAL
		SPI_MoveByte(0x00);
		SPI_MoveByte(0x00);
	#else

		//Reactivate once automatic SPI is configured
		// SPI1 register configuration for Master mode 
		IFS0bits.SPI1IF = 0; 		// Clear the Interrupt Flag
		IEC0bits.SPI1IE = 0; 		// Disable the Interrupt
		// SPI1CON1 Register Settings
		SPI1CON1bits.DISSCK = 0; 	// Internal Serial Clock is Enabled
		SPI1CON1bits.DISSDO = 0; 	// SDO1 pin is controlled by the module
		//SPI1CON1bits.MODE16 = 1; 	// Communication is word-wide (16 bits)
		SPI1CON1bits.MODE16 = 0; 	// Communication is byte-wide (8 bits)
		SPI1CON1bits.SMP = 0; 		// Input data is sampled at the middle of data
	
		SPI1CON1bits.PPRE = 0b01;	// Primary Prescaler 16:1
		SPI1CON1bits.SPRE = 0b001;	// Secondary Prescaler 1:1  --> 5MHz
	
	
		// output time
		//SPI1CON1bits.CKE = 0; 		// Serial output data changes on transition from Idle clock state to active clock state
		SPI1CON1bits.CKE = 1; 		// Serial output data changes on transition from active clock state to Idle clock state
		// from Idle clock state to active clock state
		SPI1CON1bits.CKP = 0; 		// Idle state for clock is a low level; active state is a high level;
		//SPI1CON1bits.CKP = 1; 		// Idle state for clock is a high level; active state is a low level;
		// active state is a high level
		SPI1CON1bits.MSTEN = 1; 	// Master mode Enabled
		SPI1STATbits.SPIEN = 1; 	// Enable SPI module
		SPI1BUF = 0x0000; 			// Write data to be transmitted
		// Interrupt Controller Settings
		IFS0bits.SPI1IF = 0; 		// Clear the Interrupt
		//IEC0bits.SPI1IE = 1; 		// Enable the Interrupt
		SPI1STAT = 0x8000; 
	#endif

}


/*****************************************************************************/
//Init External interrupt 	(Datasheet - Section 7.0)
void initINT()
{
	//Configure INT1 to handle VFD communication request (handling interrupt)
	IPC5bits.INT1IP 	= 1;		// Setup INT1 interrupt priority level = 1 (lower)
	INTCON2bits.INT1EP 	= 0;		// Interrupt on positive edge
	IFS1bits.INT1IF 	= 0;		// Clear INT1 Interrupt Status Flag
	IEC1bits.INT1IE 	= 1;		// Enable INT1 Interrupt 

	//Configure INT2 to handle Encoder Channel 0 and start T3
	RPINR1bits.INT2R 	= RP_IND;	// Channel 0 to start T3
	IPC7bits.INT2IP 	= 7;		// Setup INT2 interrupt priority level = 7 (higher)
	INTCON2bits.INT2EP 	= 0;		// Interrupt on positive edge
	IFS1bits.INT2IF 	= 0;		// Clear INT2 Interrupt Status Flag
	IEC1bits.INT2IE 	= 1;		// Enable INT2 Interrupt 	
}
