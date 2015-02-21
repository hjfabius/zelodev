// Marks.cc
#include "Marks.h"

using namespace std;


/*******************************************************************/
Marks::Marks()
{
	init();
}

/*******************************************************************/
void Marks::init()
{
	m_blnChanged	= true;
	m_intID			= -1;
	m_intPage		= 0x0000;
	m_intReferenceID= -MESSAGE_ID_BASE;
	m_ptrReferenceMark = null;
	for(int i=(MAX_MULTIPLEX_VALUE-1); i>=0; i--)
	{
		m_intPositionAbsolute[i] = -1;
		m_strFlags[i] = 0x00;
	}
}


/*******************************************************************/
bool Marks::isChanged()
{
	if(isReference())
	{
		return m_blnChanged;
	}
	else
	{
		return m_blnChanged || m_ptrReferenceMark->isChanged();
	}
}


/*******************************************************************/
bool Marks::isUsed()
{
	return (m_intID != -1);
}


/*******************************************************************/
bool Marks::isReference()
{
	return 	m_intReferenceID==-MESSAGE_ID_BASE;
}


/*******************************************************************/
void Marks::parametersSent()
{
	m_blnChanged = false;
}


/*******************************************************************/
void Marks::setParameters(char * a_strMessage, int a_intOffset)
{
	if(((a_strMessage[a_intOffset + MESSAGE_IDX_MULTIPLEX]+256)%256) == MESSAGE_MULTIPLEX_LATERAL)
	{
	setParameters(
					((a_strMessage[a_intOffset + MESSAGE_IDX_ID2]+256)%256)-MESSAGE_ID_BASE, 
					MULTIPLEX_LATERAL,
					((a_strMessage[a_intOffset + MESSAGE_IDX_PAGE]+256)%256)	  + (((a_strMessage[a_intOffset + MESSAGE_IDX_PAGE+1]+256)%256)*256),
					((a_strMessage[a_intOffset + MESSAGE_IDX_POSITION]+256)%256)  + (((a_strMessage[a_intOffset + MESSAGE_IDX_POSITION+1]+256)%256)*256),
					((a_strMessage[a_intOffset + MESSAGE_IDX_REFERENCE_ID]+256)%256)-MESSAGE_ID_BASE,
					((a_strMessage[a_intOffset + MESSAGE_IDX_FLAGS]+256)%256)
				 );
	}
	else
	{
	setParameters(
					((a_strMessage[a_intOffset + MESSAGE_IDX_ID2]+256)%256)-MESSAGE_ID_BASE, 
					MULTIPLEX_LONGITUDINAL,
					((a_strMessage[a_intOffset + MESSAGE_IDX_PAGE]+256)%256)	  + (((a_strMessage[a_intOffset + MESSAGE_IDX_PAGE+1]+256)%256)*256),
					((a_strMessage[a_intOffset + MESSAGE_IDX_POSITION]+256)%256)  + (((a_strMessage[a_intOffset + MESSAGE_IDX_POSITION+1]+256)%256)*256),
					((a_strMessage[a_intOffset + MESSAGE_IDX_REFERENCE_ID]+256)%256)-MESSAGE_ID_BASE,
					((a_strMessage[a_intOffset + MESSAGE_IDX_FLAGS]+256)%256)
				 );
	}
}


/*******************************************************************/
void Marks::setParameters(int a_intNumber, int a_intMultiplex, int a_intPage, int a_intPosition, int a_intReferenceID, int a_intFlags)
{
	m_intID									= a_intNumber;
	m_intPositionAbsolute[a_intMultiplex]	= a_intPosition;
	m_strFlags			 [a_intMultiplex]	= a_intFlags;
	m_intPage								= a_intPage;
	m_intReferenceID						= a_intReferenceID;
#ifdef WRITE_DEBUG_INFO_COMMUNICATION
	if (a_intMultiplex==MULTIPLEX_LATERAL)
		printf("Mark=%d, Lateral     ,  Page=%d, RefID=%d, Flags=%d, AbsPos=%d\n", m_intID, m_intPage, m_intReferenceID, m_strFlags[a_intMultiplex], m_intPositionAbsolute[a_intMultiplex]);
	else
		printf("Mark=%d, Longitudinal,  Page=%d, RefID=%d, Flags=%d, AbsPos=%d\n", m_intID, m_intPage, m_intReferenceID, m_strFlags[a_intMultiplex], m_intPositionAbsolute[a_intMultiplex]);
#endif
}



/*******************************************************************/
void Marks::getParameters(char a_intMultiplex, char * a_strMessage, int a_intOffset)
{
	int intPosition;
	int intAbsPosition;

	if(isReference())
	{
		//absolute position + virtual zero (to manage negative numbers)
		intPosition = m_intPositionAbsolute[a_intMultiplex] + MESSAGE_VIRTUAL_0;
	}
	else
	{
		//absolute position - reference absolute position + virtual zero (to manage negative numbers)
		intPosition = m_intPositionAbsolute[a_intMultiplex]- m_ptrReferenceMark->getPositionAbsolute(a_intMultiplex) + MESSAGE_VIRTUAL_0;
	}

	//absolute position + virtual 0 (to manage negative numbers althougth it is not possible for absolute position) 
	intAbsPosition = m_intPositionAbsolute[a_intMultiplex] + MESSAGE_VIRTUAL_0;



	a_strMessage[a_intOffset + MESSAGE_IDX_ID1]					= 0x02;
	a_strMessage[a_intOffset + MESSAGE_IDX_ID2]					= MESSAGE_ID_BASE + m_intID;

	if (a_intMultiplex==MULTIPLEX_LATERAL)
		a_strMessage[a_intOffset + MESSAGE_IDX_MULTIPLEX]		= MESSAGE_MULTIPLEX_LATERAL;
	else
		a_strMessage[a_intOffset + MESSAGE_IDX_MULTIPLEX]		= MESSAGE_MULTIPLEX_LONGITUDINAL;
	
	a_strMessage[a_intOffset + MESSAGE_IDX_MULTIPLEX+1]			= 0x00;
	
	a_strMessage[a_intOffset + MESSAGE_IDX_POSITION]			= intPosition%256;
	a_strMessage[a_intOffset + MESSAGE_IDX_POSITION+1]			= intPosition/256;
	a_strMessage[a_intOffset + MESSAGE_IDX_ABSOLUTE_POSITION]	= intAbsPosition%256;
	a_strMessage[a_intOffset + MESSAGE_IDX_ABSOLUTE_POSITION+1]	= intAbsPosition/256;

#ifdef WRITE_DEBUG_INFO_COMMUNICATION
	if (a_intMultiplex==MULTIPLEX_LATERAL)
		printf("Mark=%d, Lateral     ,  Position=%d, \tAbsPos=%d\n", m_intID, intPosition - MESSAGE_VIRTUAL_0, intAbsPosition - MESSAGE_VIRTUAL_0);
	else
		printf("Mark=%d, Longitudinal,  Position=%d, \tAbsPos=%d\n", m_intID, intPosition - MESSAGE_VIRTUAL_0, intAbsPosition - MESSAGE_VIRTUAL_0);
#endif
}


/*******************************************************************/
void Marks::setPointerToReferenceMark(Marks * a_ptrReferenceMark)
{
	m_ptrReferenceMark = a_ptrReferenceMark;
}



/*******************************************************************/
int Marks::getNumber()
{
	return m_intID;
}


/*******************************************************************/
int Marks::getPage()
{
	return m_intPage;
}


/*******************************************************************/
int Marks::getReferenceID()
{
	return m_intReferenceID;
}


/*******************************************************************/
char Marks::getFlags(char a_intMultiplex)
{
	return m_strFlags[a_intMultiplex];
}


/*******************************************************************/
int	Marks::getPositionAbsolute(char a_intMultiplex)
{
	return m_intPositionAbsolute[a_intMultiplex];
}


/*******************************************************************/
int	Marks::getPositionAbsoluteOnReference(char a_intMultiplex)
{
	return m_intPositionAbsolute[a_intMultiplex] - m_ptrReferenceMark->getPositionAbsolute(a_intMultiplex);
}


/*******************************************************************/
void Marks::setPositionAbsolute(char a_intMultiplex, int a_intPositionAbsolute)
{
	if(	m_intPositionAbsolute[a_intMultiplex] != a_intPositionAbsolute)
	{
		m_intPositionAbsolute[a_intMultiplex] = a_intPositionAbsolute;
		m_blnChanged = true;
	}
}
