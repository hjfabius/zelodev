#include "scanningHeadSignal.h"



/*****************************************************************************/
// Variables declaration
/*****************************************************************************/
	BYTE 		m_arbyScanningHeadSignal[ENCODER_PULSES];
	BYTE	*	m_byScanningHeadSignalPointer;
	BYTE 		m_byScanningHeadValue;
	WORD 		m_arwoEncoderGateStart[2];
	WORD 		m_arwoEncoderGateEnd[2];
	WORD 		m_arwoEncoderGateWidth[2];
	BYTE 	*	m_arbyEncoderSignals[4];
	BYTE	*	m_arbyEncoderGate[64];
	BYTE 		arbyLoop[4];
	BYTE		m_woEncoderGateHiLow;

/*****************************************************************************/
// Functions declaration
/*****************************************************************************/
void scanningHeadSignalWaitEncoder(void);



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
void scanningHeadSignalTestEncoderZero(void)
{
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
	
	m_woEncoderGateHiLow = (byGate>2);
	
	if(m_woEncoderGateHiLow)
	{
		while(_btst(_Pa_Encoder0, _Pin_Encoder0));
		while(!_btst(_Pa_Encoder0, _Pin_Encoder0));
	}
	else
	{
		while(!_btst(_Pa_Encoder0, _Pin_Encoder0));
		while(_btst(_Pa_Encoder0, _Pin_Encoder0));
	}

	

}

/*****************************************************************************/
WORD scanningHeadSignalTestEncoderAB(void)
{
	WORD woResult;
	arbyLoop[0] = 0x00;
	arbyLoop[1] = 0x00;
	arbyLoop[2] = 0x00;
	arbyLoop[3] = 0x00;
	
	
	if (m_woEncoderGateHiLow)
	{
		while(_btst(_Pa_Encoder0, _Pin_Encoder0));
		while(!_btst(_Pa_Encoder0, _Pin_Encoder0));
	
		while (_btst(_Pa_Encoder0, _Pin_Encoder0))
		{
			while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
			while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
			while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
			while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
			arbyLoop[0]++;
			while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
			while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
			while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
			while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
			arbyLoop[1]++;
			while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
			while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
			while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
			while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
			arbyLoop[2]++;
			while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
			while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
			while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
			while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
			arbyLoop[3]++;
		}
	}
	else
	{
		while(!_btst(_Pa_Encoder0, _Pin_Encoder0));
		while(_btst(_Pa_Encoder0, _Pin_Encoder0));
	
		while (!_btst(_Pa_Encoder0, _Pin_Encoder0))
		{
			while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
			while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
			while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
			while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
			arbyLoop[0]++;
			while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
			while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
			while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
			while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
			arbyLoop[1]++;
			while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
			while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
			while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
			while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
			arbyLoop[2]++;
			while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
			while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
			while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
			while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
			arbyLoop[3]++;
		}		
	}
	
	woResult =  (WORD) arbyLoop[0];
	woResult += (WORD) arbyLoop[1];
	woResult += (WORD) arbyLoop[2];
	woResult += (WORD) arbyLoop[3];
	return woResult;
}


/*****************************************************************************/
void scanningHeadSignalAcquireGate(void)
{
	BYTE byGate				= false;
	BYTE byPrevGate			= false;
	BYTE byFoundIndex		= 0;
	
	BYTE i					= 64;
	
	m_arwoEncoderGateStart[0] 	= 0xFFFF;
	m_arwoEncoderGateEnd[0] 		= 0xFFFF;
	///m_woEncoderSignals		= 0x0000;
	m_arbyEncoderSignals[0]	= 0x00;
	m_arbyEncoderSignals[1]	= 0x00;
	m_arbyEncoderSignals[2]	= 0x00;
	m_arbyEncoderSignals[3]	= 0x00;
	
	while(i-->0)
	{
		m_arbyEncoderGate[i] = 0x00;
	}
		
	
	if (m_woEncoderGateHiLow)
	{
		while(_btst(_Pa_Encoder0, _Pin_Encoder0)&& !displayIsKeyPress());
		while(!_btst(_Pa_Encoder0, _Pin_Encoder0)&& !displayIsKeyPress());
	}
	else
	{
		while(!_btst(_Pa_Encoder0, _Pin_Encoder0)&& !displayIsKeyPress());
		while(_btst(_Pa_Encoder0, _Pin_Encoder0)&& !displayIsKeyPress());
	}
	
	if (!displayIsKeyPress())
	{
		if (m_woEncoderGateHiLow)
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
		}
		else
		{
			while (!_btst(_Pa_Encoder0, _Pin_Encoder0))
			{
				if (!_btst(_Pa_Encoder0, _Pin_Encoder0))
				{
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
					byPrevGate = byGate;
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
					byGate = _btst(_Pa_Gate, _Pin_Gate);
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
					m_arbyEncoderSignals[0]++;
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
					if(byPrevGate != byGate)
					{
						m_arbyEncoderGate[byFoundIndex]   = m_arbyEncoderSignals[0];
						m_arbyEncoderGate[byFoundIndex+1] = m_arbyEncoderSignals[1];
						m_arbyEncoderGate[byFoundIndex+2] = m_arbyEncoderSignals[2];
						m_arbyEncoderGate[byFoundIndex+3] = m_arbyEncoderSignals[3];
						byFoundIndex+=4;
					}
				}
		
				if (!_btst(_Pa_Encoder0, _Pin_Encoder0))
				{
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
					byPrevGate = byGate;
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
					byGate = _btst(_Pa_Gate, _Pin_Gate);
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
					m_arbyEncoderSignals[1]++;
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
					if(byPrevGate != byGate)
					{
						m_arbyEncoderGate[byFoundIndex]   = m_arbyEncoderSignals[0];
						m_arbyEncoderGate[byFoundIndex+1] = m_arbyEncoderSignals[1];
						m_arbyEncoderGate[byFoundIndex+2] = m_arbyEncoderSignals[2];
						m_arbyEncoderGate[byFoundIndex+3] = m_arbyEncoderSignals[3];
						byFoundIndex+=4;
					}			
				}
		
				if (!_btst(_Pa_Encoder0, _Pin_Encoder0))
				{
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
					byPrevGate = byGate;
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
					byGate = _btst(_Pa_Gate, _Pin_Gate);
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
					m_arbyEncoderSignals[2]++;
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
					if(byPrevGate != byGate)
					{
						m_arbyEncoderGate[byFoundIndex]   = m_arbyEncoderSignals[0];
						m_arbyEncoderGate[byFoundIndex+1] = m_arbyEncoderSignals[1];
						m_arbyEncoderGate[byFoundIndex+2] = m_arbyEncoderSignals[2];
						m_arbyEncoderGate[byFoundIndex+3] = m_arbyEncoderSignals[3];
						byFoundIndex+=4;
					}			
				}
		
				if (!_btst(_Pa_Encoder0, _Pin_Encoder0))
				{
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
					byPrevGate = byGate;
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
					byGate = _btst(_Pa_Gate, _Pin_Gate);
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
					m_arbyEncoderSignals[3]++;
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
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
		}
		
		i=4;
		m_arwoEncoderGateEnd[0] = 0x0000;
		while(i-->0)
		{
			m_arwoEncoderGateEnd[0] += (WORD) m_arbyEncoderGate[--byFoundIndex];
		}
		i=4;
		m_arwoEncoderGateStart[0] = 0x0000;
		while(i-->0)
		{
			m_arwoEncoderGateStart[0] += (WORD) m_arbyEncoderGate[--byFoundIndex];
		}
		
		m_arwoEncoderGateWidth[0] = MIN(m_arwoEncoderGateEnd[0]-m_arwoEncoderGateStart[0], ENCODER_PULSES-m_arwoEncoderGateEnd[0]+m_arwoEncoderGateStart[0]);
	
	
		if(m_arwoEncoderGateEnd[0]-m_arwoEncoderGateStart[0]>(ENCODER_PULSES-m_arwoEncoderGateEnd[0]+m_arwoEncoderGateStart[0]) &(ENCODER_PULSES-1))
		{
			m_arwoEncoderGateStart[0] = m_arwoEncoderGateEnd[0];
			m_arwoEncoderGateEnd[0] = (m_arwoEncoderGateEnd[0]+m_arwoEncoderGateWidth[0])&(ENCODER_PULSES-1);
		}
		
		m_arwoEncoderGateStart[0] = (ENCODER_PULSES + m_arwoEncoderGateStart[0] - 8) &(ENCODER_PULSES-1);
		m_arwoEncoderGateEnd[0] = (ENCODER_PULSES + m_arwoEncoderGateEnd[0] - 8)&(ENCODER_PULSES-1);
	
	}
}



/*****************************************************************************/
void scanningHeadSignalAcquireGateMM(void)
{
	BYTE byGate				= false;
	BYTE byPrevGate			= false;
	BYTE byFoundIndex		= 0;
	
	BYTE i					= 64;
	
	m_arwoEncoderGateStart 	= 0xFFFF;
	m_arwoEncoderGateEnd 		= 0xFFFF;
	///m_woEncoderSignals		= 0x0000;
	m_arbyEncoderSignals[0]	= 0x00;
	m_arbyEncoderSignals[1]	= 0x00;
	m_arbyEncoderSignals[2]	= 0x00;
	m_arbyEncoderSignals[3]	= 0x00;
	
	while(i-->0)
	{
		m_arbyEncoderGate[i] = 0x00;
	}
		
	
	if (m_woEncoderGateHiLow)
	{
		while(_btst(_Pa_Encoder0, _Pin_Encoder0)&& !displayIsKeyPress());
		while(!_btst(_Pa_Encoder0, _Pin_Encoder0)&& !displayIsKeyPress());
	}
	else
	{
		while(!_btst(_Pa_Encoder0, _Pin_Encoder0)&& !displayIsKeyPress());
		while(_btst(_Pa_Encoder0, _Pin_Encoder0)&& !displayIsKeyPress());
	}
	
	if (!displayIsKeyPress())
	{
		if (m_woEncoderGateHiLow)
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
		}
		else
		{
			while (!_btst(_Pa_Encoder0, _Pin_Encoder0))
			{
				if (!_btst(_Pa_Encoder0, _Pin_Encoder0))
				{
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
					byPrevGate = byGate;
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
					byGate = _btst(_Pa_Gate, _Pin_Gate);
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
					m_arbyEncoderSignals[0]++;
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
					if(byPrevGate != byGate)
					{
						m_arbyEncoderGate[byFoundIndex]   = m_arbyEncoderSignals[0];
						m_arbyEncoderGate[byFoundIndex+1] = m_arbyEncoderSignals[1];
						m_arbyEncoderGate[byFoundIndex+2] = m_arbyEncoderSignals[2];
						m_arbyEncoderGate[byFoundIndex+3] = m_arbyEncoderSignals[3];
						byFoundIndex+=4;
					}
				}
		
				if (!_btst(_Pa_Encoder0, _Pin_Encoder0))
				{
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
					byPrevGate = byGate;
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
					byGate = _btst(_Pa_Gate, _Pin_Gate);
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
					m_arbyEncoderSignals[1]++;
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
					if(byPrevGate != byGate)
					{
						m_arbyEncoderGate[byFoundIndex]   = m_arbyEncoderSignals[0];
						m_arbyEncoderGate[byFoundIndex+1] = m_arbyEncoderSignals[1];
						m_arbyEncoderGate[byFoundIndex+2] = m_arbyEncoderSignals[2];
						m_arbyEncoderGate[byFoundIndex+3] = m_arbyEncoderSignals[3];
						byFoundIndex+=4;
					}			
				}
		
				if (!_btst(_Pa_Encoder0, _Pin_Encoder0))
				{
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
					byPrevGate = byGate;
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
					byGate = _btst(_Pa_Gate, _Pin_Gate);
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
					m_arbyEncoderSignals[2]++;
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
					if(byPrevGate != byGate)
					{
						m_arbyEncoderGate[byFoundIndex]   = m_arbyEncoderSignals[0];
						m_arbyEncoderGate[byFoundIndex+1] = m_arbyEncoderSignals[1];
						m_arbyEncoderGate[byFoundIndex+2] = m_arbyEncoderSignals[2];
						m_arbyEncoderGate[byFoundIndex+3] = m_arbyEncoderSignals[3];
						byFoundIndex+=4;
					}			
				}
		
				if (!_btst(_Pa_Encoder0, _Pin_Encoder0))
				{
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
					byPrevGate = byGate;
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
					byGate = _btst(_Pa_Gate, _Pin_Gate);
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
					m_arbyEncoderSignals[3]++;
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
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
		}
		
		i=4;
		m_arwoEncoderGateEnd[1] = 0x0000;
		while((i-->0)&&(byFoundIndex>=0))
		{
			m_arwoEncoderGateEnd[1] += (WORD) m_arbyEncoderGate[--byFoundIndex];
		}
		i=4;
		m_arwoEncoderGateStart[1] = 0x0000;
		while((i-->0)&&(byFoundIndex>=0))
		{
			m_arwoEncoderGateStart[1] += (WORD) m_arbyEncoderGate[--byFoundIndex];
		}
		i=4;
		m_arwoEncoderGateEnd[0] = 0x0000;
		while((i-->0)&&(byFoundIndex>=0))
		{
			m_arwoEncoderGateEnd[0] += (WORD) m_arbyEncoderGate[--byFoundIndex];
		}
		i=4;
		m_arwoEncoderGateStart[0] = 0x0000;
		while((i-->0)&&(byFoundIndex>=0))
		{
			m_arwoEncoderGateStart[0] += (WORD) m_arbyEncoderGate[--byFoundIndex];
		}
		
		m_arwoEncoderGateWidth[1] = MIN(m_arwoEncoderGateEnd[1]-m_arwoEncoderGateStart[1], ENCODER_PULSES-m_arwoEncoderGateEnd[1]+m_arwoEncoderGateStart[1]);
		m_arwoEncoderGateWidth[0] = MIN(m_arwoEncoderGateEnd[0]-m_arwoEncoderGateStart[0], ENCODER_PULSES-m_arwoEncoderGateEnd[0]+m_arwoEncoderGateStart[0]);
	
	
		if(m_arwoEncoderGateEnd[1]-m_arwoEncoderGateStart[1]>(ENCODER_PULSES-m_arwoEncoderGateEnd[1]+m_arwoEncoderGateStart[1]) &(ENCODER_PULSES-1))
		{
			m_arwoEncoderGateStart[1] = m_arwoEncoderGateEnd[1];
			m_arwoEncoderGateEnd[1] = (m_arwoEncoderGateEnd[1]+m_arwoEncoderGateWidth[1])&(ENCODER_PULSES-1);
		}
		
		if(m_arwoEncoderGateEnd[0]-m_arwoEncoderGateStart[0]>(ENCODER_PULSES-m_arwoEncoderGateEnd[0]+m_arwoEncoderGateStart[0]) &(ENCODER_PULSES-1))
		{
			m_arwoEncoderGateStart[0] = m_arwoEncoderGateEnd[0];
			m_arwoEncoderGateEnd[0] = (m_arwoEncoderGateEnd[0]+m_arwoEncoderGateWidth[0])&(ENCODER_PULSES-1);
		}
		
		m_arwoEncoderGateStart = (ENCODER_PULSES + m_arwoEncoderGateStart - 8) &(ENCODER_PULSES-1);
		m_arwoEncoderGateEnd = (ENCODER_PULSES + m_arwoEncoderGateEnd - 8)&(ENCODER_PULSES-1);
	
	}
}


/*****************************************************************************/
void scanningHeadSignalAcquire(void)
{
	BYTE byScanningHeadValue	  = 0x00;;
	m_byScanningHeadSignalPointer = m_arbyScanningHeadSignal;
	
	if (m_woEncoderGateHiLow)
	{
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
	else
	{
		while(!_btst(_Pa_Encoder0, _Pin_Encoder0) && !displayIsKeyPress());
		while(_btst(_Pa_Encoder0, _Pin_Encoder0)&& !displayIsKeyPress());
		
		if (!displayIsKeyPress())
		{
			while (!_btst(_Pa_Encoder0, _Pin_Encoder0))
			{
				if (!_btst(_Pa_Encoder0, _Pin_Encoder0))
				{
					ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4							// enables the A/D peripheral on Scanning Head
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
					m_byScanningHeadValue += (byScanningHeadValue & 0b11000000)>>6;
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
					(*m_byScanningHeadSignalPointer) = m_byScanningHeadValue;
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
					m_byScanningHeadSignalPointer++;			
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
					while(!(ADCCSR & EOC)&& (!_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
					byScanningHeadValue = ADCDRH;
				}
		
				if (!_btst(_Pa_Encoder0, _Pin_Encoder0))
				{
					ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4							// enables the A/D peripheral on Scanning Head
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
					m_byScanningHeadValue = byScanningHeadValue & 0b11000000;
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
					while(!(ADCCSR & EOC)&& (!_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
					byScanningHeadValue = ADCDRH;
				}
		
				if (!_btst(_Pa_Encoder0, _Pin_Encoder0))
				{
					ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4							// enables the A/D peripheral on Scanning Head
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
					byScanningHeadValue = (byScanningHeadValue & 0b11000000)>>2;
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
					m_byScanningHeadValue += byScanningHeadValue;
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
					while(!(ADCCSR & EOC)&& (!_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
					byScanningHeadValue = ADCDRH;
				}
		
				if (!_btst(_Pa_Encoder0, _Pin_Encoder0))
				{
					ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4							// enables the A/D peripheral on Scanning Head
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
					byScanningHeadValue = (byScanningHeadValue & 0b11000000)>>4;
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
					m_byScanningHeadValue += byScanningHeadValue;
					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
					while(!(ADCCSR & EOC)&& (!_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
					byScanningHeadValue = ADCDRH;
				}
			}
		}		
	}
}