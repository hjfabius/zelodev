#include "scanningHeadSignal.h"



/*****************************************************************************/
// Variables declaration
/*****************************************************************************/
	BYTE 		m_arbyScanningHeadSignal[(ENCODER_PULSES/4)];
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
	WORD woResult;
	BYTE byGate = 0x00;
	BYTE i;
	
	for(i=0;i<4;i++)
	{
		while(_btst(_Pa_EncoderAB, _Pin_EncoderAB));
		while(!_btst(_Pa_EncoderAB, _Pin_EncoderAB));
		while(_btst(_Pa_EncoderAB, _Pin_EncoderAB));
		while(!_btst(_Pa_EncoderAB, _Pin_EncoderAB));
		while(_btst(_Pa_EncoderAB, _Pin_EncoderAB));
		while(!_btst(_Pa_EncoderAB, _Pin_EncoderAB));
		while(_btst(_Pa_EncoderAB, _Pin_EncoderAB));
		while(!_btst(_Pa_EncoderAB, _Pin_EncoderAB));
		if(_btst(_Pa_Encoder0, _Pin_Encoder0))
		{
			byGate++;
		}
	}
	
	if(byGate>2)
	{
		woResult = 0x0001;
	}
	else
	{
		woResult = 0x0000;
	}
	
	
	
	STI_SendMessage(STI_FUNZ_WRITE_PARAM, STI_PARAM_ZERO_ENCODER, woResult);
	parametersSet(PARAM_ENCODER_NP, STI_GetMessage(STI_PARAM_ZERO_ENCODER));
}


/*****************************************************************************/
void scanningHeadSignalAcquireGate(void)
{
	BYTE byGate;
	BYTE byPrevGate;
	BYTE byFoundIndex;
	
	BYTE i;
	
	double ardblValue[5];
	
	i = 1;
	
	ardblValue[0] = STI_GetMessage(STI_PARAM_PHASE_START)/4; 	//Expressed in 4096 on Z80
	ardblValue[1] = STI_GetMessage(STI_PARAM_CYLINDER_TRAVEL)/10; 
	ardblValue[2] = STI_GetMessage(STI_PARAM_GATE_WINDOW);
	ardblValue[3] = (WORD)((ardblValue[2] / ardblValue[1])*1024);
	ardblValue[4] = (ENCODER_PULSES + (WORD)ardblValue[0] + (WORD)ardblValue[3])&(ENCODER_PULSES-1);	
	
	m_woEncoderGateStart 	= (ENCODER_PULSES + (WORD)(ardblValue[0]) - 8) &(ENCODER_PULSES-1);;
	m_woEncoderGateEnd 		= (ENCODER_PULSES + (WORD)(ardblValue[4]) - 8)&(ENCODER_PULSES-1);
	
	m_woEncoderGateWidth = (WORD) ardblValue[3];
}


/*****************************************************************************/
void scanningHeadSignalAcquire(void)
{
	BYTE byScanningHeadValue	  = 0x00;
	BYTE byPointerIncrement		  = 0xFF;
	WORD woLoopIndex			  = 0x0000;
	m_byScanningHeadSignalPointer = m_arbyScanningHeadSignal;
	
	if(displayIsKeyPressed()) return;
	
	while((woLoopIndex<100)&&(!displayIsKeyPressed()))
	{
		if (parametersGetValue(PARAM_ENCODER_NP)==0x0001)
		{
			m_woEncoderZeroLoop = 0x0000;
			while((m_woEncoderZeroLoop<3)&& (!displayIsKeyPressed()))
			{
				while(_btst(_Pa_Encoder0, _Pin_Encoder0) && (!displayIsKeyPressed()) );
				while(!_btst(_Pa_Encoder0, _Pin_Encoder0)&& (!displayIsKeyPressed())) {m_woEncoderZeroLoop++;};
			}
			
			while (_btst(_Pa_Encoder0, _Pin_Encoder0) && (!displayIsKeyPressed()))
			{
				
				while(m_byScanningHeadSignalPointer>=(m_arbyScanningHeadSignal+(ENCODER_PULSES/4))){};
				if _btst(_Pa_Encoder0, _Pin_Encoder0)
				{
					ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4				// enables the A/D peripheral on Scanning Head
					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
					m_byScanningHeadValue += (byScanningHeadValue & 0b11000000)>>6;
					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
					(*m_byScanningHeadSignalPointer) = m_byScanningHeadValue;
					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
					m_byScanningHeadSignalPointer++;			
					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
					while(!(ADCCSR & EOC)&& (_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
					byScanningHeadValue = ADCDRH;
				}
				
		
				while(m_byScanningHeadSignalPointer>=(m_arbyScanningHeadSignal+(ENCODER_PULSES/4))){};
				if _btst(_Pa_Encoder0, _Pin_Encoder0)
				{
					ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4				// enables the A/D peripheral on Scanning Head
					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
					m_byScanningHeadValue = byScanningHeadValue & 0b11000000;
					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
					while(!(ADCCSR & EOC)&& (_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
					byScanningHeadValue = ADCDRH;
				}
		
				while(m_byScanningHeadSignalPointer>=(m_arbyScanningHeadSignal+(ENCODER_PULSES/4))){};
				if _btst(_Pa_Encoder0, _Pin_Encoder0)
				{
					ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4				// enables the A/D peripheral on Scanning Head
					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
					byScanningHeadValue = (byScanningHeadValue & 0b11000000)>>2;
					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
					m_byScanningHeadValue += byScanningHeadValue;
					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
					while(!(ADCCSR & EOC)&& (_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
					byScanningHeadValue = ADCDRH;
				}
		
				while(m_byScanningHeadSignalPointer>=(m_arbyScanningHeadSignal+(ENCODER_PULSES/4))){};
				if _btst(_Pa_Encoder0, _Pin_Encoder0)
				{
					ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4				// enables the A/D peripheral on Scanning Head
					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
					byScanningHeadValue = (byScanningHeadValue & 0b11000000)>>4;
					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
					m_byScanningHeadValue += byScanningHeadValue;
					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
					while(!(ADCCSR & EOC)&& (_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
					byScanningHeadValue = ADCDRH;
				}
				woLoopIndex++;
			}
		}
		else
		{
			m_woEncoderZeroLoop =0x0000;
			while((m_woEncoderZeroLoop<3)&& (!displayIsKeyPressed()))
			{
				while(!_btst(_Pa_Encoder0, _Pin_Encoder0)&& (!displayIsKeyPressed()));
				while(_btst(_Pa_Encoder0, _Pin_Encoder0)&& (!displayIsKeyPressed())){m_woEncoderZeroLoop++;};
			}
			
			while (!_btst(_Pa_Encoder0, _Pin_Encoder0)&& (!displayIsKeyPressed()) && byPointerIncrement-->0)
			{
				//while(m_byScanningHeadSignalPointer>=(m_arbyScanningHeadSignal+(ENCODER_PULSES/4))){};
				if (!_btst(_Pa_Encoder0, _Pin_Encoder0))
				{
					ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4				// enables the A/D peripheral on Scanning Head
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
					m_byScanningHeadValue += (byScanningHeadValue & 0b11000000)>>6;
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
					(*m_byScanningHeadSignalPointer) = m_byScanningHeadValue;
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
					m_byScanningHeadSignalPointer++;			
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
					while(!(ADCCSR & EOC)&& (_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
					byScanningHeadValue = ADCDRH;
				}
		
				//while(m_byScanningHeadSignalPointer>=(m_arbyScanningHeadSignal+(ENCODER_PULSES/4))){};
				if (!_btst(_Pa_Encoder0, _Pin_Encoder0))
				{
					ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4				// enables the A/D peripheral on Scanning Head
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
					m_byScanningHeadValue = byScanningHeadValue & 0b11000000;
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
					while(!(ADCCSR & EOC)&& (_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
					byScanningHeadValue = ADCDRH;
				}
		
				//while(m_byScanningHeadSignalPointer>=(m_arbyScanningHeadSignal+(ENCODER_PULSES/4))){};
				if (!_btst(_Pa_Encoder0, _Pin_Encoder0))
				{
					ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4				// enables the A/D peripheral on Scanning Head
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
					byScanningHeadValue = (byScanningHeadValue & 0b11000000)>>2;
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
					m_byScanningHeadValue += byScanningHeadValue;
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
					while(!(ADCCSR & EOC)&& (_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
					byScanningHeadValue = ADCDRH;
				}
		
				//while(m_byScanningHeadSignalPointer>=(m_arbyScanningHeadSignal+(ENCODER_PULSES/4))){};
				if (!_btst(_Pa_Encoder0, _Pin_Encoder0))
				{
					ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4				// enables the A/D peripheral on Scanning Head
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
					byScanningHeadValue = (byScanningHeadValue & 0b11000000)>>4;
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
					m_byScanningHeadValue += byScanningHeadValue;
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
					while(!(ADCCSR & EOC)&& (_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
					byScanningHeadValue = ADCDRH;
				}
				woLoopIndex++;
			}		
		}
	}
}