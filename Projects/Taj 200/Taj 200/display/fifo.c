#include "fifo.h"

#define FIFO_BUFFER 32

static BYTE m_arbyFifoBuffer[FIFO_BUFFER];
static BYTE m_byFifoLength;

/*---------------------------------------------------------------------------*/
void FIFO_Init(void)
{
	BYTE i = FIFO_BUFFER;
	while(i>0)
	{
		m_arbyFifoBuffer[--i]=0x00;
	}
	m_byFifoLength = 0x00;
}

/*---------------------------------------------------------------------------*/
void FIFO_PutByte(BYTE a_byData)
{
	m_arbyFifoBuffer[m_byFifoLength++] = a_byData;
}

/*---------------------------------------------------------------------------*/
BYTE FIFO_GetByte(void)
{
	BYTE i = m_byFifoLength;
	BYTE byResult;

	byResult = m_arbyFifoBuffer[0];
	for(i=0; i<m_byFifoLength; i++)
	{
		m_arbyFifoBuffer[i]= m_arbyFifoBuffer[i+1];
	}
	
	m_byFifoLength--;
	return byResult;
}

/*---------------------------------------------------------------------------*/
BYTE FIFO_GetLength(void)
{
	return m_byFifoLength;
}

/*---------------------------------------------------------------------------*/
