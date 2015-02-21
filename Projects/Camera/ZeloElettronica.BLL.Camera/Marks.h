// Marks.h
#include "definition.h"
	
#ifndef MARKS_H
	#define MARKS_H

//char:			8 or more 
//short:		16 or more 
//int:			16 or more 
//long:			32 or more 
//float:		32 bit floating point 
//double:		64 bit floating point 
//long double:	80/96 bit floating point. 


	using namespace std;

	class Marks   {

	private:
		bool	m_blnChanged;
		int		m_intPositionIdeal[MAX_MULTIPLEX_VALUE];
		int		m_intPositionAbsolute[MAX_MULTIPLEX_VALUE];
		int		m_intPositionReferenceAbsolute[MAX_MULTIPLEX_VALUE];
		int		m_strFlags[MAX_MULTIPLEX_VALUE];
		int		m_intPage;
		int		m_intID;
		int		m_intReferenceID;
		Marks * m_ptrReferenceMark;

	public:
				Marks();
		void	init();
		bool	isChanged();
		bool	isUsed();
		bool	isReference();
		void	parametersSent();

		void	setParameters(char * a_strMessage, int a_intOffset);
		void	setParameters(int a_intNumber, int a_intMultiplex, int a_intPage, int a_intPosition, int a_intReferenceID, int a_intFlags);
		void	getParameters(char a_intMultiplex, char * a_strMessage, int a_intOffset);
		void	setPointerToReferenceMark(Marks * a_ptrReferenceMark);

		int		getNumber();
		int		getPage();
		int		getReferenceID();
		char	getFlags(char a_intMultiplex);

		int		getPositionAbsolute(char a_intMultiplex);
		int		getPositionAbsoluteOnReference(char a_intMultiplex);

		void	setPositionAbsolute(char a_intMultiplex, int a_intPositionAbsolute);
	};

#endif
