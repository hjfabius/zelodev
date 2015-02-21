// MarkInfo.cc
#include "MarkInfo.h"

using namespace std;

/*******************************************************************/
void MarkInfo::init()
{
	m_intMarkNumber    = -1;
	m_intMarkPage = 1;
	m_blnIsBaseColor = false;   

	m_intLongitudinalIdealPosition = 0; //Used only if reference color
	m_intLongitudinalDeltaPosition = 0; //Used if not reference color
	m_intLongitudinalCurrentPosition = 0;
	m_intLongitudinalPreviousPosition = 0;
	
	m_intLateralIdealPosition = 0; //Used only if reference color
	m_intLateralDeltaPosition = 0; //Used if not reference color
	m_intLateralCurrentPosition = 0;
	m_intLateralPreviousPosition = 0;

	m_blnChanged = true;
}	


/*******************************************************************/
void MarkInfo::setCurrentPosition(int a_intLongitudinalPosition, int a_intLateralPosition)
{
	m_intLongitudinalPreviousPosition = m_intLongitudinalCurrentPosition;
	m_intLateralPreviousPosition = m_intLateralCurrentPosition;

	if (m_intLongitudinalCurrentPosition != a_intLongitudinalPosition)
	{
		m_blnChanged = true;
		m_intLongitudinalCurrentPosition = a_intLongitudinalPosition;
	}
	
	if (m_intLateralCurrentPosition != a_intLateralPosition)
	{
		m_blnChanged = true;
		m_intLateralCurrentPosition = a_intLateralPosition;
	}
}


/*******************************************************************/
void MarkInfo::setIdealPosition(int a_intLongitudinalPosition, int a_intLateralPosition)
{
	m_intLongitudinalIdealPosition = a_intLongitudinalPosition;
	m_intLongitudinalDeltaPosition = a_intLongitudinalPosition;

	m_intLateralIdealPosition = a_intLateralPosition;
	m_intLateralDeltaPosition = a_intLateralPosition;

	if (m_intLongitudinalCurrentPosition == 0)
	{
		m_intLongitudinalCurrentPosition = a_intLongitudinalPosition;
	}

	if (m_intLateralCurrentPosition == 0)
	{
		m_intLateralCurrentPosition = a_intLateralPosition;
	}


	/*
	if (m_blnIsBaseColor)
	{
		m_intLongitudinalCurrentPosition = (a_intLongitudinalPosition - m_intLongitudinalIdealPosition) + m_intLongitudinalCurrentPosition;
		m_intLongitudinalIdealPosition = a_intLongitudinalPosition;
		m_intLongitudinalDeltaPosition = 0;

		m_intLateralCurrentPosition = (a_intLateralPosition - m_intLateralIdealPosition) + m_intLongitudinalCurrentPosition;
		m_intLateralIdealPosition = a_intLateralPosition;
		m_intLateralDeltaPosition = 0;
	}
	else
	{
		m_intLongitudinalCurrentPosition = (a_intLongitudinalPosition - m_intLongitudinalDeltaPosition) + m_intLongitudinalCurrentPosition;
		m_intLongitudinalIdealPosition = 0;
		m_intLongitudinalDeltaPosition = a_intLongitudinalPosition;

		m_intLateralCurrentPosition =  (a_intLateralPosition - m_intLongitudinalDeltaPosition) + m_intLongitudinalCurrentPosition;
		m_intLateralIdealPosition = 0;
		m_intLateralDeltaPosition = a_intLateralPosition;
	}
	*/
}


/*******************************************************************/
int MarkInfo::getLongitudinalPosition(int a_intReferenceLongitudinalPosition)
{
	if (m_blnIsBaseColor)
	{
		return m_intLongitudinalCurrentPosition;
	} 
	else
	{
		return m_intLongitudinalCurrentPosition - a_intReferenceLongitudinalPosition;
	}
}


/*******************************************************************/
int MarkInfo::getLateralPosition(int a_intReferenceLateralPosition)
{
	if (m_blnIsBaseColor)
	{
		return m_intLateralCurrentPosition;
	} 
	else
	{
		return m_intLateralCurrentPosition - a_intReferenceLateralPosition;
	}
}


/*******************************************************************/
void MarkInfo::positionSent()
{
	m_blnChanged = false;
}


/*******************************************************************/
bool MarkInfo::requireToBeSent()
{
	return m_blnChanged;
}


/*******************************************************************/
void MarkInfo::getMarkString(string * a_strMark)
{
	//#CAM_MARK_A_X_Y
	// Mark Number = A
	// Longitudinal Current Position = X
	// Lateral Current Position = Y

	ostringstream objoStringStream;
	objoStringStream << *a_strMark << m_intMarkNumber << '_' << m_intLongitudinalCurrentPosition << '_' << m_intLateralCurrentPosition;
	*a_strMark = objoStringStream.str();
}
