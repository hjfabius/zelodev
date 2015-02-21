// MarkInfo.h
#include "definition.h"

#ifndef MARKINFO_H
	#define MARKINFO_H

	using namespace std;

	class MarkInfo   {

	private:
		bool	m_blnChanged;
		//void	fromIntToString(int a_intVal, char * a_strBuf);

	public:
		int		m_intMarkNumber;
		int		m_intMarkPage;
		bool	m_blnIsBaseColor;

		int		m_intLongitudinalIdealPosition; //Used only if reference color
		int		m_intLongitudinalDeltaPosition; //Used if not reference color
		int		m_intLongitudinalCurrentPosition;
		int		m_intLongitudinalPreviousPosition;
				
		int		m_intLateralIdealPosition; //Used only if reference color
		int		m_intLateralDeltaPosition; //Used if not reference color
		int		m_intLateralCurrentPosition;
		int		m_intLateralPreviousPosition;

		void	init();
		bool	requireToBeSent();
		void	positionSent();
		void	setCurrentPosition(int a_intLongitudinalPosition, int a_intLateralPosition);
		void	setIdealPosition(int a_intLongitudinalPosition, int a_intLateralPosition);

		int		getLateralPosition(int a_intReferenceLateralPosition);
		int		getLongitudinalPosition(int a_intReferenceLongitudinalPosition);
		void	getMarkString(string * a_strMark);
	};

#endif
