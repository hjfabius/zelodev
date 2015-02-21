#include "encoder.h"

//--------------------------------------------------------------------------------------
// Local Variables 
//--------------------------------------------------------------------------------------
WORD m_woKeyTimer = 0;
		


//--------------------------------------------------------------------------------------
// Initialize Encoder
//--------------------------------------------------------------------------------------
void InitEncoder()
{
	/* initialize port as QEI1 */ 
	RPINR14bits.QEA1R = 14;			// QEI Channel A map on RP14 - Pin 25
	RPINR14bits.QEB1R = 13;			// QEI Channel A map on RP13 - Pin 24

	/* initialize  QEI1 */ 
	QEI1CONbits.QEIM = 0b000;		// Quadrature Encoder Interface Off
	
	QEI1CONbits.CNTERR = 0; 		// Clear any count errors
	QEI1CONbits.QEISIDL = 0; 		// Continue operation during sleep
	QEI1CONbits.SWPAB = 0; 			// QEA and QEB not swapped
	QEI1CONbits.PCDOUT = 0; 		// Normal I/O pin operation
	QEI1CONbits.POSRES = 1; 		// Index pulse resets position counter

	DFLT1CONbits.CEID = 1; 			// Count error interrupts disabled
	DFLT1CONbits.QEOUT = 1; 		// Digital filters output enabled for QEn pins
	DFLT1CONbits.QECK = 0b111; 		// 1:256 clock divide for digital filter for QEn
	POS1CNT = 0; 					// Reset position counter
	QEICONbits.QEIM = 0b101; 		// Quadrature Encoder Interface enabled (x2 mode) with position counter reset by match (MAXxCNT)
	MAX1CNT = 0xFFFF;
	IFS3bits.QEI1IF = 0;			// QEI Interrupt flag clear
	IEC3bits.QEI1IE = 0;			// Interrupt disabled


	//Init CN
	CNPU1bits.CN12PUE = 1;			// Enable pull-up on input change CN12 pin
	CNPU1bits.CN13PUE = 1;			// Enable pull-up on input change CN13 pin
	CNPU2bits.CN23PUE = 1;			// Enable pull-up on input change CN23 pin
	CNEN2bits.CN23IE = 0;			// Enable CN23 for interrupt detaction
	IEC1bits.CNIE = 0;				// Disable CN interrupts
	IFS1bits.CNIF = 0;				// Reset CN interrupts
	
	// Initialize and enable Timer3 
	//Polling interrupt (period ENCODER_FAST_PULSE) where encoder is check and encoder speed is calculated
	T3CONbits.TON = 0; 				// Disable Timer
	T3CONbits.TCS = 0; 				// Select internal instruction cycle clock
	T3CONbits.TGATE = 0; 			// Disable Gated Timer mode
	T3CONbits.TCKPS = 0b11; 		// Select 1:256 Prescaler
	TMR3 = 0x00; 					// Clear timer register
	PR3 = ENCODER_FAST_PULSE; 		// Load the period value
	IPC2bits.T3IP = 0x07; 			// Set Timer 3 Interrupt Priority Level
	IFS0bits.T3IF = 0; 				// Clear Timer 3 Interrupt Flag
	IEC0bits.T3IE = 1; 				// Enable Timer 3 interrupt
	T3CONbits.TON = 1; 				// Start Timer
	
}	


//--------------------------------------------------------------------------------------
// This function check if Encoder button has been pressed
//--------------------------------------------------------------------------------------
BYTE IsEncoderKeyPressed()
{
	if (PIN_ENC_BUTTON == 0) 	
	{ 
		m_woKeyTimer++; 
	}
	else if(m_woKeyTimer > 2)
	{	 
		m_woKeyTimer = 0;
		return TRUE;
	}
	else
	{
		m_woKeyTimer = 0;
	}
	return FALSE;
}


//--------------------------------------------------------------------------------------
// Polling interrupt (period ENCODER_FAST_PULSE) where encoder is check and encoder speed is calculated
//--------------------------------------------------------------------------------------
void __attribute__((interrupt, auto_psv)) _T3Interrupt( void )
{
	m_woCurrentPOS1CNT = POS1CNT;
	//m_woDeltaPOS1CNT = m_woCurrentPOS1CNT > m_woPreviousPOS1CNT ? (m_woCurrentPOS1CNT - m_woPreviousPOS1CNT) : (m_woPreviousPOS1CNT - m_woCurrentPOS1CNT);
	m_intDeltaEncoder = (m_woCurrentPOS1CNT - m_woPreviousPOS1CNT);
	if ((m_intDeltaEncoder > 1) || (m_intDeltaEncoder < -1))
	{
		POS1CNT = m_woCurrentPOS1CNT + (m_woCurrentPOS1CNT- m_woPreviousPOS1CNT)*ENCODER_FAST_PULSE_FACTOR;
		m_woCurrentPOS1CNT = POS1CNT;
		m_intDeltaEncoder = (m_woCurrentPOS1CNT - m_woPreviousPOS1CNT);
	}
	
	m_woPreviousPOS1CNT = m_woCurrentPOS1CNT;

	TMR3 = 0x00;
 	IFS0bits.T3IF = 0;					/* reset timer interrupt flag	*/
}	
