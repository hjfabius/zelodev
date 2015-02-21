// MarksManager.cc
#include "MarksManager.h"

using namespace std;


/*******************************************************************/
MarksManager::MarksManager()
{
	m_blnInitialized = false;
}


/*******************************************************************/
void MarksManager::init()
{
	m_intNumMarks = 0;
	for(int i=0; i<MAX_NUM_MARKS;i++)
	{
		m_arobjMarks[i].init();
	}
}


/*******************************************************************/
bool MarksManager::requireToBeSent()
{
	for (int i=0; i<m_intNumMarks; i++)
	{
		if(m_arobjMarks[i].isChanged())
		{
			return true;
		}
	}
	return false;
}


/*******************************************************************/
int MarksManager::getNumMarks()
{
	return m_intNumMarks;
}


/*******************************************************************/
void MarksManager::setParameters(char * a_strMessage)
{
	int intID;
	for(int i=0; i<MAX_NUM_MARKS;i++)
	{

		//If ID1 != 0x00  
		if(a_strMessage[(i*COM_SINGLE_MESSAGE_LENGTH) + MESSAGE_IDX_ID1] != COM_EMPTY_PARAMETER)
		{
			m_intNumMarks++;
			intID = ((a_strMessage[(i*COM_SINGLE_MESSAGE_LENGTH) + MESSAGE_IDX_ID2]+256) % 256) - MESSAGE_ID_BASE;
			if((intID>=0) && (intID<MAX_NUM_MARKS))
			{
				m_arobjMarks[ intID ].setParameters(a_strMessage, i*COM_SINGLE_MESSAGE_LENGTH);
			}
			else
			{
				throw runtime_error("50007"); // "Mark parameter's index out of bounds"
			}
		}
	}

	for(int i=0; i<MAX_NUM_MARKS;i++)
	{
		if(m_arobjMarks[i].isUsed() && !m_arobjMarks[i].isReference())
		{
			m_arobjMarks[i].setPointerToReferenceMark(&(m_arobjMarks[m_arobjMarks[i].getReferenceID()]));
		}
	}
}


/*******************************************************************/
void MarksManager::getCurrentPositions(char * a_strMessage, char a_intMultiplex)
{
	for(int i=0; i<MAX_NUM_MARKS;i++)
	{
		
		if (m_arobjMarks[i].isUsed() && m_arobjMarks[i].isChanged())
		{
			m_arobjMarks[i].getParameters(a_intMultiplex, a_strMessage, i*COM_SINGLE_MESSAGE_LENGTH);
		}
		else
		{
			a_strMessage[(i*COM_SINGLE_MESSAGE_LENGTH)+ MESSAGE_IDX_ID1] = COM_EMPTY_PARAMETER;
		}
	}
}


/*******************************************************************/
void MarksManager::parametersSent()
{
	for(int i=0; i<MAX_NUM_MARKS;i++)
	{
		m_arobjMarks[i].parametersSent();
	}
}
