#include "scanningHeadSignal.h"



/*****************************************************************************/
// Variables declaration
/*****************************************************************************/
	BYTE 		m_arbyScanningHeadSignal[ENCODER_PULSES];
	BYTE	*	m_byScanningHeadSignalPointer;
	BYTE 		m_byScanningHeadValue;
	WORD 		m_woEncoderGateStart;
	WORD 		m_woEncoderGateEnd;
	BYTE 	*	m_arbyEncoderSignals[4];
	BYTE	*	m_arbyEncoderGate[16];
	WORD 		m_woEncoderGateWidth;

/*****************************************************************************/
// Functions declaration
/*****************************************************************************/
void scanningHeadSignalWaitEncoder(void);


/*****************************************************************************/
void scanningHeadSignalWaitEncoderZeroChannel(void)
{
	while(_btst(_Pa_Encoder0, _Pin_Encoder0));
	while(!_btst(_Pa_Encoder0, _Pin_Encoder0));
}

/*****************************************************************************/
void scanningHeadSignalWaitEncoder(void)
{
	while (!_btst(_Pa_EncoderAB, _Pin_EncoderAB))
	{
/*		if (m_enmKeyPressed == KEY_ANY_KEYS)
		{
			return;
		}
		WDGCR = 0xFF;			*/
		Nop();
	}
	while (_btst(_Pa_EncoderAB, _Pin_EncoderAB))
	{
		/*
		if (m_enmKeyPressed == KEY_ANY_KEYS)
		{
			return;
		}
		WDGCR = 0xFF;	*/
		Nop();
	}		
}

/*****************************************************************************/
void scanningHeadSignalAcquireGate(void)
{
	BYTE byGate				= false;
	BYTE byPrevGate			= false;
	BYTE byFoundIndex		= 0;
	
	BYTE i					= 16;
	
	m_woEncoderGateStart 	= 0xFFFF;
	m_woEncoderGateEnd 		= 0xFFFF;
	///m_woEncoderSignals		= 0x0000;
	m_arbyEncoderSignals[0]	= 0x00;
	m_arbyEncoderSignals[1]	= 0x00;
	m_arbyEncoderSignals[2]	= 0x00;
	m_arbyEncoderSignals[3]	= 0x00;
	
	while(i-->0)
	{
		m_arbyEncoderGate[i] = 0x00;
	}
		
	
	while(_btst(_Pa_Encoder0, _Pin_Encoder0)&& !displayIsKeyPress());
	while(!_btst(_Pa_Encoder0, _Pin_Encoder0)&& !displayIsKeyPress());
	
	if (!displayIsKeyPress())
	{
		while (_btst(_Pa_Encoder0, _Pin_Encoder0))
		{
			if _btst(_Pa_Encoder0, _Pin_Encoder0)
			{
				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
				byPrevGate = byGate;
				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
				byGate = _btst(_Pa_Gate, _Pin_Gate);
				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
				m_arbyEncoderSignals[0]++;
				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
				if(byPrevGate != byGate)
				{
					m_arbyEncoderGate[byFoundIndex]   = m_arbyEncoderSignals[0];
					m_arbyEncoderGate[byFoundIndex+1] = m_arbyEncoderSignals[1];
					m_arbyEncoderGate[byFoundIndex+2] = m_arbyEncoderSignals[2];
					m_arbyEncoderGate[byFoundIndex+3] = m_arbyEncoderSignals[3];
					byFoundIndex+=4;
				}
			}
	
			if _btst(_Pa_Encoder0, _Pin_Encoder0)
			{
				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
				byPrevGate = byGate;
				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
				byGate = _btst(_Pa_Gate, _Pin_Gate);
				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
				m_arbyEncoderSignals[1]++;
				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
				if(byPrevGate != byGate)
				{
					m_arbyEncoderGate[byFoundIndex]   = m_arbyEncoderSignals[0];
					m_arbyEncoderGate[byFoundIndex+1] = m_arbyEncoderSignals[1];
					m_arbyEncoderGate[byFoundIndex+2] = m_arbyEncoderSignals[2];
					m_arbyEncoderGate[byFoundIndex+3] = m_arbyEncoderSignals[3];
					byFoundIndex+=4;
				}			
			}
	
			if _btst(_Pa_Encoder0, _Pin_Encoder0)
			{
				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
				byPrevGate = byGate;
				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
				byGate = _btst(_Pa_Gate, _Pin_Gate);
				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
				m_arbyEncoderSignals[2]++;
				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
				if(byPrevGate != byGate)
				{
					m_arbyEncoderGate[byFoundIndex]   = m_arbyEncoderSignals[0];
					m_arbyEncoderGate[byFoundIndex+1] = m_arbyEncoderSignals[1];
					m_arbyEncoderGate[byFoundIndex+2] = m_arbyEncoderSignals[2];
					m_arbyEncoderGate[byFoundIndex+3] = m_arbyEncoderSignals[3];
					byFoundIndex+=4;
				}			
			}
	
			if _btst(_Pa_Encoder0, _Pin_Encoder0)
			{
				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
				byPrevGate = byGate;
				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
				byGate = _btst(_Pa_Gate, _Pin_Gate);
				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
				m_arbyEncoderSignals[3]++;
				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
				if(byPrevGate != byGate)
				{
					m_arbyEncoderGate[byFoundIndex]   = m_arbyEncoderSignals[0];
					m_arbyEncoderGate[byFoundIndex+1] = m_arbyEncoderSignals[1];
					m_arbyEncoderGate[byFoundIndex+2] = m_arbyEncoderSignals[2];
					m_arbyEncoderGate[byFoundIndex+3] = m_arbyEncoderSignals[3];
					byFoundIndex+=4;
				}
	
			}
		}
		
		i=4;
		m_woEncoderGateEnd = 0x0000;
		while(i-->0)
		{
			m_woEncoderGateEnd += (WORD) m_arbyEncoderGate[--byFoundIndex];
		}
		i=4;
		m_woEncoderGateStart = 0x0000;
		while(i-->0)
		{
			m_woEncoderGateStart += (WORD) m_arbyEncoderGate[--byFoundIndex];
		}
		
		m_woEncoderGateWidth = MIN(m_woEncoderGateEnd-m_woEncoderGateStart, ENCODER_PULSES-m_woEncoderGateEnd+m_woEncoderGateStart);
	
	
		if(m_woEncoderGateEnd-m_woEncoderGateStart>(ENCODER_PULSES-m_woEncoderGateEnd+m_woEncoderGateStart) &(ENCODER_PULSES-1))
		{
			m_woEncoderGateStart = m_woEncoderGateEnd;
			m_woEncoderGateEnd = (m_woEncoderGateEnd+m_woEncoderGateWidth)&(ENCODER_PULSES-1);
		}
		
		m_woEncoderGateStart = (ENCODER_PULSES + m_woEncoderGateStart - 8) &(ENCODER_PULSES-1);
		m_woEncoderGateEnd = (ENCODER_PULSES + m_woEncoderGateEnd - 8)&(ENCODER_PULSES-1);
	
	}
}


/*****************************************************************************/
void scanningHeadSignalAcquire(void)
{
	BYTE byScanningHeadValue	  = 0x00;;
	m_byScanningHeadSignalPointer = m_arbyScanningHeadSignal;
	
	while(_btst(_Pa_Encoder0, _Pin_Encoder0) && !displayIsKeyPress());
	while(!_btst(_Pa_Encoder0, _Pin_Encoder0)&& !displayIsKeyPress());
	
	if (!displayIsKeyPress())
	{
		while (_btst(_Pa_Encoder0, _Pin_Encoder0))
		{
			if _btst(_Pa_Encoder0, _Pin_Encoder0)
			{
				ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4							// enables the A/D peripheral on Scanning Head
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
	
			if _btst(_Pa_Encoder0, _Pin_Encoder0)
			{
				ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4							// enables the A/D peripheral on Scanning Head
				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
				m_byScanningHeadValue = byScanningHeadValue & 0b11000000;
				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
				while(!(ADCCSR & EOC)&& (_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
				byScanningHeadValue = ADCDRH;
			}
	
			if _btst(_Pa_Encoder0, _Pin_Encoder0)
			{
				ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4							// enables the A/D peripheral on Scanning Head
				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
				byScanningHeadValue = (byScanningHeadValue & 0b11000000)>>2;
				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
				m_byScanningHeadValue += byScanningHeadValue;
				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
				while(!(ADCCSR & EOC)&& (_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
				byScanningHeadValue = ADCDRH;
			}
	
			if _btst(_Pa_Encoder0, _Pin_Encoder0)
			{
				ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4							// enables the A/D peripheral on Scanning Head
				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
				byScanningHeadValue = (byScanningHeadValue & 0b11000000)>>4;
				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
				m_byScanningHeadValue += byScanningHeadValue;
				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
				while(!(ADCCSR & EOC)&& (_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
				byScanningHeadValue = ADCDRH;
			}
		}
	}
}