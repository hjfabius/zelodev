#include "scanningHeadSignal.h"



/*****************************************************************************/
// Variables declaration
/*****************************************************************************/
	BYTE	*	m_byScanningHeadSignalPointer;
	BYTE 		m_byScanningHeadValue;
	WORD 		m_woEncoderGateStart;
	WORD 		m_woEncoderGateEnd;
	BYTE 	*	m_arbyEncoderSignals[4];
	BYTE	*	m_arbyEncoderGate[16];
	WORD 		m_woEncoderGateWidth;
	WORD		m_woEncoderZeroLoop;

/*****************************************************************************/
// Functions declaration
/*****************************************************************************/

/*****************************************************************************/
void scanningHeadSignalEncoderAutoSet(void)
{
	BYTE byGate = 0x00;
	BYTE i;
	
	for(i=0;i<4;i++)
	{
		while(PIN_ENCODER_A);
		while(!PIN_ENCODER_A);
		while(PIN_ENCODER_A);
		while(!PIN_ENCODER_A);
		while(PIN_ENCODER_A);
		while(!PIN_ENCODER_A);
		while(PIN_ENCODER_A);
		while(!PIN_ENCODER_A);
		if(PIN_ENCODER_0)
		{
			byGate++;
		}
	}
	
	if(byGate>2)
	{
		parametersSet(PARAM_ENCODER_NP,0x0001);
	}
	else
	{
		parametersSet(PARAM_ENCODER_NP,0x0000);
	}
	
}


/*****************************************************************************/
void scanningHeadSignalAcquireGate(void)
{
	/*
	double ardblValue[5];
	
	
	ardblValue[0] = parametersGetValue(PARAM_GATE01_START); 	
	ardblValue[1] = parametersGetValue(PARAM_CYLINDER_TRAVEL)/10; 
	ardblValue[2] = parametersGetValue(PARAM_GATE_WINDOW);
	ardblValue[3] = (WORD)((ardblValue[2] / ardblValue[1])*ENCODER_PERIOD);
	ardblValue[4] = convertEncoder(ardblValue[0] + ardblValue[3]);	
	
	m_woEncoderGateStart 	= convertEncoder(ardblValue[0] - 8);;
	m_woEncoderGateEnd 		= convertEncoder(ardblValue[4] - 8);
	
	m_woEncoderGateWidth = (WORD) ardblValue[3];

	
	*/
	
	m_woEncoderGateStart = parametersGetValue(PARAM_ENC_GATE01_START); 	
	m_woEncoderGateEnd 	 = parametersGetValue(PARAM_ENC_GATE01_END); 	
	m_woEncoderGateWidth = convertEncoder(m_woEncoderGateEnd-m_woEncoderGateStart);
	
}	

