#include "interrupt.h"

WORD woTempQEIPulseLength;

/*****************************************************************************/
//Init TMR3 - 40 MHz, reset by Encoder A. Overflow is speed is too slow.
void __attribute__((__interrupt__, no_auto_psv)) _T1Interrupt( void )
{
	WORD woAnswer;
	woAnswer = parametersGetValue(PARAM_ALARM);
	_bset(woAnswer, STI_ANSWER_ALARM_ERR_LOW_SPEED);
	parametersSet(PARAM_ALARM, woAnswer);

	m_woCurrentQEIPulseLength = 0;
	
	IFS0bits.T1IF = 0; 			// Clear Timer1 Interrupt Flag
}


/*****************************************************************************/
//Init IC1 - Capture S1 rising edge (T2 40 MHz)
void __attribute__((__interrupt__, no_auto_psv)) _IC1Interrupt( void )
{
	switch (m_ucEncoderArea) 
	{
		case ENCODER_AREA_IN_GATE_1:
			if (m_arwoSignalStart [PULSE_T2][0] == -1)
			{
				m_arwoSignalStart[PULSE_T2][0]  = IC1BUF - woTempQEIPulseLength;
				m_arwoQEIPulseLengthStart[0] = m_woCurrentQEIPulseLength;
			}
			else if (m_arwoSignalEnd [PULSE_T2][0] == -1)
			{
				m_arwoSignalEnd[PULSE_T2][0]  = IC1BUF - woTempQEIPulseLength;
				m_arwoQEIPulseLengthEnd[0] = m_woCurrentQEIPulseLength;
				IC1CONbits.ICM = 0; 	// Disable IC
			}			
			break;
		case ENCODER_AREA_IN_GATE_2:
			if (m_arwoSignalStart [PULSE_T2][1] == -1)
			{
				m_arwoSignalStart[PULSE_T2][1]  = IC1BUF - woTempQEIPulseLength;
				m_arwoQEIPulseLengthStart[1] = m_woCurrentQEIPulseLength;
			}
			else if (m_arwoSignalEnd [PULSE_T2][1] == -1)
			{
				m_arwoSignalEnd[PULSE_T2][1]  = IC1BUF - woTempQEIPulseLength;
				m_arwoQEIPulseLengthEnd[1] = m_woCurrentQEIPulseLength;
				IC1CONbits.ICM = 0; 	// Disable IC
				
			}	
			break;
		default:
			break;
	}

	IFS0bits.IC1IF = 0;
	
}

/*****************************************************************************/
//Init IC2 - Capture S1 rising edge (T3 Encoder A position)
void __attribute__((__interrupt__, no_auto_psv)) _IC2Interrupt( void )
{
	switch (m_ucEncoderArea) 
	{
		case ENCODER_AREA_IN_GATE_1:
			if (m_arwoSignalStart [PULSE_QEI][0] == -1)
			{
				m_arwoSignalStart[PULSE_QEI][0]  = IC2BUF;
			}
			else if (m_arwoSignalEnd [PULSE_QEI][0] == -1)
			{
				m_arwoSignalEnd[PULSE_QEI][0]  = IC2BUF;
				IC2CONbits.ICM = 0; 	// Disable IC
				if(parametersGetValue(PARAM_RUNNING_MODE) == PARAM_RUNNING_MODE_MC) 
					m_ucSteps = STEP_READY_FOR_CALCULATION;
				
			}			
			break;
		case ENCODER_AREA_IN_GATE_2:
			if (m_arwoSignalStart [PULSE_QEI][1] == -1)
			{
				m_arwoSignalStart[PULSE_QEI][1]  = IC2BUF;
			}
			else if (m_arwoSignalEnd [PULSE_QEI][1] == -1)
			{
				m_arwoSignalEnd[PULSE_QEI][1]  = IC2BUF;
				IC2CONbits.ICM = 0; 	// Disable IC
				if(parametersGetValue(PARAM_RUNNING_MODE) == PARAM_RUNNING_MODE_MM) 
					m_ucSteps = STEP_READY_FOR_CALCULATION;
			}	
			break;
		default:
			break;
	}

	IFS0bits.IC2IF = 0;
}

/*****************************************************************************/
//Init IC8 - Capture Encoder A rising edge (T2 40 MHz) 
void __attribute__((__interrupt__, no_auto_psv)) _IC8Interrupt( void )
{
	WORD woICBuffer;
	BYTE byS1;
	WORD woAnswer;
	
	//Variables used for MM Phase
	BYTE i1;
	BYTE i2;
	BYTE i3;
	WORD woValueStart1;
	WORD woValueStart2;
	WORD woValueLength1;
	WORD woValueLength2;
	WORD woValueLength3;	
	
	
	m_woEncoderPosition = TMR3;
	byS1 = PIN_S1;
	woICBuffer= IC8BUF;
	TMR1 = 0; 				// On overflow, speed is too slow.
	
	if (m_woCurrentQEIPulseLength == 0) //machine was stopped.
	{
		m_woCurrentQEIPulseLength = woICBuffer - woTempQEIPulseLength;
		
	}
	else
	{
		//TODO: Optimize alarm management
		woAnswer = parametersGetValue(PARAM_ALARM);
		_bres(woAnswer, STI_ANSWER_ALARM_ERR_LOW_SPEED);
		parametersSet(PARAM_ALARM, woAnswer);
				
		m_woCurrentQEIPulseLength = woICBuffer - woTempQEIPulseLength;
		woTempQEIPulseLength = woICBuffer;
		
		//If Mote is MarkMark and encoder is out of gate 2, I start to search the new phase
		if (
			(m_ucSteps == STEP_PHASE_MM) &&
			(parametersGetValue(PARAM_RUNNING_MODE) == PARAM_RUNNING_MODE_MM) 
		   )
		{
			
			if (m_byS1 != byS1) 
			{
				switch(byS1)
				{
					case 1:
						m_arwoSignalPhaseStart[m_ucSignalPhasePointer] = m_woEncoderPosition;
						break;
					case 0:
						m_arwoSignalPhaseEnd[m_ucSignalPhasePointer] = m_woEncoderPosition;

						i1 = m_ucSignalPhasePointer;
						i2 = ((unsigned char) (m_ucSignalPhasePointer-1)) % SIGNAL_PHASE_COUNT;
						i3 = ((unsigned char) (m_ucSignalPhasePointer-2)) % SIGNAL_PHASE_COUNT;
						
						woValueStart1 = 	convertEncoder(m_arwoSignalPhaseStart[i1] - m_arwoSignalPhaseStart[i2]);
						woValueStart2 = 	convertEncoder(m_arwoSignalPhaseStart[i2] - m_arwoSignalPhaseStart[i3]);

						woValueLength1 = 	convertEncoder(m_arwoSignalPhaseEnd[i1] - m_arwoSignalPhaseStart[i1]);
						woValueLength2 = 	convertEncoder(m_arwoSignalPhaseEnd[i2] - m_arwoSignalPhaseStart[i2]);
						woValueLength3 = 	convertEncoder(m_arwoSignalPhaseEnd[i3] - m_arwoSignalPhaseStart[i3]);
						

						if 
							   ( //Mark Type C
								(woValueStart1 == 2*woValueLength2) && 
								(woValueStart2 == 2*woValueLength3) && 
								(woValueStart2 == woValueLength1)
							   )
						{

							if(m_arycSignalPositionInMarks[0]==1)
							{
								m_arwoGateStart[PULSE_QEI][0] = convertEncoder(m_arwoSignalPhaseStart[i1] + woValueLength1 + 2);
							}
							else
							{
								m_arwoGateStart[PULSE_QEI][0] = convertEncoder(m_arwoSignalPhaseStart[i1] + woValueLength1 + ( woValueLength1 * 5 * (m_arycSignalPositionInMarks[0]-1)) - 1 ) ;
							}
							m_arwoGateEnd[PULSE_QEI][0]   = convertEncoder(m_arwoSignalPhaseStart[i1] + woValueLength1 + ( woValueLength1 * 5 * (m_arycSignalPositionInMarks[0]))   - 2) ;
						

							if(m_arycSignalPositionInMarks[1]==1)
							{
								m_arwoGateStart[PULSE_QEI][1] = convertEncoder(m_arwoSignalPhaseStart[i1] + woValueLength1 + 2);
							}
							else
							{
								m_arwoGateStart[PULSE_QEI][1] = convertEncoder(m_arwoSignalPhaseStart[i1] + woValueLength1 + ( woValueLength1 * 5 * (m_arycSignalPositionInMarks[1]-1)) -1 ) ;
							}
							m_arwoGateEnd[PULSE_QEI][1]   = convertEncoder(m_arwoSignalPhaseStart[i1] + woValueLength1 + ( woValueLength1 * 5 * (m_arycSignalPositionInMarks[1]))   - 2) ;
							
							m_ucSteps = STEP_SIGNAL_ACQUISITION;
							//return PHASE_COMPLETED;	
						}
						else if (
							// Mark Type AB
							(woValueStart1 == woValueStart2) &&   
							(woValueLength1 == woValueLength2) && 
							(woValueLength2 == woValueLength3) &&
							(woValueLength1*8 == woValueStart1)
						   )
						{
							m_arwoGateStart[PULSE_QEI][0] = (m_arwoSignalPhaseStart[i1] + (woValueLength1 * ( 5 + 20*(m_arycSignalPositionInMarks[0]-1))  )) % (ENCODER_PERIOD*4);
							m_arwoGateEnd[PULSE_QEI][0]   = (m_arwoSignalPhaseStart[i1] + (woValueLength1 * (23 + 20*(m_arycSignalPositionInMarks[0]-1))  )) % (ENCODER_PERIOD*4);
						
							m_arwoGateStart[PULSE_QEI][1] = (m_arwoSignalPhaseStart[i1] + (woValueLength1 * ( 5 + 20*(m_arycSignalPositionInMarks[1]-1))  )) % (ENCODER_PERIOD*4);
							m_arwoGateEnd[PULSE_QEI][1] = 	(m_arwoSignalPhaseStart[i1] + (woValueLength1 * (23 + 20*(m_arycSignalPositionInMarks[1]-1))  )) % (ENCODER_PERIOD*4);
						
							m_ucSteps = STEP_SIGNAL_ACQUISITION;
							//return PHASE_COMPLETED;
							
						}
						
						m_ucSignalPhasePointer = ((unsigned char)(m_ucSignalPhasePointer + 1)) % SIGNAL_PHASE_COUNT;
						//m_ucSignalPhasePointer = convertEncoder(m_ucSignalPhasePointer + 1);

						break;
					default:
						break;
				}
				m_byS1 = byS1;

				
			}
				
		}
		
		
		//Gate Management
		if(m_woEncoderPosition == m_arwoGateStart[PULSE_QEI][0])  
		{
			m_ucEncoderArea = ENCODER_AREA_IN_GATE_1;
			IC1CONbits.ICM = 0b001; 				// Generate capture event on every S1 edge (Timer T2 40Mhz)
			IC2CONbits.ICM = 0b001; 				// Generate capture event on every S1 edge (Encoder A)
			m_arwoSignalStart	[PULSE_QEI][0] = -1;
			m_arwoSignalStart	[PULSE_T2] [0] = -1;
			m_arwoSignalEnd		[PULSE_QEI][0] = -1;
			m_arwoSignalEnd		[PULSE_T2] [0] = -1;
		}
		else if (m_woEncoderPosition == m_arwoGateEnd[PULSE_QEI][0]) 
		{
			m_ucEncoderArea = ENCODER_AREA_OUT_OF_GATE;
			IC1CONbits.ICM = 0; 	// Disable IC1
			IC2CONbits.ICM = 0; 	// Disable IC2
			if(m_arwoSignalStart[PULSE_QEI][0] == -1)
			{
				_bset(woAnswer, STI_ANSWER_ALARM_ERR_NO_PRINT);
				parametersSet(PARAM_ALARM, woAnswer);
			}
			else
			{
				_bres(woAnswer, STI_ANSWER_ALARM_ERR_NO_PRINT);
				parametersSet(PARAM_ALARM, woAnswer);
			}
		}/*
		else if(TMR3 == m_arwoGateStart[PULSE_QEI][1])  
		{
			m_ucEncoderArea = ENCODER_AREA_IN_GATE_2;
			IC1CONbits.ICM = 0b001; 				// Generate capture event on every S1 edge (Timer T2 40Mhz)
			IC2CONbits.ICM = 0b001; 				// Generate capture event on every S1 edge (Encoder A)
			m_arwoSignalStart	[PULSE_QEI][1] = -1;
			m_arwoSignalStart	[PULSE_T2] [1] = -1;
			m_arwoSignalEnd		[PULSE_QEI][1] = -1;
			m_arwoSignalEnd		[PULSE_T2] [1] = -1;
		}
		else if (TMR3 == m_arwoGateEnd[PULSE_QEI][1]) 
		{
			m_ucEncoderArea = PHASE_OUT_OF_GATE;
			IC1CONbits.ICM = 0; 	// Disable IC1
			IC2CONbits.ICM = 0; 	// Disable IC2
			if(m_arwoSignalStart[PULSE_QEI][1] == -1)
			{
				_bset(woAnswer, STI_ANSWER_ALARM_ERR_NO_PRINT);
				parametersSet(PARAM_ALARM, woAnswer);
			}
			else
			{
				_bres(woAnswer, STI_ANSWER_ALARM_ERR_NO_PRINT);
				parametersSet(PARAM_ALARM, woAnswer);
			}			
			
		}*/
		
		
		//Acquire Signal Value for Oscilloscope
		switch ((BYTE)(m_woEncoderPosition & 0x0003)) //0b00000011 -->  Byte Index
		{
			case 0:
				if(byS1==1) 
					m_arbyScanningHeadSignal[m_woEncoderPosition/4] = 0b11000000;
				else
					m_arbyScanningHeadSignal[m_woEncoderPosition/4] = 0b00000000;
				
				break;
			case 1:
				if(byS1==1) 
					m_arbyScanningHeadSignal[m_woEncoderPosition/4] += 0b00110000;
				break;
			case 2:
				if(byS1==1) 
					m_arbyScanningHeadSignal[m_woEncoderPosition/4] += 0b00001100;
				break;
			case 3:
				if(byS1==1) 
					m_arbyScanningHeadSignal[m_woEncoderPosition/4] += 0b00000011;
				break;
		}	
	}
	
	IFS1bits.IC8IF = 0;
}


/*****************************************************************************/
//Genereated by DDQUE when ST7 want to communicate to PIC
void __attribute__((__interrupt__, no_auto_psv))  _INT1Interrupt( void )
{

	displayKeyboardIRQ();
	IFS1bits.INT1IF = 0;		// Clear INT1 Interrupt Status Flag

}

/*****************************************************************************/
//Genereated by Encoder 0 
void __attribute__((__interrupt__, no_auto_psv))  _INT2Interrupt( void )
{
	T3CONbits.TON = 1; 			// Start Timer
	m_ucEncoderArea = ENCODER_AREA_OUT_OF_GATE;
	
	IFS1bits.INT2IF = 0;		// Clear INT2 Interrupt Status Flag
	IEC1bits.INT2IE = 0;		// Disable INT2 Interrupt 

}
