#include "sti.h"

/*****************************************************************************/
// Private declarations
/*****************************************************************************/
WORD	m_woTimeout;
WORD 	STI_NextEdge(WORD a_woEncoderPosition);
BYTE 	STI_MarkCylinderAutomaticPhaseSimple(void);
BYTE 	STI_MarkCylinderAutomaticPhaseComplex(void);
BYTE 	STI_MarkMarkAutomaticPhase(void);



/*****************************************************************************/
BYTE STI_MoveByte (BYTE a_byData)
{ 	
	return 0x0000;
}

/*****************************************************************************/
void STI_ReceiveMessage(BYTE * a_byCode, BYTE * a_byAdditionalCode, WORD * a_woValue)
{
	
}


/*****************************************************************************/
WORD STI_GetMessage(BYTE a_byParamCode)
{
	return 0x0000;
}


/*****************************************************************************/
WORD STI_SendMessage(BYTE a_byCode, BYTE a_byAdditionalCode, WORD a_woValue)
{
	return 0x0000;
}















/*****************************************************************************/
void STI_InitParam(void)
{
	m_arwoGateStart	[PULSE_QEI][0] = -1;
	m_arwoGateEnd	[PULSE_QEI][0] = -1;
	m_arwoGateStart	[PULSE_QEI][1] = -1;
	m_arwoGateEnd	[PULSE_QEI][1] = -1;
	
	
	m_ucEncoderArea = ENCODER_AREA_PHASE_STOP;
	if (parametersGetValue(PARAM_RUNNING_MODE) == PARAM_RUNNING_MODE_MM) 
	{
		m_ucSteps = STEP_PHASE_MM;
	} 
	else //(parameterGetValue(PARAM_RUNNING_MODE) == PARAM_RUNNING_MODE_MC) 
	{
		m_ucSteps = STEP_SIGNAL_ACQUISITION;
	}	
}				

/*****************************************************************************/
BYTE STI_PhaseAutomatic(void)
{
	BYTE byResults;

	parametersSet(PARAM_ERR_LONG,  0x8000);		//reset the error
	parametersSet(PARAM_ERR_TRANS, 0x8000);		//reset the error
	parametersSet(PARAM_MODE_LONG, 	PARAM_MODE_MANUAL);
	parametersSet(PARAM_MODE_TRANS, PARAM_MODE_MANUAL);
	parametersSet(PARAM_MODE_PULL, 	PARAM_MODE_MANUAL);
	parametersSet(PARAM_CORRECTION, 0x0000);
	
	if(parametersGetValue(PARAM_RUNNING_MODE) == PARAM_RUNNING_MODE_MC)
	{
		
		//Search if a signal with spaces half gate before and half gate after 
		byResults = STI_MarkCylinderAutomaticPhaseComplex();
		if (byResults) return TRUE;
		
		//Search if a signal with spaces half gate before  
		byResults = STI_MarkCylinderAutomaticPhaseSimple();
		if (byResults) return TRUE;
		
		return FALSE;
	}
	else
	{
		return STI_MarkMarkAutomaticPhase();
	}
		
	
}

/*****************************************************************************/
BYTE STI_TestScanningHead(void)
{
	return FALSE;
}

/*****************************************************************************/
BYTE STI_TestEncoder(void)		
{
	return FALSE;
}

/*****************************************************************************/
void STI_OffsetGap(void)				
{
	return FALSE;
}

/*****************************************************************************/
void STI_ShiftReferenceAuto(void)
{
}

/*****************************************************************************/
void STI_ShiftReferenceManual(BYTE a_byDirection)
{
	switch(a_byDirection)
	{
		case STI_DIRECTION_A:
			PIN_DIRECTION_R = 0;
			PIN_DIRECTION_A = 1;
			break;
		case STI_DIRECTION_R:
			PIN_DIRECTION_A = 0;
			PIN_DIRECTION_R = 1;
			break;
		case STI_DIRECTION_T:
			PIN_DIRECTION_O = 0;
			PIN_DIRECTION_T = 1;
			break;
		case STI_DIRECTION_O:
			PIN_DIRECTION_T = 0;
			PIN_DIRECTION_O = 1;
			break;
		case STI_DIRECTION_I:
			PIN_DIRECTION_D = 0;
			PIN_DIRECTION_I = 1;
			break;
		case STI_DIRECTION_D:
			PIN_DIRECTION_I = 0;
			PIN_DIRECTION_D = 1;
			break;
		default:
			break;
	}
}

/*****************************************************************************/
void STI_StopReferenceManual(void)	
{
	PIN_DIRECTION_A = 0;
	PIN_DIRECTION_R = 0;
	PIN_DIRECTION_T = 0;
	PIN_DIRECTION_O = 0;
	PIN_DIRECTION_I = 0;
	PIN_DIRECTION_D = 0;
}

/*****************************************************************************/
void STI_PhaseFast(void)	
{
}

/*****************************************************************************/
void STI_CenterGate(void)
{
	double dblNewReferenceLong;

	if(parametersGetValue(PARAM_RUNNING_MODE) == PARAM_RUNNING_MODE_MC)
	{
		//Take the integer part
		dblNewReferenceLong = m_ardblDistanceLong[0];
		parametersSet(PARAM_ENC_GATE01_REFERENCE, dblNewReferenceLong);

		//Take the decimal part
		dblNewReferenceLong -= (double)((WORD) dblNewReferenceLong);
		parametersSet(PARAM_ENC_GATE01_REFERENCE_1000, dblNewReferenceLong *1000);

		STI_ExecutePrecalculation();
	}
}

/*****************************************************************************/
BYTE STI_PhaseManual(void)
{
	if ((parametersGetValue(PARAM_SPEED)==0x0000) &&
		(parametersGetValue(PARAM_RUNNING_MODE) == PARAM_RUNNING_MODE_MC))
	{
		parametersSet(PARAM_ENC_GATE01_REFERENCE, TMR3); /* Current Encoder Position*/
		parametersSet(PARAM_ENC_GATE01_REFERENCE_1000, 0); /* Current Encoder Position*/
		parametersSet(PARAM_MODE_LONG, PARAM_MODE_MANUAL);
		parametersSet(PARAM_MODE_TRANS, PARAM_MODE_MANUAL);
		parametersSet(PARAM_MODE_PULL, PARAM_MODE_MANUAL);
		parametersSet(PARAM_CORRECTION, 0x0000);	
		STI_ExecutePrecalculation();
		return TRUE;
	}
	
	return FALSE;
}


/*****************************************************************************/
BYTE STI_TestOutput(void)
{

	PIN_DIRECTION_A = 0;	PIN_DIRECTION_R = 0;	PIN_DIRECTION_T = 0;	PIN_DIRECTION_O = 0;	PIN_DIRECTION_I = 0;	PIN_DIRECTION_D = 0;
	PIN_DIRECTION_A = 1;
	sleepSec(2);

	PIN_DIRECTION_A = 0;	PIN_DIRECTION_R = 0;	PIN_DIRECTION_T = 0;	PIN_DIRECTION_O = 0;	PIN_DIRECTION_I = 0;	PIN_DIRECTION_D = 0;
	PIN_DIRECTION_R = 1;
	sleepSec(2);

	PIN_DIRECTION_A = 0;	PIN_DIRECTION_R = 0;	PIN_DIRECTION_T = 0;	PIN_DIRECTION_O = 0;	PIN_DIRECTION_I = 0;	PIN_DIRECTION_D = 0;
	PIN_DIRECTION_T = 1;
	sleepSec(2);

	PIN_DIRECTION_A = 0;	PIN_DIRECTION_R = 0;	PIN_DIRECTION_T = 0;	PIN_DIRECTION_O = 0;	PIN_DIRECTION_I = 0;	PIN_DIRECTION_D = 0;
	PIN_DIRECTION_O = 1;
	sleepSec(2);

	PIN_DIRECTION_A = 0;	PIN_DIRECTION_R = 0;	PIN_DIRECTION_T = 0;	PIN_DIRECTION_O = 0;	PIN_DIRECTION_I = 0;	PIN_DIRECTION_D = 0;
	PIN_DIRECTION_I = 1;
	sleepSec(2);

	PIN_DIRECTION_A = 0;	PIN_DIRECTION_R = 0;	PIN_DIRECTION_T = 0;	PIN_DIRECTION_O = 0;	PIN_DIRECTION_I = 0;	PIN_DIRECTION_D = 0;
	PIN_DIRECTION_D = 1;
	sleepSec(2);

	PIN_DIRECTION_A = 0;	PIN_DIRECTION_R = 0;	PIN_DIRECTION_T = 0;	PIN_DIRECTION_O = 0;	PIN_DIRECTION_I = 0;	PIN_DIRECTION_D = 0;
}

/*****************************************************************************/
void STI_TwinApp01(void)
{
}

/*****************************************************************************/
void STI_TwinApp02(void)
{
}

/*****************************************************************************/
void STI_InitZ80(void)		
{
}

/*****************************************************************************/
void STI_CancelOperation(void)
{
}

/*****************************************************************************/
void STI_Reset(void)
{
}


/*****************************************************************************/
void STI_GateGeneration(void)
{
	switch(m_ucEncoderArea)
	{
		case ENCODER_AREA_OUT_OF_GATE:
			PIN_GATE = 0; //Stop Gate
			break;
		case ENCODER_AREA_IN_GATE_1:
			PIN_GATE = 1; //Start Gate
			break;
		case ENCODER_AREA_IN_GATE_2:
			PIN_GATE = 1; //Start Gate
			break;
		default:
			PIN_GATE = 0; //Stop Gate
			break;
	}
}

/*****************************************************************************/
void STI_Calculation(void)
{
	if ((m_ucEncoderArea == ENCODER_AREA_OUT_OF_GATE)&&
		(m_ucSteps == STEP_READY_FOR_CALCULATION)
		)	   
	{
		PIN_LED_GREEN = !PIN_LED_GREEN ;				
		STI_ConvertAcquisitionToDouble();
		if (parametersGetValue(PARAM_RUNNING_MODE) == PARAM_RUNNING_MODE_MM) 
		{
			STI_ExecuteCalculationMarkMark();
			m_ucSteps = STEP_PHASE_MM;
		} 
		else //(parameterGetValue(PARAM_RUNNING_MODE) == PARAM_RUNNING_MODE_MC) 
		{
			STI_ExecuteCalculationMarkCylinder();
			m_ucSteps = STEP_SIGNAL_ACQUISITION;
		}
		parametersSet(PARAM_ERR_LONG, 	0x8000+(m_ardblErrorLong[0]*100));
		parametersSet(PARAM_ERR_TRANS, 	0x8000+(m_ardblErrorTran[0]*100));

		/*screenDisplayValues(	
								m_ardblSignalStart[0]*100  -26000,
								m_ardblSignalEnd[0]*100    -26000,
								m_ardblSignalMiddle[0]*100 -26000,
								(m_ardblSignalMiddle[0]-m_ardblSignalStart[0])*100,
								(m_ardblSignalEnd[0]-m_ardblSignalMiddle[0])*100
							);*/
							
		
	}
	parametersSet(PARAM_SPEED, 		m_dblSpeedFactor / m_woCurrentQEIPulseLength);
}



/*****************************************************************************/
void STI_ExecutePrecalculation(void)
{

	m_dblMillimeterInEncoderPulse = 
					  (double) parametersGetValue(PARAM_CYLINDER_TRAVEL) / 10			// Cylinder in mm
					* (double) parametersGetValue(PARAM_CYLINDER_ENCODER_RATIO) /1000 	// In case encoder is not 1:1 with cilinder
					/ (double) ENCODER_PERIOD; 											// # of encoder pulses in a loop (to be multiplied in case of XOR)

	m_dblSpeedFactor = 	  
					(double) (OSCILLATOR_FREQUENCY / 2)									// T2 configured with internal timer Fosc/2
					* 60.0																// Seconds to minutes
					* m_dblMillimeterInEncoderPulse										
					/ 1000.0;															// To transform mm in meters



	m_ardblReferenceLong[0] = (m_arycSignalPositionInMarks[1] - m_arycSignalPositionInMarks[0]) * 20;


	parametersSet(PARAM_ENC_GATE01_END  , convertEncoder(	parametersGetValue(PARAM_ENC_GATE01_REFERENCE)	+ (parametersGetValue(PARAM_GATE_WINDOW) /10 / 2 / m_dblMillimeterInEncoderPulse)	));                   
	parametersSet(PARAM_ENC_GATE01_START, convertEncoder(	parametersGetValue(PARAM_ENC_GATE01_REFERENCE)	- (parametersGetValue(PARAM_GATE_WINDOW) /10 / 2 / m_dblMillimeterInEncoderPulse)	));                   
	
	m_arwoGateStart[PULSE_QEI][0] = parametersGetValue(PARAM_ENC_GATE01_START);
	m_arwoGateEnd[PULSE_QEI][0]   = parametersGetValue(PARAM_ENC_GATE01_END); 
	
	
	if(parametersGetValue(PARAM_RUNNING_MODE) == PARAM_RUNNING_MODE_MM)
	{
		m_arwoGateStart[PULSE_QEI][1] = convertEncoder(parametersGetValue(PARAM_ENC_GATE01_START)  + m_ardblReferenceLong[0]/m_dblMillimeterInEncoderPulse);
		m_arwoGateEnd[PULSE_QEI][1]   = convertEncoder(parametersGetValue(PARAM_ENC_GATE01_END)    + m_ardblReferenceLong[0]/m_dblMillimeterInEncoderPulse);
	}

	
}

/*****************************************************************************/
void STI_ConvertAcquisitionToDouble(void)
{
	unsigned char i;
	unsigned char iMax;
	
	iMax = (parametersGetValue(PARAM_RUNNING_MODE) == PARAM_RUNNING_MODE_MC) ? 1 : SIGNAL_COUNT; 

	for(i=0; i<iMax; i++)
	{
	
		while(m_arwoSignalStart[PULSE_T2][i] >= m_arwoQEIPulseLengthStart[i])
		{
			m_arwoSignalStart[PULSE_T2][i] -= m_arwoQEIPulseLengthStart[i];
		}

		while(m_arwoSignalEnd[PULSE_T2][i] >= m_arwoQEIPulseLengthEnd[i])
		{
			m_arwoSignalEnd[PULSE_T2][i] -= m_arwoQEIPulseLengthEnd[i];
		}
		
	
		//Calculation of the raising edge
		m_ardblSignalStart[i] = m_arwoSignalStart[PULSE_QEI][i] +
								((double)m_arwoSignalStart[PULSE_T2][i]/m_arwoQEIPulseLengthStart[i]);

		//Calculation fo the falling edge
		m_ardblSignalEnd[i] = m_arwoSignalEnd[PULSE_QEI][i] +
								((double)m_arwoSignalEnd[PULSE_T2][i]/m_arwoQEIPulseLengthEnd[i]);

		//Calculation of the middle point between raising and falling
		m_ardblSignalMiddle[i] = (m_ardblSignalStart[i] < m_ardblSignalEnd[i]) ?
									(m_ardblSignalStart[i] + m_ardblSignalEnd[i]) / 2 :
									(m_ardblSignalStart[i] + m_ardblSignalEnd[i]) / 2 - (ENCODER_PERIOD  /2);
	}


}

/*****************************************************************************/
void STI_ExecuteCalculationMarkCylinder(void)
{	
	switch (parametersGetValue(PARAM_MARK_SHAPE))
	{
		case PARAM_MARK_SHAPE_SQUARE:
			m_ardblDistanceLong[0] = m_ardblSignalMiddle[0];
			m_ardblDistanceTran[0] = 0.0;
			break;
		case PARAM_MARK_SHAPE_TRIANGLE_60:
			m_ardblDistanceLong[0] = m_ardblSignalStart[0];
			//Todo
			//m_ardblDistanceTran[0] = 0.57735026918963 * (m_ardblDistanceLong[i-1] - (m_ardblSignalEnd[i] - m_ardblSignalEnd[0]));
			break;
		case PARAM_MARK_SHAPE_TRIANGLE_45:
			m_ardblDistanceLong[0] = m_ardblSignalStart[0];
			//Todo;
			//m_ardblDistanceTran[0] = (m_ardblDistanceLong[i-1] - (m_ardblSignalEnd[i] - m_ardblSignalEnd[0]));
			break;
		case PARAM_MARK_SHAPE_TRIANGLE_30:
			m_ardblDistanceLong[0] = m_ardblSignalStart[0];
			//Todo;
			//m_ardblDistanceTran[i-1] = 1.73205080756888 * (m_ardblDistanceLong[i-1] - (m_ardblSignalEnd[i] - m_ardblSignalEnd[0]));
			break;
		case PARAM_MARK_SHAPE_FRONT:
			m_ardblDistanceLong[0] = m_ardblSignalStart[0];
			m_ardblDistanceTran[0] = 0.0;
			break;
		
		default:
			while(1);  //TODO: Alarm Mark shape not defined
	}

	if(m_ardblDistanceLong[0] < -(ENCODER_PERIOD/2))
	{	
		m_ardblDistanceLong[0] += (ENCODER_PERIOD);
	}
	if(m_ardblDistanceTran[0] < -(ENCODER_PERIOD/2))
	{	
		m_ardblDistanceTran[0] += (ENCODER_PERIOD);
	}

	m_ardblErrorLong[0] = m_dblMillimeterInEncoderPulse * 
							(	m_ardblDistanceLong[0] - 
								(
									parametersGetValue(PARAM_ENC_GATE01_REFERENCE) +  
									(double)parametersGetValue(PARAM_ENC_GATE01_REFERENCE_1000)/1000
								)
							);
	//TODO
	//m_ardblErrorTran[0] = (m_dblMillimeterInEncoderPulse * m_ardblDistanceTran[0]);

}


/*****************************************************************************/	
void STI_ExecuteCalculationMarkMark()
{	
	unsigned char i;
	double dblQEIPulseLengthEnd = 0.0;

	for(i=0; i<SIGNAL_COUNT; i++)
	{
		//Timing used in calculation of the speed
		dblQEIPulseLengthEnd += m_arwoQEIPulseLengthEnd[i];  	// Latest available Measure
	 
		if (i>0)
		{
			switch (parametersGetValue(PARAM_MARK_SHAPE))
			{
				case PARAM_MARK_SHAPE_SQUARE:
					m_ardblDistanceLong[i-1] = m_ardblSignalMiddle[i] - m_ardblSignalMiddle[0];
					m_ardblDistanceTran[i-1] = 0.0;
					break;
				case PARAM_MARK_SHAPE_TRIANGLE_60:
					m_ardblDistanceLong[i-1] = m_ardblSignalStart[i] - m_ardblSignalStart[0];
					m_ardblDistanceTran[i-1] = 0.57735026918963 * (m_ardblDistanceLong[i-1] - (m_ardblSignalEnd[i] - m_ardblSignalEnd[0]));
					break;
				case PARAM_MARK_SHAPE_TRIANGLE_45:
					m_ardblDistanceLong[i-1] = m_ardblSignalStart[i] - m_ardblSignalStart[0];
					m_ardblDistanceTran[i-1] = (m_ardblDistanceLong[i-1] - (m_ardblSignalEnd[i] - m_ardblSignalEnd[0]));
					break;
				case PARAM_MARK_SHAPE_TRIANGLE_30:
					m_ardblDistanceLong[i-1] = m_ardblSignalStart[i] - m_ardblSignalStart[0];
					m_ardblDistanceTran[i-1] = 1.73205080756888 * (m_ardblDistanceLong[i-1] - (m_ardblSignalEnd[i] - m_ardblSignalEnd[0]));
					break;
				case PARAM_MARK_SHAPE_FRONT:
					m_ardblDistanceLong[i-1] = m_ardblSignalStart[i] - m_ardblSignalStart[0];
					m_ardblDistanceTran[i-1] = 0.0;
					break;
				default:
					while(1);  //TODO: Alarm Mark shape not defined
			}

			if(m_ardblDistanceLong[i-1] < -(ENCODER_PERIOD/2))
			{	
				m_ardblDistanceLong[i-1] += (ENCODER_PERIOD);
			}
			if(m_ardblDistanceTran[i-1] < -(ENCODER_PERIOD/2))
			{	
				m_ardblDistanceTran[i-1] += (ENCODER_PERIOD);
			}

			m_ardblErrorLong[i-1] = (m_dblMillimeterInEncoderPulse * m_ardblDistanceLong[i-1]) - m_ardblReferenceLong[i-1];
			m_ardblErrorTran[i-1] = (m_dblMillimeterInEncoderPulse * m_ardblDistanceTran[i-1]);
		}	

	} 
				
}

/*****************************************************************************/	
BYTE STI_MarkCylinderAutomaticPhaseSimple(void)
{
	WORD woPreviousEdge;
	WORD woNextEdge;

	WORD woEncoderInMillimiter; /*TODO fare assignemnt */
	WORD woHalfGateInEncoder;



	
	woHalfGateInEncoder = convertEncoder(parametersGetValue(PARAM_ENC_GATE01_END) - parametersGetValue(PARAM_ENC_GATE01_START)) /2;
	
	woEncoderInMillimiter = (WORD)(1/m_dblMillimeterInEncoderPulse);
	
	woPreviousEdge=1;
	woNextEdge = 0;
	while ((woPreviousEdge<2*ENCODER_PERIOD) && (woPreviousEdge!=woNextEdge))
	{
		woPreviousEdge = woNextEdge;
		woNextEdge =  STI_NextEdge(woPreviousEdge);
		if (woNextEdge - woPreviousEdge > woHalfGateInEncoder)
		{
			parametersSet(PARAM_ENC_GATE01_REFERENCE, woNextEdge & (ENCODER_PERIOD-1));
			STI_ExecutePrecalculation();
			//Segno trovato
			return TRUE;		
		}
	}
	return FALSE;
		
	
}


/*****************************************************************************/	
BYTE STI_MarkCylinderAutomaticPhaseComplex(void)
{
	WORD arwoEdges[3];
	BYTE byEdgeCount = 0;

	WORD woPreviousEdge;
	WORD woNextEdge;

	WORD woEncoderInMillimiter; /*TODO fare assignemnt */
	WORD woHalfGateInEncoder;

	arwoEdges[0] = -1;
	arwoEdges[1] = -1;
	arwoEdges[2] = -1;

	
	woHalfGateInEncoder = convertEncoder(parametersGetValue(PARAM_ENC_GATE01_END) - parametersGetValue(PARAM_ENC_GATE01_START)) /2;
	
	woEncoderInMillimiter = (WORD)(1/m_dblMillimeterInEncoderPulse);
	
	woPreviousEdge=1;
	woNextEdge = 0;
	while ((woPreviousEdge<2*ENCODER_PERIOD) && (woPreviousEdge!=woNextEdge))
	{
		woPreviousEdge = woNextEdge;
		woNextEdge =  STI_NextEdge(woPreviousEdge);
		if (woNextEdge - woPreviousEdge > woHalfGateInEncoder)
		{
			arwoEdges[0] = woNextEdge & (ENCODER_PERIOD-1);
			arwoEdges[1] = STI_NextEdge(arwoEdges[0]);
			arwoEdges[2] = STI_NextEdge(arwoEdges[1]);
			
			if(
				(arwoEdges[1] - arwoEdges[0] < woHalfGateInEncoder) && 
				(arwoEdges[2] - arwoEdges[1] > woHalfGateInEncoder) 
			  )
			{
			
				parametersSet(PARAM_ENC_GATE01_REFERENCE, arwoEdges[0] );
				STI_ExecutePrecalculation();
				//Segno trovato
				return TRUE;		
			}			
			else
			{
				woNextEdge = arwoEdges[1];
			}
			
		}
	}
	
	return FALSE;
}



/*****************************************************************************/	
// Function to be deleted
/*****************************************************************************/	
BYTE STI_MarkCylinderAutomaticPhaseOld(void)
{
	WORD j;
	WORD i;
	WORD woCounter = 0x0000;
	BYTE bySignal;
	BYTE byOldSignal;
	WORD woEncoderInMillimiter; /*TODO fare assignemnt */
	WORD woHalfGateInEncoder;
	
	woHalfGateInEncoder = convertEncoder(parametersGetValue(PARAM_ENC_GATE01_END) - parametersGetValue(PARAM_ENC_GATE01_START)) /2;
	
	woEncoderInMillimiter = (WORD)(1/m_dblMillimeterInEncoderPulse);
	
	for(j=0; j<2*ENCODER_PERIOD; j++)
	{
		i = j & (ENCODER_PERIOD-1);
		switch ((BYTE)(i & 0x0003)) //0b00000011 -->  Byte Index
		{
			case 0:
				bySignal = m_arbyScanningHeadSignal[i/4] & 0b11000000;
				break;
			case 1:
				bySignal = m_arbyScanningHeadSignal[i/4] & 0b00110000;
				break;
			case 2:
				bySignal = m_arbyScanningHeadSignal[i/4] & 0b00001100;
				break;
			case 3:
				bySignal = m_arbyScanningHeadSignal[i/4] & 0b00000011;
				break;
		}
		
		//if ((bySignal > 0) && (byOldSignal = 0)) || ((bySignal = 0) && (byOldSignal > 0)) 
		if ((bySignal > 0) ^ (byOldSignal > 0))
		{
			if (woCounter > woHalfGateInEncoder)
			{
				parametersSet(PARAM_ENC_GATE01_REFERENCE, i);
				STI_ExecutePrecalculation();
				//Segno trovato
				return TRUE;
			}
			woCounter = 0;
		}
		else
		{
			woCounter++;
		}
		byOldSignal = bySignal;
		
	}
	return FALSE;


}




/*****************************************************************************/	
WORD STI_NextEdge(WORD a_woEncoderPosition)
{
	WORD j;
	WORD i;
	BYTE bySignal;
	BYTE byOldSignal;

	a_woEncoderPosition	= a_woEncoderPosition & (ENCODER_PERIOD-1);
	switch ((BYTE)(a_woEncoderPosition & 0x0003)) //0b00000011 -->  Byte Index
	{
		case 0:
			byOldSignal = m_arbyScanningHeadSignal[a_woEncoderPosition/4] & 0b11000000;
			break;
		case 1:
			byOldSignal = m_arbyScanningHeadSignal[a_woEncoderPosition/4] & 0b00110000;
			break;
		case 2:
			byOldSignal = m_arbyScanningHeadSignal[a_woEncoderPosition/4] & 0b00001100;
			break;
		case 3:
			byOldSignal = m_arbyScanningHeadSignal[a_woEncoderPosition/4] & 0b00000011;
			break;
	}	
	
	
	for(j=a_woEncoderPosition+1; j<2*ENCODER_PERIOD; j++)
	{
		i = j & (ENCODER_PERIOD-1);
		switch ((BYTE)(i & 0x0003)) //0b00000011 -->  Byte Index
		{
			case 0:
				bySignal = m_arbyScanningHeadSignal[i/4] & 0b11000000;
				break;
			case 1:
				bySignal = m_arbyScanningHeadSignal[i/4] & 0b00110000;
				break;
			case 2:
				bySignal = m_arbyScanningHeadSignal[i/4] & 0b00001100;
				break;
			case 3:
				bySignal = m_arbyScanningHeadSignal[i/4] & 0b00000011;
				break;
		}
		
		//if ((bySignal > 0) && (byOldSignal = 0)) || ((bySignal = 0) && (byOldSignal > 0)) 
		if ((bySignal > 0) ^ (byOldSignal > 0))
		{
			return j;
		}
	}

	return a_woEncoderPosition;

}


/*****************************************************************************/	
BYTE STI_MarkMarkAutomaticPhase(void)
{
/*
	unsigned char i1;
	unsigned char i2;
	unsigned char i3;

	//unsigned char i;
	unsigned int woValueStart1;
	unsigned int woValueStart2;
	unsigned int woValueLength1;
	unsigned int woValueLength2;
	unsigned int woValueLength3;

	i1 = m_ucSignalPhasePointer;
	i2 = ((unsigned char) (m_ucSignalPhasePointer-1)) % SIGNAL_PHASE_COUNT;
	i3 = ((unsigned char) (m_ucSignalPhasePointer-2)) % SIGNAL_PHASE_COUNT;

	woValueStart1 = 	(m_arwoSignalPhaseStart[i1] - m_arwoSignalPhaseStart[i2]) % (ENCODER_PERIOD*4);
	woValueStart2 = 	(m_arwoSignalPhaseStart[i2] - m_arwoSignalPhaseStart[i3]) % (ENCODER_PERIOD*4);

	woValueLength1 = 	(m_arwoSignalPhaseEnd[i1] - m_arwoSignalPhaseStart[i1]) % (ENCODER_PERIOD*4);
	woValueLength2 = 	(m_arwoSignalPhaseEnd[i2] - m_arwoSignalPhaseStart[i2]) % (ENCODER_PERIOD*4);
	woValueLength3 = 	(m_arwoSignalPhaseEnd[i3] - m_arwoSignalPhaseStart[i3]) % (ENCODER_PERIOD*4);


	if 
		   ( //Mark Type C
			(woValueStart1 == 2*woValueLength2) && 
			(woValueStart2 == 2*woValueLength3) && 
			(woValueStart2 == woValueLength1)
		   )
	{

		if(m_arycSignalPositionInMarks[0]==1)
		{
			m_arwoGateStart[PULSE_QEI][0] = (m_arwoSignalPhaseStart[i1] + woValueLength1 + 2) % (ENCODER_PERIOD*4);
		}
		else
		{
			m_arwoGateStart[PULSE_QEI][0] = (m_arwoSignalPhaseStart[i1] + woValueLength1 + ( woValueLength1 * 5 * (m_arycSignalPositionInMarks[0]-1)) - 1 ) % (ENCODER_PERIOD*4);
		}
		m_arwoGateEnd[PULSE_QEI][0]   = (m_arwoSignalPhaseStart[i1] + woValueLength1 + ( woValueLength1 * 5 * (m_arycSignalPositionInMarks[0]))   - 2) % (ENCODER_PERIOD*4);
	

		if(m_arycSignalPositionInMarks[1]==1)
		{
			m_arwoGateStart[PULSE_QEI][1] = (m_arwoSignalPhaseStart[i1] + woValueLength1 + 2) % (ENCODER_PERIOD*4);
		}
		else
		{
			m_arwoGateStart[PULSE_QEI][1] = (m_arwoSignalPhaseStart[i1] + woValueLength1 + ( woValueLength1 * 5 * (m_arycSignalPositionInMarks[1]-1)) -1 ) % (ENCODER_PERIOD*4);
		}
		m_arwoGateEnd[PULSE_QEI][1]   = (m_arwoSignalPhaseStart[i1] + woValueLength1 + ( woValueLength1 * 5 * (m_arycSignalPositionInMarks[1]))   - 2) % (ENCODER_PERIOD*4);

		return PHASE_COMPLETED;
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
	
		return PHASE_COMPLETED;
	}
	else
	{
		m_ucSignalPhasePointer = ((unsigned char)(m_ucSignalPhasePointer + 1)) % SIGNAL_PHASE_COUNT;
		//m_arwoSignalPhaseStart[(m_ucSignalPhasePointer-2) % SIGNAL_PHASE_COUNT] = m_arwoSignalPhaseStart[(m_ucSignalPhasePointer-1) % SIGNAL_PHASE_COUNT];
		//m_arwoSignalPhaseStart[(m_ucSignalPhasePointer-1) % SIGNAL_PHASE_COUNT] = m_arwoSignalPhaseStart[(m_ucSignalPhasePointer)   % SIGNAL_PHASE_COUNT];
		return PHASE_ACQUISITION;
	}
*/
	m_ucSteps = STEP_PHASE_MM;
	return FALSE;
}
